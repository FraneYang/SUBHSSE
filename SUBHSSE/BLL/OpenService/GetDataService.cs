using Newtonsoft.Json.Linq;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace BLL
{
    public static class GetDataService
    {      

        #region 培训计划提交后 按照培训任务 生成培训人员的培训教材明细
        /// <summary>
        /// 生成培训人员的培训教材明细
        /// </summary>
        /// <param name="taskId"></param>
        public static void CreateTrainingTaskItemByTaskId(string taskId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                /////查找未生成教材明细的 培训任务
                var getTasks = from x in db.Training_Task
                           where x.States == Const.State_0 && (x.TaskId == taskId || taskId == null)
                           select x;
                if (getTasks.Count() > 0)
                {
                    foreach (var item in getTasks)
                    {
                        var getPerson = db.SitePerson_Person.FirstOrDefault(e => e.PersonId == item.UserId); 
                        if (getPerson != null)
                        {
                            ////获取计划下 人员培训教材明细
                            var getDataList = db.Sp_GetTraining_TaskItemTraining(item.PlanId, getPerson.WorkPostId);
                            foreach (var dataItem in getDataList)
                            {
                                Model.Training_TaskItem newTaskItem = new Model.Training_TaskItem
                                {
                                    TaskId = item.TaskId,
                                    PlanId = item.PlanId,
                                    PersonId = item.UserId,
                                    TrainingItemCode = dataItem.TrainingItemCode,
                                    TrainingItemName = dataItem.TrainingItemName,
                                    AttachUrl = dataItem.AttachUrl,
                                };

                                var getTaskItem = db.Training_TaskItem.FirstOrDefault(x => x.TaskId == item.TaskId && x.TrainingItemName == newTaskItem.TrainingItemName && x.AttachUrl == newTaskItem.AttachUrl);
                                if (getTaskItem == null)
                                {
                                    newTaskItem.TaskItemId = SQLHelper.GetNewID();
                                    db.Training_TaskItem.InsertOnSubmit(newTaskItem);
                                    db.SubmitChanges();
                                }
                            }
                        }

                        ////更新培训任务
                        item.States = Const.State_1;
                        db.SubmitChanges();
                    }
                }
            }
        }
        #endregion

        #region 自动结束考试
        /// <summary>
        ///  自动结束考试
        /// </summary>
        public static void UpdateTestPlanStates()
        {
            Model.SUBHSSEDB db = Funs.DB;
            var getTestPlans = from x in db.Training_TestPlan
                               where x.States == "2" && x.TestEndTime.AddMinutes(x.Duration) < DateTime.Now
                               select x;
            if (getTestPlans.Count() > 0)
            {
                foreach (var item in getTestPlans)
                {
                    APITestPlanService.SubmitTest(item);
                    item.States = "3";
                    db.SubmitChanges();
                }
            }

            var getTrainingTestRecords = from x in db.Training_TestRecord
                                         where x.TestStartTime.Value.AddMinutes(x.Duration) < DateTime.Now 
                                         && (!x.TestEndTime.HasValue || !x.TestScores.HasValue)
                                         select x;
            foreach (var itemRecord in getTrainingTestRecords)
            {
                itemRecord.TestEndTime = itemRecord.TestStartTime.Value.AddMinutes(itemRecord.Duration);
                itemRecord.TestScores = db.Training_TestRecordItem.Where(x => x.TestRecordId == itemRecord.TestRecordId).Sum(x => x.SubjectScore) ?? 0;
                TestRecordService.UpdateTestRecord(itemRecord);
            }
        }
        #endregion

        #region 自动校正出入场人数及工时
        /// <summary>
        ///  自动校正出入场人数及工时
        /// </summary>
        public static void CorrectingPersonInOutNumber(string projectId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getProjects = (from x in db.Base_Project
                                   where x.ProjectState == null || x.ProjectState == BLL.Const.ProjectState_1
                                   orderby x.ProjectCode descending
                                   select x).ToList();
                if (!string.IsNullOrEmpty(projectId))
                {
                    getProjects = getProjects.Where(x => x.ProjectId == projectId).ToList();
                }
                foreach (var projectItem in getProjects)
                {
                    var getAllPersonInOutList = from x in db.SitePerson_PersonInOut
                                                where x.ProjectId == projectItem.ProjectId
                                                select x;
                    if (getAllPersonInOutList.Count() > 0)
                    {
                        #region 现场当前人员数
                        int SitePersonNum = 0;
                        var getAllPersonInOuts = from x in getAllPersonInOutList
                                                 join y in db.SitePerson_Person on x.PersonId equals y.PersonId
                                                 where y.IsUsed == true && (!y.OutTime.HasValue || y.OutTime >= DateTime.Now)
                                                 select x;
                        if (getAllPersonInOuts.Count() > 0)
                        {
                            var getIn = getAllPersonInOuts.Where(x => x.IsIn == true);
                            List<string> getPersonIds = new List<string>();
                            var getOutList = getAllPersonInOuts.Where(x => x.IsIn == false);
                            foreach (var item in getIn)
                            {
                                var getMax = getOutList.FirstOrDefault(x => x.PersonId == item.PersonId && x.ChangeTime >= item.ChangeTime);
                                if (getMax == null)
                                {
                                    if (getPersonIds.Count() == 0 || !getPersonIds.Contains(item.PersonId))
                                    {
                                        getPersonIds.Add(item.PersonId);
                                        SitePersonNum = SitePersonNum + 1;
                                    }
                                }
                            }
                        }
                        #endregion

                        //// 获取工时                  
                        int SafeHours = 0;
                        var getYesterday = db.SitePerson_PersonInOutNumber.FirstOrDefault(x => x.ProjectId == projectItem.ProjectId && x.InOutDate.Year == DateTime.Now.AddDays(-1).Year
                                                && x.InOutDate.Month == DateTime.Now.AddDays(-1).Month && x.InOutDate.Day == DateTime.Now.AddDays(-1).Day);
                        if (getYesterday != null)
                        {
                            SafeHours = (getYesterday.WorkHours ?? 0) * 60;
                            var getPersonOutTimes = from x in getAllPersonInOutList
                                                    where x.IsIn == false && x.ChangeTime.Value.Year == DateTime.Now.Year
                                                        && x.ChangeTime.Value.Month == DateTime.Now.Month && x.ChangeTime.Value.Day == DateTime.Now.Day
                                                    select x;
                            var getInLists = getAllPersonInOutList.Where(x => x.IsIn == true && x.ChangeTime.Value.AddDays(1) >= DateTime.Now);
                            List<string> personIdList = new List<string>();
                            foreach (var item in getPersonOutTimes)
                            {                               
                                var getMaxInTime = getInLists.Where(x => x.ChangeTime < item.ChangeTime && x.PersonId == item.PersonId).Max(x => x.ChangeTime);
                                if (getMaxInTime.HasValue)
                                {
                                    SafeHours += Convert.ToInt32((item.ChangeTime - getMaxInTime).Value.TotalMinutes);
                                }
                                else
                                {
                                    personIdList.Add(item.PersonId);
                                }
                            }
                            if (personIdList.Count() > 0)
                            {
                                SafeHours += (personIdList.Distinct().Count() * 8 * 60);
                            }
                        }
                        else
                        {
                            var getPersonOutTimes = from x in getAllPersonInOutList
                                                    where x.IsIn == false && x.ChangeTime <= DateTime.Now
                                                    select x;
                            var getInLists = getAllPersonInOutList.Where(x => x.IsIn == true);
                            List<string> personIdList = new List<string>();
                            foreach (var item in getPersonOutTimes)
                            {
                                var getMaxInTime = getInLists.Where(x => x.ChangeTime < item.ChangeTime
                                            && x.PersonId == item.PersonId && x.ChangeTime.Value.AddDays(1) >= DateTime.Now).Max(x => x.ChangeTime);
                                if (getMaxInTime.HasValue)
                                {
                                    SafeHours += Convert.ToInt32((item.ChangeTime - getMaxInTime).Value.TotalMinutes);
                                }
                                else
                                {
                                    personIdList.Add(item.PersonId);
                                }
                            }
                            if (personIdList.Count() > 0)
                            {
                                SafeHours += (personIdList.Distinct().Count() * 8 * 60);
                            }
                        }

                        SafeHours = Convert.ToInt32(SafeHours * 1.0 / 60);
                        var getPersonInOutNumber = db.SitePerson_PersonInOutNumber.FirstOrDefault(x => x.ProjectId == projectItem.ProjectId
                                                                            && x.InOutDate.Year == DateTime.Now.Year
                                                                            && x.InOutDate.Month == DateTime.Now.Month
                                                                            && x.InOutDate.Day == DateTime.Now.Day);
                        if (getPersonInOutNumber == null)
                        {
                            Model.SitePerson_PersonInOutNumber newNum = new Model.SitePerson_PersonInOutNumber
                            {
                                PersonInOutNumberId = SQLHelper.GetNewID(),
                                ProjectId = projectItem.ProjectId,
                                InOutDate = DateTime.Now,
                                PersonNum = SitePersonNum,
                                WorkHours = SafeHours,
                            };

                            db.SitePerson_PersonInOutNumber.InsertOnSubmit(newNum);
                            db.SubmitChanges();
                        }
                        else
                        {
                            getPersonInOutNumber.InOutDate = DateTime.Now;
                            getPersonInOutNumber.PersonNum = SitePersonNum;
                            getPersonInOutNumber.WorkHours = SafeHours;
                            db.SubmitChanges();
                        }
                    }
                }
            }
        }
        #endregion

        #region 自动批量生成人员二维码
        /// <summary>
        ///  自动校正出入场人数及工时
        /// </summary>
        public static void CreateQRCode()
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getPersons = from x in db.SitePerson_Person
                                 where x.IdentityCard != null && x.QRCodeAttachUrl == null
                                 select x;
                if (getPersons.Count() > 0)
                {
                    foreach (var item in getPersons)
                    {
                        string url = CreateQRCodeService.CreateCode_Simple("person$" + item.IdentityCard);
                        if (!string.IsNullOrEmpty(url))
                        {
                            item.QRCodeAttachUrl = url;
                            db.SubmitChanges();
                        }
                    }
                }
            }
        }
        #endregion

        #region 自动 出场人员 自动离场
        /// <summary>
        ///  自动校正出入场人数及工时
        /// </summary>
        public static void SitePersonjAutomaticOut()
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getPersons = from x in db.SitePerson_Person
                                 where x.OutTime < DateTime.Now && x.IsUsed ==true 
                                 select x;
                if (getPersons.Count() > 0)
                {
                    foreach (var item in getPersons)
                    {
                        item.IsUsed = false;
                        item.ExchangeTime2 = null;
                        db.SubmitChanges();
                    }
                }
            }
        }
        #endregion

        //#region 定时推送待办 订阅服务内容
        ///// <summary>
        ///// 定时推送待办 订阅服务内容
        ///// </summary>
        //public static void SendSubscribeMessage()
        //{
        //    try
        //    {
        //        string miniprogram_state = ConfigurationManager.AppSettings["miniprogram_state"];
        //        if (!string.IsNullOrEmpty(miniprogram_state) && miniprogram_state == "formal")
        //        {
        //            //// 获取所有待办事项
        //            var getToItems = from x in Funs.DB.View_APP_GetToDoItems select x;
        //            if (getToItems.Count() > 0)
        //            {
        //                //// 获取施工中的项目
        //                var getProjects = ProjectService.GetProjectWorkList();
        //                foreach (var item in getProjects)
        //                {
        //                    ////获取当前项目下的待办
        //                    var getPItems = getToItems.Where(x => x.ProjectId == item.ProjectId);
        //                    if (getPItems.Count() > 0)
        //                    {
        //                        foreach (var itemP in getPItems)
        //                        {
        //                            //"项目【" + item.ProjectCode + "】上有" + itemP.Counts.ToString() + "条待办事件，需要您处理！"
        //                            APICommonService.SendSubscribeMessage(itemP.UserId, "项目" + item.ProjectCode + "有待办", "施工信息管理", string.Format("{0:yyyy-MM-dd HH:mm:ss}", DateTime.Now));
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    { }
        //}

        //#endregion
    }
}
