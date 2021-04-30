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
    ///  模拟考试
    /// </summary>
    public class ModelTestRecordController : ApiController
    {
        #region 获取模拟考试列表
        /// <summary>
        ///  获取模拟考试列表
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns>模拟考试</returns>
        public Model.ResponeData getModelTestRecord(string projectId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APIModelTestRecordService.getModelTestRecord(projectId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 根据ID获取模拟考试详细
        /// <summary>
        /// 根据ID获取模拟考试详细
        /// </summary>
        /// <param name="modelTestRecordId"></param>
        /// <returns>试卷详细</returns>
        public Model.ResponeData getModelTestRecordByTestRecordId(string modelTestRecordId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APIModelTestRecordService.getModelTestRecordByTestRecordId(modelTestRecordId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 根据TestRecordId获取试卷
        /// <summary>
        /// 根据TestRecordId获取试卷
        /// </summary>
        /// <param name="modelTestRecordId"></param>
        /// <param name="pageIndex">页码</param>
        /// <returns>试卷</returns>
        public Model.ResponeData getModelTestRecordItemListByModelTestRecordId(string modelTestRecordId, int pageIndex)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getDataLists = APIModelTestRecordService.getModelTestRecordItemListByModelTestRecordId(modelTestRecordId, pageIndex);
                int pageCount = APIModelTestRecordService.getModelTestRecordItemCount;               
                responeData.data = new { pageCount, getDataLists };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 根据TestRecordItemId获取题目详细
        /// <summary>
        /// 根据TestRecordItemId获取试卷题目详细
        /// </summary>
        /// <param name="modelTestRecordItemId"></param>
        /// <returns>考试人员</returns>
        public Model.ResponeData getModelTestRecordItemByModelTestRecordItemId(string modelTestRecordItemId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APIModelTestRecordService.getModelTestRecordItemByModelTestRecordItemId(modelTestRecordItemId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 获取当前人试卷列表
        /// <summary>
        /// 根据ProjectId、PersonId获取当前人试卷列表
        /// </summary>
        /// <param name="projectId">项目ID</param>
        /// <param name="personId">人员ID</param>
        /// <param name="states">状态（states 0-待考；1-在考；2-已考；null-全部）</param>
        /// <param name="pageIndex">页码</param>
        /// <returns>考试记录列表</returns>
        public Model.ResponeData getModelTrainingTestRecordListByProjectIdPersonId(string projectId, string personId, string states, int pageIndex)
        {
            var responeData = new Model.ResponeData();
            try
            {
                personId = PersonService.GetPersonIdByUserId(personId);
                var getDataLists = APIModelTestRecordService.getModelTrainingTestRecordListByProjectIdPersonId(projectId, personId, states, pageIndex);
                int pageCount = APIModelTestRecordService.getModelTrainingTestRecordCount;              
                responeData.data = new { pageCount, getDataLists };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 获取当前试卷的答题倒计时
        /// <summary>
        /// 获取当前试卷的答题倒计时
        /// </summary>
        /// <param name="modelTestRecordId"></param>
        /// <returns></returns>
        public Model.ResponeData getTestTimesByTestRecordId(string modelTestRecordId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                int mTime = 0;
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    var getModelTest = db.Training_ModelTestRecord.FirstOrDefault(e => e.ModelTestRecordId == modelTestRecordId);
                    if (getModelTest != null)
                    {
                        DateTime startTime = DateTime.Now;
                        if (getModelTest.TestStartTime.HasValue)
                        {
                            startTime = getModelTest.TestStartTime.Value;
                        }
                        else
                        {
                            getModelTest.TestStartTime = startTime;
                            db.SubmitChanges();
                        }
                        int duration = getModelTest.Duration ?? 90;
                        mTime = Convert.ToInt32((getModelTest.TestStartTime.Value.AddMinutes(duration) - DateTime.Now).TotalSeconds);
                    }
                }
                responeData.data = new { mTime };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 根据题目ID 选项考生答题
        /// <summary>
        /// 根据题目ID 选项考生答题
        /// </summary>
        /// <param name="modelTestRecordItemId">题目ID</param>
        /// <param name="selectedItem">选项</param>
        public Model.ResponeData getModelTestItemAnswerBySelectedItem(string modelTestRecordItemId, string selectedItem)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getItem = ModelTestRecordItemService.GetModelTestRecordItemModelTestRecordItemId(modelTestRecordItemId);
                if (getItem != null)
                {
                    //更新没有结束时间且超时的考试记录
                    int closeCount = ModelTestRecordService.UpdateTestEndTimeNull(getItem.ModelTestRecordId);
                    if (closeCount > 0)
                    {
                        responeData.code = 2;
                        responeData.message = "本次考试已结束，系统自动交卷！";
                    }
                    else
                    {
                        APIModelTestRecordService.getModelTestRecordItemAnswerBySelectedItem(modelTestRecordItemId, selectedItem);
                    }
                }
                else
                {
                    responeData.code = 0;
                    responeData.message = "无法找到试题！";
                }
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }

            return responeData;
        }
        #endregion

        #region 交卷 
        /// <summary>
        ///  交卷
        /// </summary>
        /// <param name="modelTestRecordId">试卷ID</param>
        public Model.ResponeData getSubmitModelTestRecord(string modelTestRecordId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                ////考试分数
                decimal getTestScores = APIModelTestRecordService.getSubmitModelTestRecord(modelTestRecordId);
                responeData.message = "您的成绩为：【" + getTestScores.ToString() + "】。";
                responeData.data = new { getTestScores };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }

            return responeData;
        }
        #endregion

        #region 保存模拟考试设置
        /// <summary>
        /// 保存TestPlan [增加、修改]
        /// </summary>
        /// <param name="modelTestRecord">模拟考试</param>
        [HttpPost]
        public Model.ResponeData SaveModelTestRecord([FromBody] Model.ModelTestRecordItem modelTestRecord)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getPerson = PersonService.GetPersonByUserId(modelTestRecord.TestManId);
                if (getPerson != null)
                {
                    modelTestRecord.TestManId = getPerson.PersonId;
                    responeData.message = APIModelTestRecordService.SaveModelTestRecord(modelTestRecord);
                }
                else
                {
                    responeData.message = "当前人不在人员信息中！";
                }
               
                if (!string.IsNullOrEmpty(responeData.message))
                {
                    responeData.code = 2;
                }
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 开始考试
        /// <summary>
        /// 开始考试
        /// </summary>
        /// <param name="modelTestRecordId">模拟考试ID</param>
        /// <param name="personId">当前人ID</param>
        /// <returns></returns>
        public Model.ResponeData getStartModelTest(string modelTestRecordId, string personId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    var getModelTest = db.Training_ModelTestRecord.FirstOrDefault(e => e.ModelTestRecordId == modelTestRecordId && !e.TestEndTime.HasValue);
                    if (getModelTest != null)
                    {
                        string projectId = getModelTest.ProjectId;
                        var person = PersonService.GetPersonByUserId(personId);                           
                        if (person != null && getModelTest.TestManId == person.PersonId)
                        {
                            if (!getModelTest.TestStartTime.HasValue)
                            {
                                getModelTest.TestStartTime = DateTime.Now;
                                db.SubmitChanges();
                            }
                            var item = db.Training_ModelTestRecordItem.FirstOrDefault(x => x.ModelTestRecordId == modelTestRecordId);
                            if (item == null)
                            {
                                List<Model.Training_TestTrainingItem> getTestTrainingItemList = new List<Model.Training_TestTrainingItem>();
                                var testPlanTrainings = from x in db.Training_ModelTestRecordTraining
                                                        where x.ModelTestRecordId == getModelTest.ModelTestRecordId
                                                        select x;
                                //// 计划考试中单选、多选、判断题总数
                                int sumTestType1Count = testPlanTrainings.Sum(x => x.TestType1Count) ?? 0;
                                int sumTestType2Count = testPlanTrainings.Sum(x => x.TestType2Count) ?? 0;
                                int sumTestType3Count = testPlanTrainings.Sum(x => x.TestType3Count) ?? 0;

                                ////获取类型下适合岗位试题集合
                                List<Model.Training_TestTrainingItem> getTestTrainingItemALLs = new List<Model.Training_TestTrainingItem>();
                                if (!string.IsNullOrEmpty(projectId))
                                {
                                    getTestTrainingItemALLs = (from x in db.Training_TestTrainingItem
                                                               join y in db.Training_TestTraining on x.TrainingId equals y.TrainingId
                                                               where y.ProjectId.Contains(projectId) && x.TrainingId != null
                                                               && (x.WorkPostIds == null || (x.WorkPostIds.Contains(person.WorkPostId) && person.WorkPostId != null))
                                                               select x).ToList();
                                }
                                else
                                {
                                    getTestTrainingItemALLs = (from x in db.Training_TestTrainingItem
                                                               join y in db.Training_TestTraining on x.TrainingId equals y.TrainingId
                                                               where y.ProjectId == null && x.TrainingId != null
                                                               && (x.WorkPostIds == null || (x.WorkPostIds.Contains(person.WorkPostId) && person.WorkPostId != null))
                                                               select x).ToList();
                                }
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
                                        ////  通用且未选择的题目
                                        var getTestTrainingItemDiffs = getTestTrainingItemNulls.Except(getTestTrainingItemList).ToList();
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
                                                   select new Model.Training_ModelTestRecordItem
                                                   {
                                                       ModelTestRecordItemId = SQLHelper.GetNewID(),
                                                       ModelTestRecordId = getModelTest.ModelTestRecordId,
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
                                                       Score = x.TestType == "1" ? getModelTest.SValue : (x.TestType == "2" ? getModelTest.MValue : getModelTest.JValue),
                                                   };

                                    db.Training_ModelTestRecordItem.InsertAllOnSubmit(getItems);
                                    db.SubmitChanges();
                                }
                            }
                        }
                    }
                    responeData.data = new { modelTestRecordId };
                }
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
                ErrLogInfo.WriteLog(ex, "WX接口-开始模拟考试", "ModelTestRecordController.getStartModelTest");
            }
            return responeData;
        }
        #endregion
    }
}
