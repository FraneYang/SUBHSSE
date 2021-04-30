using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmitMapper;
using EmitMapper.MappingConfiguration;

namespace BLL
{
    public static class APIModelTestRecordService
    {
        #region 根据projectId获取列表
        /// <summary>
        /// 根据projectId获取列表
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static List<Model.ModelTestRecordItem> getModelTestRecord(string projectId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = (from x in db.Training_ModelTestRecord
                                    where (x.ProjectId == projectId || (projectId == null && x.ProjectId == null))
                                    orderby x.TestStartTime descending
                                    select new Model.ModelTestRecordItem
                                    {
                                        ModelTestRecordId = x.ModelTestRecordId,
                                        ProjectId = x.ProjectId,
                                        CompileDate = string.Format("{0:yyyy-MM-dd HH:mm}", x.CompileDate),
                                        TestManId = x.TestManId,
                                        TestManName = db.SitePerson_Person.FirstOrDefault(p => p.PersonId == x.TestManId).PersonName,
                                        TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                        TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                        TestScores = x.TestScores ?? 0,                                        
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
        public static Model.ModelTestRecordItem getModelTestRecordByTestRecordId(string modelTestRecordId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_ModelTestRecord
                                   where x.ModelTestRecordId == modelTestRecordId
                                   select new Model.ModelTestRecordItem
                                   {
                                       ModelTestRecordId = x.ModelTestRecordId,
                                       ProjectId = x.ProjectId,
                                       UnitId=x.UnitId,
                                       UnitName=db.Base_Unit.First(u=>u.UnitId == x.UnitId).UnitName,
                                       WorkPostId=x.WorkPostId,
                                       WorkPostName = db.Base_WorkPost.First(u => u.WorkPostId == x.WorkPostId).WorkPostName,
                                       TestManId = x.TestManId,
                                       IdentityCard = x.IdentityCard,
                                       TestManName = db.SitePerson_Person.First(u => u.PersonId == x.TestManId).PersonName,
                                       TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                       TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                       Duration = x.Duration ?? 0,
                                       TestScores = x.TestScores ?? 0,
                                       TotalScore = x.TotalScore ?? 0,
                                       QuestionCount = x.QuestionCount ?? 0,
                                       SValue = x.SValue ?? 1,
                                       MValue = x.MValue ?? 2,
                                       JValue = x.JValue ?? 1,
                                       TestPlanTrainingItems= getModelTestRecordTrainingListByModelTestRecordId(modelTestRecordId),
                                   };
                return getDataLists.FirstOrDefault();
            }
        }

        #region 根据TestPlanId获取考试试题类型列表
        /// <summary>
        /// 根据TestPlanId获取考试试题类型列表
        /// </summary>
        /// <param name="testPlanId">考试计划ID</param>
        /// <returns></returns>
        public static List<Model.TestPlanTrainingItem> getModelTestRecordTrainingListByModelTestRecordId(string modelTestRecordId)
        {
            var getDataLists = (from x in Funs.DB.Training_ModelTestRecordTraining
                                join y in Funs.DB.Training_TestTraining on x.TrainingId equals y.TrainingId
                                where x.ModelTestRecordId == modelTestRecordId
                                orderby y.TrainingCode
                                select new Model.TestPlanTrainingItem
                                {
                                    TestPlanTrainingId = x.TestPlanTrainingId,
                                    ModelTestRecordId = x.ModelTestRecordId,
                                    TrainingTypeId = x.TrainingId,
                                    TrainingTypeName = y.TrainingName,
                                    TrainingTypeCode = y.TrainingCode,
                                    TestType1Count = x.TestType1Count ?? 0,
                                    TestType2Count = x.TestType2Count ?? 0,
                                    TestType3Count = x.TestType3Count ?? 0,
                                }).ToList();
            return getDataLists;
        }
        #endregion
        #endregion

        #region 根据ModelTestRecordId获取试卷
        public static int getModelTestRecordItemCount
        {
            get;
            set;
        }
        /// <summary>
        /// 根据TestRecordId获取试卷
        /// </summary>
        /// <param name="modelTestRecordId"></param>
        /// <param name="pageIndex"></param>
        /// <returns>试卷</returns>
        public static List<Model.TestRecordItemItem> getModelTestRecordItemListByModelTestRecordId(string modelTestRecordId, int pageIndex)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_ModelTestRecordItem
                                   where x.ModelTestRecordId == modelTestRecordId
                                   orderby x.TestType, x.TrainingItemCode
                                   select new Model.TestRecordItemItem
                                   {
                                       TestRecordItemId = x.ModelTestRecordItemId,
                                       TestRecordId = x.ModelTestRecordId,
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
                getModelTestRecordItemCount = getDataLists.Count();
                if (getModelTestRecordItemCount == 0)
                {
                    return null;
                }
                else
                {
                    if (pageIndex >=1 )
                    {
                        return getDataLists.Skip(Funs.PageSize * (pageIndex - 1)).Take(Funs.PageSize).ToList();
                    }
                    else
                    {
                        return getDataLists.ToList();
                    }
                }
            }
        }
        #endregion

        #region 根据ModelTestRecordItemId获取题目
        /// <summary>
        /// 根据ModelTestRecordItemId获取题目
        /// </summary>
        /// <param name="modelTestRecordItemId"></param>
        /// <returns>题目</returns>
        public static Model.TestRecordItemItem getModelTestRecordItemByModelTestRecordItemId(string modelTestRecordItemId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_ModelTestRecordItem
                                   where x.ModelTestRecordItemId == modelTestRecordItemId
                                   select new Model.TestRecordItemItem
                                   {
                                       TestRecordItemId = x.ModelTestRecordItemId,
                                       TestRecordId = x.ModelTestRecordId,
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

        #region 根据ProjectId、PersonId获取当前人试卷列表
        public static int getModelTrainingTestRecordCount
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
        public static List<Model.ModelTestRecordItem> getModelTrainingTestRecordListByProjectIdPersonId(string projectId, string personId, string states, int pageIndex)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_ModelTestRecord
                                   where (x.ProjectId == projectId || (projectId == null && x.ProjectId == null))
                                   && x.TestManId == personId
                                   orderby x.CompileDate descending
                                   select new Model.ModelTestRecordItem
                                   {
                                       ModelTestRecordId = x.ModelTestRecordId,
                                       ProjectId = x.ProjectId,
                                       CompileDate = string.Format("{0:yyyy-MM-dd HH:mm}", x.CompileDate),
                                       TestManId = x.TestManId,
                                       IdentityCard = x.IdentityCard,
                                       TestManName = db.SitePerson_Person.FirstOrDefault(p => p.PersonId == x.TestManId).PersonName,
                                       TestStartTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestStartTime),
                                       TestStartTimeD = x.TestStartTime,
                                       TestEndTime = string.Format("{0:yyyy-MM-dd HH:mm}", x.TestEndTime),
                                       TestEndTimeD = x.TestEndTime,
                                       Duration = x.Duration ?? 90,
                                       TotalScore = x.TotalScore ?? 0,
                                       TestScores = x.TestScores ?? 0,
                                   };
                if (states == "0")
                {
                    getDataLists = getDataLists.Where(x => !x.TestStartTimeD.HasValue);
                }
                else if (states == "1")
                {
                    getDataLists = getDataLists.Where(x => x.TestStartTimeD.HasValue && !x.TestEndTimeD.HasValue);
                }
                else if (states == "2")
                {
                    getDataLists = getDataLists.Where(x => x.TestEndTimeD.HasValue);
                }
                getModelTrainingTestRecordCount = getDataLists.Count();
                if (getModelTrainingTestRecordCount == 0)
                {
                    return null;
                }
                else
                {
                    if (pageIndex >= 1)
                    {
                        return getDataLists.Skip(Funs.PageSize * (pageIndex - 1)).Take(Funs.PageSize).ToList();
                    }
                    else
                    {
                        return getDataLists.ToList();
                    }
                }
            }
        }
        #endregion

