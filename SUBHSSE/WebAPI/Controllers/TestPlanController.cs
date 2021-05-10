using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BLL;

namespace WebAPI.Controllers
{
    /// <summary>
    /// 考试计划记录
    /// </summary>
    public class TestPlanController : ApiController
    {
        #region 根据projectId、states获取考试计划列表
        /// <summary>
        /// 根据projectId、states获取考试计划列表
        /// </summary>
        /// <param name="projectId">项目ID</param>
        /// <param name="states">状态（0-待提交；1-已发布；2-考试中；3考试结束）</param>
        /// <param name="pageIndex">分页</param>
        /// <returns></returns>
        public Model.ResponeData getTestPlanListByProjectIdStates(string projectId, string states, int pageIndex)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getdata = APITestPlanService.getTestPlanListByProjectIdStates(projectId, states, pageIndex);
                int pageCount = APITestPlanService.getTestPlanListCount;
                responeData.data = new { pageCount, getdata };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-获取考试计划列表", "TestPlanController.getTestPlanListByProjectIdStates");
            }
            return responeData;
        }
        #endregion

        #region 根据考试计划ID获取考试详细
        /// <summary>
        ///  根据考试计划ID获取考试详细
        /// </summary>
        /// <param name="testPlanId">考试计划ID</param>
        /// <returns></returns>
        public Model.ResponeData getTestPlanByTestPlanId(string testPlanId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APITestPlanService.getTestPlanByTestPlanId(testPlanId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-获取考试详细", "TestPlanController.getTestPlanByTestPlanId");
            }

            return responeData;
        }
        #endregion

        #region 根据培训计划ID生成 考试计划信息
        /// <summary>
        ///  根据培训计划ID生成 考试计划信息
        /// </summary>
        /// <param name="trainingPlanId">培训计划ID</param>
        /// <param name="userId">用户ID</param>
        /// <returns></returns>
        public Model.ResponeData getSaveTestPlanByTrainingPlanId(string trainingPlanId, string userId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getTasks = new Model.SUBHSSEDB(Funs.ConnString).Training_Task.FirstOrDefault(x => x.PlanId == trainingPlanId);
                if (getTasks != null)
                {
                    if (CommonService.IsMainUnitOrAdmin(userId))
                    {
                        responeData.data = APITestPlanService.SaveTestPlanByTrainingPlanId(trainingPlanId, userId);
                    }
                    else
                    {
                        responeData.code = 0;
                        responeData.message = "非本单位用户，不能生成考试计划！";
                    }
                }
                else
                {
                    responeData.code = 0;
                    responeData.message = "培训计划下没有培训人员，不能生成考试计划！";
                }
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-生成考试计划信息", "TestPlanController.getSaveTestPlanByTrainingPlanId");
            }

            return responeData;
        }
        #endregion

        #region 保存 TestPlan [增加、修改]
        /// <summary>
        /// 保存TestPlan [增加、修改]
        /// </summary>
        /// <param name="testPlan">考试计划项目</param>
        [HttpPost]
        public Model.ResponeData SaveTestPlan([FromBody] Model.TestPlanItem testPlan)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.message = APITestPlanService.SaveTestPlan(testPlan);
                if (!string.IsNullOrEmpty(responeData.message))
                {
                    responeData.code = 2;
                }
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-保存考试计划", "TestPlanController.SaveTestPlan");
            }
            return responeData;
        }
        #endregion

        #region 根据TestPlanId获取考试试题类型列表
        /// <summary>
        /// 根据TestPlanId获取考试试题类型列表
        /// </summary>
        /// <param name="testPlanId">考试计划ID</param>
        /// <returns>试题类型</returns>
        public Model.ResponeData getTestPlanTrainingListByTestPlanId(string testPlanId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APITestPlanService.getTestPlanTrainingListByTestPlanId(testPlanId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-获取考试试题类型列表", "TestPlanController.getTestPlanTrainingListByTestPlanId");
            }
            return responeData;
        }
        #endregion

        #region 根据TestPlanId获取考试试题类型列表
        /// <summary>
        /// 根据TestPlanId获取考试试题类型列表
        /// </summary>
        /// <param name="testPlanId">考试计划ID</param>
        /// <returns>试题类型</returns>
        public Model.ResponeData getTestPlanTrainingListByTestPlanId2(string testPlanId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getDataList = APITestPlanService.getTestPlanTrainingListByTestPlanId(testPlanId);
                int pageCount = getDataList.Count();
                responeData.data = new { pageCount, getDataList };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-获取考试试题类型列表", "TestPlanController.getTestPlanTrainingListByTestPlanId2");
            }
            return responeData;
        }
        #endregion

        #region 根据PersonId、TestPlanId扫描考试计划二维码
        /// <summary>
        /// 根据PersonId、TestPlanId扫描考试计划二维码
        /// </summary>
        /// <param name="testPlanId">培训考试计划ID</param>
        /// <param name="personId">人员ID</param>
        /// <returns></returns>
        public Model.ResponeData getTestPlanRecordItemByTestPlanIdPersonId(string testPlanId, string personId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    var getTestPlan = db.Training_TestPlan.FirstOrDefault(e => e.TestPlanId == testPlanId && e.States != "3" 
                    && e.TestStartTime <= DateTime.Now && e.TestEndTime >= DateTime.Now);
                    if (getTestPlan != null)
                    {
                        var person = db.SitePerson_Person.FirstOrDefault(e => e.PersonId == personId);
                        if (person == null)
                        {
                            var getUser = db.Sys_User.FirstOrDefault(x => x.UserId == personId);
                            if (getUser != null && !string.IsNullOrEmpty(getUser.IdentityCard))
                            {
                                if (!string.IsNullOrEmpty(getTestPlan.ProjectId))
                                {
                                    person = db.SitePerson_Person.FirstOrDefault(e => e.IdentityCard == getUser.IdentityCard && e.ProjectId == getTestPlan.ProjectId);
                                }
                                else
                                {
                                    person = db.SitePerson_Person.FirstOrDefault(e => e.IdentityCard == getUser.IdentityCard && e.ProjectId == null);
                                }
                            }
                        }
                        else
                        {
                            if (person.ProjectId != getTestPlan.ProjectId)
                            {
                                responeData.code = 0;
                                responeData.message = "不是当前项目的考试计划";
                            }
                        }

                        if (person != null)
                        {
                            //2-考试中；生成考试试卷     
                            if (getTestPlan.States == "2")
                            {
                                var getTestRecord = db.Training_TestRecord.FirstOrDefault(x => x.TestPlanId == getTestPlan.TestPlanId && x.TestManId == person.PersonId && !x.TestEndTime.HasValue);
                                if (getTestRecord != null)
                                {
                                    if (!getTestRecord.TestStartTime.HasValue)
                                    {
                                        ////考试时长
                                        getTestRecord.Duration = getTestPlan.Duration;
                                        getTestRecord.TestStartTime = DateTime.Now;
                                        db.SubmitChanges();
                                    }

                                    ////当前人考试记录  未加入考试计划的 当考试开始扫码时 不允许再参与考试          
                                    var item = db.Training_TestRecordItem.FirstOrDefault(x => x.TestRecordId == getTestRecord.TestRecordId);
                                    if (item == null)
                                    {
                                        List<Model.Training_TestTrainingItem> getTestTrainingItemList = new List<Model.Training_TestTrainingItem>();
                                        var testPlanTrainings = from x in db.Training_TestPlanTraining
                                                                where x.TestPlanId == getTestPlan.TestPlanId
                                                                select x;
                                        //// 计划考试中单选、多选、判断题总数
                                        int sumTestType1Count = testPlanTrainings.Sum(x => x.TestType1Count) ?? 0;
                                        int sumTestType2Count = testPlanTrainings.Sum(x => x.TestType2Count) ?? 0;
                                        int sumTestType3Count = testPlanTrainings.Sum(x => x.TestType3Count) ?? 0;

                                        IQueryable<Model.Training_TestTrainingItem> getTestTrainingItemALLs = null;  
                                        ////获取类型下适合岗位试题集合
                                       // List<Model.Training_TestTrainingItem> getTestTrainingItemALLs = new List<Model.Training_TestTrainingItem>();
                                        if (!string.IsNullOrEmpty(getTestPlan.ProjectId))
                                        {
                                            getTestTrainingItemALLs = from x in db.Training_TestTrainingItem
                                                                       join y in db.Training_TestTraining on x.TrainingId equals y.TrainingId
                                                                       where y.ProjectId.Contains(getTestRecord.ProjectId) && x.TrainingId != null
                                                                       && (x.WorkPostIds == null || (x.WorkPostIds.Contains(person.WorkPostId) && person.WorkPostId != null))
                                                                       select x;
                                        }
                                        else
                                        {
                                            getTestTrainingItemALLs = from x in db.Training_TestTrainingItem
                                                                       join y in db.Training_TestTraining on x.TrainingId equals y.TrainingId
                                                                       where y.ProjectId == null && x.TrainingId != null
                                                                       && (x.WorkPostIds == null || (x.WorkPostIds.Contains(person.WorkPostId) && person.WorkPostId != null))
                                                                       select x;
                                        }

                                        foreach (var itemT in testPlanTrainings)
                                        {
                                            //// 获取类型下的题目
                                            var getTestTrainingItems = getTestTrainingItemALLs.Where(x => x.TrainingId == itemT.TrainingId);
                                            if (getTestTrainingItems.Count() > 0)
                                            {
                                                ////单选题
                                                var getSItem = getTestTrainingItems.Where(x => x.TestType == "1").OrderBy(x => Guid.NewGuid()).Take(itemT.TestType1Count ?? 1);
                                                if (getSItem.Count() > 0)
                                                {
                                                    getTestTrainingItemList.AddRange(getSItem);
                                                }
                                                ///多选题
                                                var getMItem = getTestTrainingItems.Where(x => x.TestType == "2").OrderBy(x => Guid.NewGuid()).Take(itemT.TestType2Count ?? 1);
                                                if (getMItem.Count() > 0)
                                                {
                                                    getTestTrainingItemList.AddRange(getMItem);
                                                }
                                                ///判断题
                                                var getJItem = getTestTrainingItems.Where(x => x.TestType == "3").OrderBy(x => Guid.NewGuid()).Take(itemT.TestType3Count ?? 1);
                                                if (getJItem.Count() > 0)
                                                {
                                                    getTestTrainingItemList.AddRange(getJItem);
                                                }
                                            }
                                        }
                                        //// 获取得到的单选题、多选题、判断题 数量
                                        int getDiffTestType1Count = sumTestType1Count - getTestTrainingItemList.Where(x => x.TestType == "1").Count();
                                        int getDiffTestType2Count = sumTestType2Count - getTestTrainingItemList.Where(x => x.TestType == "2").Count();
                                        int getDiffTestType3Count = sumTestType3Count - getTestTrainingItemList.Where(x => x.TestType == "3").Count();
                                        if (getDiffTestType1Count > 0 || getDiffTestType2Count > 0 || getDiffTestType3Count > 0)
                                        {
                                            var getTestTrainingItemNulls = getTestTrainingItemALLs.Where(x => x.WorkPostIds == null);
                                            if (getTestTrainingItemNulls.Count() > 0)
                                            {
                                                ////  通用且未选择的题目
                                                var getTestTrainingItemDiffs = getTestTrainingItemNulls.Except(getTestTrainingItemList);
                                                //// 单选题
                                                if (getDiffTestType1Count > 0)
                                                {
                                                    var getSItemD = getTestTrainingItemDiffs.Where(x => x.TestType == "1").OrderBy(x => Guid.NewGuid()).Take(getDiffTestType1Count);
                                                    if (getSItemD.Count() > 0)
                                                    {
                                                        getTestTrainingItemList.AddRange(getSItemD);
                                                    }
                                                }
                                                //// 多选题
                                                if (getDiffTestType2Count > 0)
                                                {
                                                    var getMItemD = getTestTrainingItemDiffs.Where(x => x.TestType == "2").OrderBy(x => Guid.NewGuid()).Take(getDiffTestType2Count);
                                                    if (getMItemD.Count() > 0)
                                                    {
                                                        getTestTrainingItemList.AddRange(getMItemD);
                                                    }
                                                }
                                                //// 判断题
                                                if (getDiffTestType3Count > 0)
                                                {
                                                    var getJItemD = getTestTrainingItemDiffs.Where(x => x.TestType == "3").OrderBy(x => Guid.NewGuid()).Take(getDiffTestType3Count);
                                                    if (getJItemD.Count() > 0)
                                                    {
                                                        getTestTrainingItemList.AddRange(getJItemD);
                                                    }
                                                }
                                            }
                                        }

                                        if (getTestTrainingItemList.Count() > 0)
                                        {
                                            string lang = Const.Languages_Chinese;
                                            if (!string.IsNullOrEmpty(person.Languages))
                                            {
                                                lang = person.Languages;
                                            }
                                            var getItems = from x in getTestTrainingItemList
                                                           select new Model.Training_TestRecordItem
                                                           {
                                                               TestRecordItemId = SQLHelper.GetNewID(),
                                                               TestRecordId = getTestRecord.TestRecordId,
                                                               TrainingItemName = x.TrainingItemName,
                                                               TrainingItemCode = x.TrainingItemCode,
                                                               Abstracts = (lang == Const.Languages_English ? x.AbstractsEng : (lang == Const.Languages_Russian ? x.AbstractsRussian : x.Abstracts)),
                                                               AttachUrl = x.AttachUrl,
                                                               TestType = x.TestType,
                                                               AItem = (lang == Const.Languages_English ? x.AItemEng : (lang == Const.Languages_Russian ? x.AItemRussian : x.AItem)),
                                                               BItem = (lang == Const.Languages_English ? x.BItemEng : (lang == Const.Languages_Russian ? x.BItemRussian : x.BItem)),
                                                               CItem = (lang == Const.Languages_English ? x.CItemEng : (lang == Const.Languages_Russian ? x.CItemRussian : x.CItem)),
                                                               DItem = (lang == Const.Languages_English ? x.DItemEng : (lang == Const.Languages_Russian ? x.DItemRussian : x.DItem)),
                                                               EItem = (lang == Const.Languages_English ? x.EItemEng : (lang == Const.Languages_Russian ? x.EItemRussian : x.EItem)),
                                                               AnswerItems = x.AnswerItems,
                                                               Score = x.TestType == "1" ? getTestPlan.SValue : (x.TestType == "2" ? getTestPlan.MValue : getTestPlan.JValue),
                                                           };

                                            db.Training_TestRecordItem.InsertAllOnSubmit(getItems);
                                            db.SubmitChanges();
                                        }
                                    }

                                    //  string testRecordId = APITestRecordService.CreateTestRecordItem(getTestPlan, getTestRecord.TestRecordId, person);
                                    responeData.code = 2;
                                    responeData.data = new { getTestRecord.TestRecordId };
                                }
                            }
                            else
                            {
                                if (string.IsNullOrEmpty(getTestPlan.PlanId) && getTestPlan.UnitIds.Contains(person.UnitId) && (getTestPlan.WorkPostIds == null || getTestPlan.WorkPostIds.Contains(person.WorkPostId)))
                                {
                                    //0-待提交；1-已发布未考试 将人员添加进考试记录                        
                                    var testTRecord = db.Training_TestRecord.FirstOrDefault(x => x.TestPlanId == testPlanId && x.TestManId == person.PersonId);
                                    if ((getTestPlan.States == "0" || getTestPlan.States == "1") && testTRecord == null && !string.IsNullOrEmpty(person.PersonId))
                                    {
                                        Model.Training_TestRecord newTestRecord = new Model.Training_TestRecord
                                        {
                                            TestRecordId = SQLHelper.GetNewID(),
                                            ProjectId = getTestPlan.ProjectId,
                                            TestPlanId = getTestPlan.TestPlanId,
                                            TestManId = person.PersonId,
                                            UnitId = person.UnitId,
                                        };
                                        TestRecordService.AddTestRecord(newTestRecord);
                                        responeData.code = 3;
                                        responeData.message = "您已加入考试计划！";
                                    }
                                }
                            }
                        }
                        else
                        {
                            responeData.code = 0;
                            responeData.message = "人员信息有误！";
                        }
                    }                   

                    if (responeData.code == 1)
                    {
                        //其他状态时 查看考试计划详细页
                        responeData.data = APITestPlanService.getTestPlanByTestPlanId(testPlanId);
                    }
                }
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-扫描考试计划二维码", "TestPlanController.getTestPlanRecordItemByTestPlanIdPersonId");
            }
            return responeData;
        }
        #endregion
    }
}
