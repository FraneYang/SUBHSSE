using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmitMapper;
using EmitMapper.MappingConfiguration;

namespace BLL
{
    public static class APITestRecordService
    {
        #region 根据TestPlanId获取考试试卷人员列表
        /// <summary>
        /// 根据TestPlanId获取考试人员列表
        /// </summary>
        /// <param name="testPlanId"></param>
        /// <returns>考试人员</returns>
        public static List<Model.TestRecordItem> getTestRecordListByTestPlanId(string testPlanId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = (from x in db.Training_TestRecord
                                    where x.TestPlanId == testPlanId
                                    orderby x.TestStartTime descending
                                    select new Model.TestRecordItem
                                    {
                                        TestRecordId = x.TestRecordId,
                                        ProjectId = x.ProjectId,
                                        TestPlanId = x.TestPlanId,
                                        TestManId = x.TestManId,
                                        TestManName = db.SitePerson_Person.FirstOrDefault(p => p.PersonId == x.TestManId).PersonName,
                                        TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                        TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                        TestScores = x.TestScores ?? 0,
                                        TestType = x.TestType,
                                        TemporaryUser = x.TemporaryUser,
                                    }).ToList();
                return getDataLists;
            }
        }
        #endregion

        #region 根据试卷ID获取试卷记录详细
        /// <summary>
        /// 根据试卷ID获取试卷记录详细
        /// </summary>
        /// <param name="testRecordId"></param>
        /// <returns></returns>
        public static Model.TestRecordItem getTestRecordByTestRecordId(string testRecordId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_TestRecord
                                   join y in db.Training_TestPlan on x.TestPlanId equals y.TestPlanId
                                   where x.TestRecordId == testRecordId
                                   select new Model.TestRecordItem
                                   {
                                       TestRecordId = x.TestRecordId,
                                       ProjectId = x.ProjectId,
                                       TestPlanId = x.TestPlanId,
                                       TestPlanName = y.PlanName,
                                       TestManId = x.TestManId,
                                       TestManName = db.SitePerson_Person.First(u => u.PersonId == x.TestManId).PersonName,
                                       TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                       TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                       TestPlanEndTime = x.TestStartTime.HasValue ? string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime.Value.AddMinutes(x.Duration)) : "",
                                       Duration = y.Duration,
                                       TestScores = x.TestScores ?? 0,
                                       TestType = x.TestType,
                                       TemporaryUser = x.TemporaryUser,
                                   };
                return getDataLists.FirstOrDefault();
            }
        }
        #endregion

        #region 根据PersonId、TestPlanId生成试卷 扫码生成试卷
        /// <summary>
        /// 根据PersonId、TestPlanId生成试卷 扫码生成试卷
        /// </summary>
        /// <param name="testPlanId"></param>
        /// <returns></returns>
        public static string CreateTestRecordItem(Model.Training_TestPlan getTestPlan, string testRecordId, Model.SitePerson_Person person)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getTestRecord = db.Training_TestRecord.FirstOrDefault(x => x.TestRecordId == testRecordId);
                if (getTestRecord != null && !getTestRecord.TestStartTime.HasValue)
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

                    ////获取类型下适合岗位试题集合
                    var getTestTrainingItemALLs = from x in db.Training_TestTrainingItem
                                                  where x.TrainingId != null && (x.WorkPostIds == null || (x.WorkPostIds.Contains(person.WorkPostId) && person.WorkPostId != null))
                                                  select x;
                    foreach (var itemT in testPlanTrainings)
                    {
                        //// 获取类型下的题目
                        var getTestTrainingItems = getTestTrainingItemALLs.Where(x => x.TrainingId == itemT.TrainingId).ToList();
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
                        var getTestTrainingItemNulls = getTestTrainingItemALLs.Where(x => x.WorkPostIds == null).ToList();
                        if (getTestTrainingItemNulls.Count() > 0)
                        {
                            /// 通用且未选择的题目
                            var getTestTrainingItemDiffs = getTestTrainingItemNulls.Except(getTestTrainingItemList).ToList();
                            ////单选题
                            if (getDiffTestType1Count > 0)
                            {
                                var getSItemD = getTestTrainingItemDiffs.Where(x => x.TestType == "1").OrderBy(x => Guid.NewGuid()).Take(getDiffTestType1Count);
                                if (getSItemD.Count() > 0)
                                {
                                    getTestTrainingItemList.AddRange(getSItemD);
                                }
                            }
                            ///多选题
                            if (getDiffTestType2Count > 0)
                            {
                                var getMItemD = getTestTrainingItemDiffs.Where(x => x.TestType == "2").OrderBy(x => Guid.NewGuid()).Take(getDiffTestType2Count);
                                if (getMItemD.Count() > 0)
                                {
                                    getTestTrainingItemList.AddRange(getMItemD);
                                }
                            }
                            ///判断题
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

                testRecordId = getTestRecord.TestRecordId;
            }
            return testRecordId;
        }
        #endregion

        #region 根据ProjectId、PersonId获取试卷列表
        public static int getTrainingTestRecordListCount
        {
            get;
            set;
        }
        /// <summary>
        /// 根据ProjectId、PersonId获取试卷列表
        /// </summary>
        /// <param name="projectId">项目ID</param>
        /// <param name="personId">人员ID(null查全部)</param>
        /// <returns>考试记录列表</returns>
        public static List<Model.TestRecordItem> getTrainingTestRecordListByProjectIdPersonId(string projectId, string personId, int pageIndex)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                string personName = PersonService.GetPersonNameById(personId);
                var getTestRecords = from x in db.Training_TestRecord
                                     where (x.ProjectId == projectId || (projectId == null && x.ProjectId == null)) && x.TestManId == personId && x.TestStartTime.HasValue
                                     orderby x.TestStartTime descending
                                     select x;
                getTrainingTestRecordListCount = getTestRecords.Count();
                if (getTrainingTestRecordListCount == 0)
                {
                    return null;
                }
                else
                {
                    if (pageIndex > 0)
                    {
                        return (from x in getTestRecords
                                join y in db.Training_TestPlan on x.TestPlanId equals y.TestPlanId
                                select new Model.TestRecordItem
                                {
                                    TestRecordId = x.TestRecordId,
                                    ProjectId = x.ProjectId,
                                    TestPlanId = x.TestPlanId,
                                    TestPlanName = y.PlanName,
                                    TestManId = x.TestManId,
                                    TestManName = personName,
                                    TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                    TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                    Duration = x.Duration,
                                    TestPlanEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime.Value.AddMinutes(x.Duration)),
                                    TotalScore = y.TotalScore ?? 0,
                                    TestScores = x.TestScores ?? 0,
                                    TestType = x.TestType,
                                    TemporaryUser = x.TemporaryUser,
                                }).Skip(Funs.PageSize * (pageIndex - 1)).Take(Funs.PageSize).ToList();
                    }
                    else
                    {
                        return (from x in getTestRecords
                                join y in db.Training_TestPlan on x.TestPlanId equals y.TestPlanId
                                select new Model.TestRecordItem
                                {
                                    TestRecordId = x.TestRecordId,
                                    ProjectId = x.ProjectId,
                                    TestPlanId = x.TestPlanId,
                                    TestPlanName = y.PlanName,
                                    TestManId = x.TestManId,
                                    TestManName = personName,
                                    TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                    TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                    Duration = x.Duration,
                                    TestPlanEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime.Value.AddMinutes(x.Duration)),
                                    TotalScore = y.TotalScore ?? 0,
                                    TestScores = x.TestScores ?? 0,
                                    TestType = x.TestType,
                                    TemporaryUser = x.TemporaryUser,
                                }).ToList();
                    }
                }
            }
        }
        #endregion

        #region 根据ProjectId、PersonId获取试卷列表
        /// <summary>
        /// 根据ProjectId、PersonId获取试卷列表
        /// </summary>
        /// <param name="projectId">项目ID</param>
        /// <returns>考试记录列表</returns>
        public static List<Model.TestRecordItem> getTrainingTestRecordListByProjectId(string projectId, string unitId, string workPostId, string strPass, string strParam)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                int PassingScore = SysConstSetService.getPassScore();
                var getDataLists = (from x in db.Training_TestRecord
                                    join y in db.Training_TestPlan on x.TestPlanId equals y.TestPlanId
                                    join z in db.SitePerson_Person on x.TestManId equals z.PersonId
                                    where (x.ProjectId == projectId || (projectId == null && x.ProjectId == null)) && x.TestStartTime.HasValue && x.TestEndTime.HasValue
                                    orderby x.TestStartTime descending
                                    select new Model.TestRecordItem
                                    {
                                        TestRecordId = x.TestRecordId,
                                        ProjectId = x.ProjectId,
                                        TestPlanId = x.TestPlanId,
                                        TestPlanName = y.PlanName,
                                        UnitId = z.UnitId,
                                        UnitName = getUnitName(z.UnitId),
                                        WorkPostId = z.WorkPostId,
                                        WorkPostName = db.Base_WorkPost.First(p => p.WorkPostId == z.WorkPostId).WorkPostName,
                                        TestManId = x.TestManId,
                                        TestManName = db.SitePerson_Person.FirstOrDefault(p => p.PersonId == x.TestManId).PersonName,
                                        TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                        TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                        Duration = x.Duration,
                                        TestPlanEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime.Value.AddMinutes(x.Duration)),
                                        TotalScore = y.TotalScore ?? 0,
                                        TestScores = x.TestScores ?? 0,
                                        TestType = x.TestType,
                                        TemporaryUser = x.TemporaryUser,
                                        PassScore = y.PassingScore ?? PassingScore,
                                    });
                if (!string.IsNullOrEmpty(unitId))
                {
                    getDataLists = getDataLists.Where(x => x.UnitId == unitId);
                }
                if (!string.IsNullOrEmpty(workPostId))
                {
                    getDataLists = getDataLists.Where(x => x.WorkPostId == workPostId);
                }
                if (!string.IsNullOrEmpty(strParam))
                {
                    getDataLists = getDataLists.Where(x => x.TestManName.Contains(strParam));
                }
                if (!string.IsNullOrEmpty(strPass))
                {
                    if (strPass == "0")
                    {
                        getDataLists = getDataLists.Where(x => x.TestScores < x.PassScore);
                    }
                    else
                    {
                        getDataLists = getDataLists.Where(x => x.TestScores >= x.PassScore);
                    }
                }
                return getDataLists.ToList();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="testManId"></param>
        /// <returns></returns>
        public static string getUnitName(string testManId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                string name = string.Empty;
                var getPerson = db.SitePerson_Person.FirstOrDefault(x => x.PersonId == testManId);
                if (getPerson != null)
                {
                    name = UnitService.GetUnitNameByUnitId(getPerson.UnitId);
                }
                return name;
            }
        }
        #endregion

        #region 根据TestRecordId获取试卷题目列表
        /// <summary>
        /// 记录数
        /// </summary>
        public static int geTestRecordItemCount
        {
            get;
            set;
        }

        /// <summary>
        /// 根据TestRecordId获取试卷题目列表
        /// </summary>
        /// <param name="testPlanId"></param>
        /// <returns>考试人员</returns>
        public static List<Model.TestRecordItemItem> getTestRecordItemListByTestRecordId(string testRecordId, int pageIndex)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getData = (from x in db.Training_TestRecordItem
                               where x.TestRecordId == testRecordId
                            orderby x.TestType, x.TrainingItemCode
                               select new Model.TestRecordItemItem
                               {
                                   TestRecordItemId = x.TestRecordItemId,
                                   TestRecordId = x.TestRecordId,
                                   TrainingItemCode = x.TrainingItemCode,
                                   TrainingItemName = x.TrainingItemName,
                                   Abstracts = x.Abstracts,
                                   AttachUrl = x.AttachUrl.Replace("\\", "/") ?? "",
                                   TestType = x.TestType,
                                   TestTypeName = x.TestType == "1" ? "单选题" : (x.TestType == "2" ? "多选题" : "判断题"),
                                   AItem = x.AItem ?? "",
                                   BItem = x.BItem ?? "",
                                   CItem = x.CItem ?? "",
                                   DItem = x.DItem ?? "",
                                   EItem = x.EItem ?? "",
                                   AnswerItems = x.AnswerItems ?? "",
                                   Score = x.Score ?? 0,
                                   SubjectScore = x.SubjectScore ?? 0,
                                   SelectedItem = x.SelectedItem ?? "",
                               });
                geTestRecordItemCount = getData.Count();
                if (geTestRecordItemCount == 0)
                {
                    return null;
                }
                else
                {
                    if (pageIndex > 0)
                    {
                        return getData.Skip(Funs.PageSize * (pageIndex - 1)).Take(Funs.PageSize).ToList();
                    }
                    else
                    {
                        return getData.ToList();
                    }
                }
            }
        }
        #endregion

        #region 根据TestRecordItemId获取试卷题目详细
        /// <summary>
        /// 根据TestRecordItemId获取试卷题目详细
        /// </summary>
        /// <param name="testRecordItemId"></param>
        /// <returns>考试人员</returns>
        public static Model.TestRecordItemItem geTestRecordItemByTestRecordItemId(string testRecordItemId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_TestRecordItem
                                   where x.TestRecordItemId == testRecordItemId
                                   select new Model.TestRecordItemItem
                                   {
                                       TestRecordItemId = x.TestRecordItemId,
                                       TestRecordId = x.TestRecordId,
                                       TrainingItemCode = x.TrainingItemCode,
                                       TrainingItemName = x.TrainingItemName,
                                       Abstracts = x.Abstracts,
                                       AttachUrl = x.AttachUrl.Replace("\\", "/") ?? "",
                                       TestType = x.TestType,
                                       TestTypeName = x.TestType == "1" ? "单选题" : (x.TestType == "2" ? "多选题" : "判断题"),
                                       AItem = x.AItem ?? "",
                                       BItem = x.BItem ?? "",
                                       CItem = x.CItem ?? "",
                                       DItem = x.DItem ?? "",
                                       EItem = x.EItem ?? "",
                                       AnswerItems = x.AnswerItems ?? "",
                                       Score = x.Score ?? 0,
                                       SubjectScore = x.SubjectScore ?? 0,
                                       SelectedItem = x.SelectedItem ?? "",
                                   };
                return getDataLists.FirstOrDefault();
            }
        }
        #endregion

        #region 根据TestRecordItemId、AnswerItems 考生答题
        /// <summary>
        /// 根据TestRecordItemId、AnswerItems 考生答题
        /// </summary>
        /// <param name="testRecordItemId"></param>
        /// <param name="answerItems"></param>
        public static void getTestRecordItemAnswerBySelectedItem(Model.Training_TestRecordItem getTItemT, string selectedItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getTItem = db.Training_TestRecordItem.FirstOrDefault(x => x.TestRecordItemId == getTItemT.TestRecordItemId);
                if (getTItem != null)
                {
                    getTItem.SubjectScore = 0;
                    getTItem.SelectedItem = selectedItem;
                    if (!string.IsNullOrEmpty(selectedItem))
                    {
                        if (getTItem.AnswerItems == selectedItem)
                        {
                            getTItem.SubjectScore = getTItem.Score ?? 0;
                        }
                        else
                        {
                            var listA = Funs.GetStrListByStr(getTItem.AnswerItems.ToUpper(), ',');
                            var listS = Funs.GetStrListByStr(selectedItem.ToUpper(), ',');
                            if (getTItem.TestType == "2" && listA.Count >= listS.Count)
                            {
                                int i = 0;
                                foreach (var item in listS)
                                {
                                    if (!listA.Contains(item))
                                    {
                                        i++;
                                        break;
                                    }
                                }
                                if (i == 0)
                                {
                                    if (listA.Count == listS.Count)
                                    {
                                        getTItem.SubjectScore = getTItem.Score ?? 0;
                                    }
                                    else
                                    {
                                        getTItem.SubjectScore = Convert.ToDecimal((getTItem.Score ?? 0) * 1.0 / 2);
                                    }
                                }
                            }
                        }
                    }
                    db.SubmitChanges();
                }
            }
        }
        #endregion

        #region 根据TestRecordId 提交试卷
        /// <summary>
        /// 根据TestRecordId 提交试卷
        /// </summary>
        /// <param name="testRecordId"></param>
        public static decimal getSubmitTestRecord(Model.Training_TestRecord testRecord)
        {
            decimal getCode = 0;
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getTestRecord = db.Training_TestRecord.FirstOrDefault(e => e.TestRecordId == testRecord.TestRecordId);
                /////试卷
                if (getTestRecord.TestStartTime.HasValue)
                {
                    getTestRecord.TestEndTime = DateTime.Now;
                    var getRItem = db.Training_TestRecordItem.Where(x => x.TestRecordId == getTestRecord.TestRecordId);
                    if (getRItem.Count() > 0)
                    {
                        getTestRecord.TestScores = getRItem.Sum(x => x.SubjectScore);
                    }
                    db.SubmitChanges();

                    getCode = getTestRecord.TestScores ?? 0;

                }
            }
            return getCode;
        }
        #endregion

        #region 考试计划完成 更新未交卷自动交卷
        /// <summary>
        ///  考试计划完成 更新未交卷自动交卷
        /// </summary>
        /// <param name="testPlanId"></param>
        public static void updateAll(string testPlanId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                //// 获取考试计划
                var getTestPlan = db.Training_TestPlan.FirstOrDefault(x => x.TestPlanId == testPlanId);
                if (getTestPlan != null)
                {
                    //// 获取参加考试 记录
                    var getAllTestRecords = db.Training_TestRecord.Where(x => x.TestPlanId == getTestPlan.TestPlanId);
                    if (getAllTestRecords.Count() > 0)
                    {
                        /// 参加考试人数
                        int testManCout = getAllTestRecords.Select(x => x.TestManId).Distinct().Count();
                        //// 获取培训计划人员
                        var getAllTrainingTasks = db.Training_Task.Where(x => x.PlanId == getTestPlan.PlanId);
                        //// 考试人数大于等于 培训人数
                        if (testManCout >= getAllTrainingTasks.Count())
                        {
                            ////所有人员 都交卷时 考试计划结束 状态置为3
                            var getAllTestRecord = getAllTestRecords.FirstOrDefault(x => !x.TestEndTime.HasValue);
                            if (getAllTestRecord == null)
                            {
                                var getTrainingTasks = getAllTrainingTasks.Where(x => x.States != "2" || x.States == null);
                                foreach (var item in getTrainingTasks)
                                {
                                    item.States = "2";
                                    db.SubmitChanges();
                                }
                                getTestPlan.States = "3";
                                db.SubmitChanges();
                                ////TODO 讲培训计划 考试记录 写入到培训记录
                                APITrainRecordService.InsertTrainRecord(getTestPlan);
                            }
                        }
                    }
                }
            }
        }
        #endregion

        #region 根据TestRecord生成一条补考记录
        /// <summary>
        /// 根据TestRecord生成一条补考记录
        /// </summary>
        /// <param name="testRecord"></param>
        public static string getResitTestRecord(Model.Training_TestRecord getTestRecord)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.Training_TestRecord newTestRecord = new Model.Training_TestRecord
                {
                    TestRecordId = SQLHelper.GetNewID(),
                    ProjectId = getTestRecord.ProjectId,
                    TestPlanId = getTestRecord.TestPlanId,
                    TestManId = getTestRecord.TestManId,
                    UnitId = getTestRecord.UnitId,
                    TestType = getTestRecord.TestType,
                    TemporaryUser = getTestRecord.TemporaryUser,
                    Duration = getTestRecord.Duration,
                    // TestStartTime = DateTime.Now,
                };

                db.Training_TestRecord.InsertOnSubmit(newTestRecord);
                db.SubmitChanges();

                var getTestPlan = db.Training_TestPlan.FirstOrDefault(x => x.TestPlanId == newTestRecord.TestPlanId);
                var person = PersonService.GetPersonByUserId(newTestRecord.TestManId, getTestRecord.ProjectId);
                if (getTestPlan != null && person != null)
                {
                    CreateTestRecordItem(getTestPlan, newTestRecord.TestRecordId, person);
                }
                return newTestRecord.TestRecordId;
            }
        }
        #endregion

        public static List<Model.TestStatisticsItem> getTestStatistics(string level, string levelId, string startDate, string endDate, string strParam, int pageIndex)
        {
            List<Model.TestStatisticsItem> getTestStatistics = new List<Model.TestStatisticsItem>();
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                //DateTime? startDateD = Funs.GetNewDateTime(startDate);
                //DateTime? endDateD = Funs.GetNewDateTime(endDate);
                int passScore = SysConstSetService.getPassScore();
                if (level == "1")  ////按项目统计
                {
                    Model.TestStatisticsItem newC = new Model.TestStatisticsItem
                    {
                        ID = null,
                        Name = "公司",
                    };
                    newC.TotalPersonCount = db.SitePerson_Person.Where(x => x.ProjectId == null && x.UnitId == levelId).Count();
                    var getTestRecords = from x in db.Training_TestRecord
                                         where x.ProjectId == null && x.UnitId == levelId
                                         select x;
                    newC.TestPersonCount = getTestRecords.Select(x => x.TestManId).Distinct().Count();
                    newC.PassPersonCount = getTestRecords.Where(x => x.TestScores.Value >= passScore).Select(x => x.TestManId).Distinct().Count();
                    getTestStatistics.Add(newC);

                    var getProjectLists = from x in db.Base_Project
                                          where x.UnitId == levelId && (x.ProjectState == Const.ProjectState_1 || x.ProjectState == null)
                                          orderby x.ProjectName
                                          select x;
                    foreach (var item in getProjectLists)
                    {
                        Model.TestStatisticsItem newP = new Model.TestStatisticsItem
                        {
                            ID = item.ProjectId,
                            Name = item.ProjectName,
                        };

                        newP.TotalPersonCount = db.SitePerson_Person.Where(x => x.ProjectId == item.ProjectId).Count();
                        var getTestRecordPs = from x in db.Training_TestRecord
                                              where x.ProjectId == item.ProjectId
                                              select x;
                        newP.TestPersonCount = getTestRecordPs.Select(x => x.TestManId).Distinct().Count();
                        newP.PassPersonCount = getTestRecordPs.Where(x => x.TestScores.Value >= passScore).Select(x => x.TestManId).Distinct().Count();
                        getTestStatistics.Add(newP);
                    }
                }
                else if (level == "2")  ////按施工单位统计
                {
                    var getPUnitLists = from x in db.Project_ProjectUnit
                                        join y in db.Base_Unit on x.UnitId equals y.UnitId
                                        where x.ProjectId == levelId
                                        orderby y.UnitName
                                        select new { x.ProjectId, x.UnitId, y.UnitName };
                    foreach (var item in getPUnitLists)
                    {
                        Model.TestStatisticsItem newU = new Model.TestStatisticsItem
                        {
                            ID = item.UnitId,
                            Name = item.UnitName,
                        };

                        newU.TotalPersonCount = db.SitePerson_Person.Where(x => x.ProjectId == item.ProjectId && x.UnitId == item.UnitId).Count();
                        var getTestRecordUs = from x in db.Training_TestRecord
                                              where x.ProjectId == item.ProjectId && x.UnitId == item.UnitId
                                              select x;
                        newU.TestPersonCount = getTestRecordUs.Select(x => x.TestManId).Distinct().Count();
                        newU.PassPersonCount = getTestRecordUs.Where(x => x.TestScores.Value >= passScore).Select(x => x.TestManId).Distinct().Count();
                        getTestStatistics.Add(newU);
                    }
                }
                else if (level == "3")  ////按班组统计
                {
                    List<string> getIDs = Funs.GetStrListByStr(levelId, '$');
                    if (getIDs.Count() > 1)
                    {
                        string projectId = getIDs[0];
                        string unitId = getIDs[1];
                        var getPTeamGroupLists = from x in db.ProjectData_TeamGroup
                                                 where x.ProjectId == projectId && x.UnitId == unitId
                                                 orderby x.TeamGroupName
                                                 select x;
                        foreach (var item in getPTeamGroupLists)
                        {
                            Model.TestStatisticsItem newT = new Model.TestStatisticsItem
                            {
                                ID = item.TeamGroupId,
                                Name = item.TeamGroupName,
                            };

                            newT.TotalPersonCount = db.SitePerson_Person.Where(x => x.ProjectId == item.ProjectId && x.UnitId == item.UnitId && x.TeamGroupId == item.TeamGroupId).Count();
                            var getTestRecordTs = from x in db.Training_TestRecord
                                                  join y in db.SitePerson_Person on x.TestManId equals y.PersonId
                                                  where x.ProjectId == item.ProjectId && x.UnitId == item.UnitId && y.TeamGroupId == item.TeamGroupId
                                                  select x;
                            newT.TestPersonCount = getTestRecordTs.Select(x => x.TestManId).Distinct().Count();
                            newT.PassPersonCount = getTestRecordTs.Where(x => x.TestScores.Value >= passScore).Select(x => x.TestManId).Distinct().Count();
                            getTestStatistics.Add(newT);
                        }

                        Model.TestStatisticsItem newOT = new Model.TestStatisticsItem
                        {
                            Name = "其他",
                        };

                        newOT.TotalPersonCount = db.SitePerson_Person.Where(x => x.ProjectId == projectId && x.UnitId == unitId && x.TeamGroupId == null).Count();
                        var getTestRecordOTs = from x in db.Training_TestRecord
                                               join y in db.SitePerson_Person on x.TestManId equals y.PersonId
                                               where x.ProjectId == projectId && x.UnitId == unitId && y.TeamGroupId == null
                                               select x;
                        newOT.TestPersonCount = getTestRecordOTs.Select(x => x.TestManId).Distinct().Count();
                        newOT.PassPersonCount = getTestRecordOTs.Where(x => x.TestScores.Value >= passScore).Select(x => x.TestManId).Distinct().Count();
                        getTestStatistics.Add(newOT);
                    }
                }
                return getTestStatistics;
            }
        }
    }
}