        #region 考生答题
        /// <summary>
        ///  考生答题
        /// </summary>
        /// <param name="testRecordItemId"></param>
        /// <param name="answerItems"></param>
        public static void getModelTestRecordItemAnswerBySelectedItem(string modelTestRecordItemId, string selectedItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getTItem = db.Training_ModelTestRecordItem.FirstOrDefault(x => x.ModelTestRecordItemId == modelTestRecordItemId);
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

        #region 试卷
        /// <summary>
        /// 试卷
        /// </summary>
        /// <param name="testRecordId"></param>
        public static decimal getSubmitModelTestRecord(string modelTestRecordId)
        {
            decimal getTestScores = 0;
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getTestRecord = db.Training_ModelTestRecord.FirstOrDefault(e => e.ModelTestRecordId == modelTestRecordId);
                if (getTestRecord != null)
                {
                    /////试卷
                    if (!getTestRecord.TestStartTime.HasValue)
                    {
                        getTestRecord.TestStartTime = DateTime.Now;
                    }
                    getTestRecord.TestEndTime = DateTime.Now;
                    var getRItem = db.Training_ModelTestRecordItem.Where(x => x.ModelTestRecordId == modelTestRecordId);
                    if (getRItem.Count() > 0)
                    {
                        getTestRecord.TestScores = getRItem.Sum(x => x.SubjectScore ?? 0);
                    }
                    db.SubmitChanges();
                    getTestScores = getTestRecord.TestScores ?? 0;
                }
            }
            return getTestScores;
        }
        #endregion

        #region 保存模拟考试 Training_ModelTestRecord
        /// <summary>
        /// 保存模拟考试 Training_ModelTestRecord
        /// </summary>
        /// <param name="getRecord">模拟考试记录</param>
        public static string SaveModelTestRecord(Model.ModelTestRecordItem getRecord)
        {
            string alterStr = string.Empty;
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
              
                Model.Training_ModelTestRecord newRecord = new Model.Training_ModelTestRecord
                {
                    ModelTestRecordId = getRecord.ModelTestRecordId,
                    UnitId = getRecord.UnitId,
                    WorkPostId = getRecord.WorkPostId,
                    TestManId = getRecord.TestManId,
                    IdentityCard= getRecord.IdentityCard,
                    //TestStartTime = Funs.GetNewDateTimeOrNow(getRecord.TestStartTime),
                    //TestEndTime = Funs.GetNewDateTimeOrNow(getRecord.TestEndTime),
                    Duration = getRecord.Duration,                  
                    TotalScore = getRecord.TotalScore,
                    QuestionCount = getRecord.QuestionCount,
                    SValue = getRecord.SValue,
                    MValue = getRecord.MValue,
                    JValue = getRecord.JValue,
                };
                if (!string.IsNullOrEmpty(getRecord.ProjectId))
                {
                    newRecord.ProjectId = getRecord.ProjectId;
                }
                var isUpdate = db.Training_ModelTestRecord.FirstOrDefault(x => x.ModelTestRecordId == newRecord.ModelTestRecordId);
                if (isUpdate == null)
                {
                    newRecord.CompileDate = DateTime.Now;
                    if (string.IsNullOrEmpty(newRecord.ModelTestRecordId))
                    {
                        newRecord.ModelTestRecordId = SQLHelper.GetNewID();
                    }
                    db.Training_ModelTestRecord.InsertOnSubmit(newRecord);
                    db.SubmitChanges();
                }
                else
                {
                    if (!isUpdate.TestStartTime.HasValue)
                    {
                        isUpdate.UnitId = getRecord.UnitId;
                        isUpdate.WorkPostId = getRecord.WorkPostId;
                        isUpdate.TestManId = getRecord.TestManId;
                        isUpdate.IdentityCard = getRecord.IdentityCard;
                        isUpdate.Duration = getRecord.Duration;
                        isUpdate.TotalScore = getRecord.TotalScore;
                        isUpdate.QuestionCount = getRecord.QuestionCount;
                        isUpdate.SValue = getRecord.SValue;
                        isUpdate.MValue = getRecord.MValue;
                        isUpdate.JValue = getRecord.JValue;
                        ////删除 考试题目类型
                        var deleteTrainings = from x in db.Training_ModelTestRecordTraining
                                              where x.ModelTestRecordId == isUpdate.ModelTestRecordId
                                              select x;
                        if (deleteTrainings.Count() > 0)
                        {
                            db.Training_ModelTestRecordTraining.DeleteAllOnSubmit(deleteTrainings);
                            db.SubmitChanges();
                        }
                    }
                    else
                    {
                        alterStr = "已开始考试不能再修改！";
                    }
                }

                if (string.IsNullOrEmpty(alterStr))
                {                 
                    if (getRecord.TestPlanTrainingItems != null && getRecord.TestPlanTrainingItems.Count() > 0)
                    {
                        foreach (var item in getRecord.TestPlanTrainingItems)
                        {
                            var trainingType = TestTrainingService.GetTestTrainingById(item.TrainingTypeId);
                            if (trainingType != null)
                            {
                                Model.Training_ModelTestRecordTraining newPlanItem = new Model.Training_ModelTestRecordTraining
                                {
                                    TestPlanTrainingId = SQLHelper.GetNewID(),
                                    ModelTestRecordId = newRecord.ModelTestRecordId,
                                    TrainingId = item.TrainingTypeId,
                                    TestType1Count = item.TestType1Count,
                                    TestType2Count = item.TestType2Count,
                                    TestType3Count = item.TestType3Count,
                                };

                                db.Training_ModelTestRecordTraining.InsertOnSubmit(newPlanItem);
                                db.SubmitChanges();
                            }
                        }
                    }
                }
            }
            return alterStr;
        }
        #endregion

    }
}
