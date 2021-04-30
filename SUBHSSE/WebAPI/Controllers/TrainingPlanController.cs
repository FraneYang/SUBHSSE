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
    /// 培训计划
    /// </summary>
    public class TrainingPlanController : ApiController
    {
        #region 根据projectId、trainTypeId、states获取培训计划列表
        /// <summary>
        /// 根据projectId、trainTypeId、states获取培训记录列表
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="trainTypeId"></param>
        /// <param name="states"></param>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public Model.ResponeData getTrainingPlanListByProjectIdTrainTypeIdTrainStates(string projectId, string trainTypeId, string states, int pageIndex)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getdata = APITrainingPlanService.getTrainingPlanListByProjectIdTrainTypeIdTrainStates(projectId, trainTypeId, states, pageIndex);
                int pageCount = APITrainingPlanService.getTrainingPlanListCount;
                responeData.data = new { pageCount, getdata };
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 根据培训计划ID获取培训详细
        /// <summary>
        ///  根据培训ID获取培训计划详细
        /// </summary>
        /// <param name="planId">培训计划ID</param>
        /// <returns></returns>
        public Model.ResponeData getTrainingPlanByTrainingId(string planId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APITrainingPlanService.getTrainingPlanByTrainingId(planId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }

            return responeData;
        }
        #endregion

        #region 根据TrainingPlanId获取培训教材类型列表
        /// <summary>
        /// 根据TrainingPlanId获取培训教材类型列表
        /// </summary>
        /// <param name="trainingPlanId"></param>
        /// <returns>培训教材类型</returns>
        public Model.ResponeData getTrainingPlanItemListByTrainingPlanId(string trainingPlanId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                responeData.data = APITrainingPlanService.getTrainingPlanItemListByTrainingPlanId(trainingPlanId);
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion

        #region 保存 TrainingPlan
        /// <summary>
        /// 保存TrainingPlan
        /// </summary>
        /// <param name="trainingPlan">培训计划记录</param>
        [HttpPost]
        public Model.ResponeData SaveTrainingPlan([FromBody] Model.TrainingPlanItem trainingPlan)
        {
            var responeData = new Model.ResponeData();
            try
            {
                //if (CommonService.IsMainUnitOrAdmin(trainingPlan.DesignerId))
                //{
                   APITrainingPlanService.SaveTrainingPlan(trainingPlan);
                //}
                //else
                //{
                //    responeData.code = 0;
                //    responeData.message = "非本单位用户，不能制定培训计划！";
                //}
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }

            return responeData;
        }
        #endregion

        #region 根据TrainingPlanId结束培训计划
        /// <summary>
        /// 根据TrainingPlanId结束培训计划
        /// </summary>
        /// <param name="planId"></param>
        /// <returns>培训教材类型</returns>
        public Model.ResponeData getCloseTrainingPlan(string planId)
        {
            var responeData = new Model.ResponeData();
            try
            {
                using (Model.SUBHSSEDB db = Funs.DB)
                {  ////获取培训计划
                    var getTrainingPlan = db.Training_Plan.FirstOrDefault(e => e.PlanId == planId);
                    if (getTrainingPlan != null)
                    {
                        getTrainingPlan.States = "3";
                        db.SubmitChanges();
                        var getTrainingTasks = from x in db.Training_Task
                                               where x.PlanId == planId && (x.States != "2" || x.States == null)
                                               select x;
                        foreach (var item in getTrainingTasks)
                        {
                            item.States = "2";
                            db.SubmitChanges();
                        }
                        
                        Model.EduTrain_TrainRecord newTrainRecord = new Model.EduTrain_TrainRecord
                        {
                            TrainingId = SQLHelper.GetNewID(),
                            TrainingCode = getTrainingPlan.PlanCode,
                            ProjectId = getTrainingPlan.ProjectId,
                            TrainTitle = getTrainingPlan.PlanName,
                            TrainContent = getTrainingPlan.TrainContent,
                            TrainStartDate = getTrainingPlan.TrainStartDate,
                            TeachHour = getTrainingPlan.TeachHour,
                            TrainEndDate = getTrainingPlan.TrainEndDate,
                            TeachMan = getTrainingPlan.TeachMan,
                            TeachAddress = getTrainingPlan.TeachAddress,
                            Remark = "来源：培训计划",
                            TrainTypeId = getTrainingPlan.TrainTypeId,
                            TrainLevelId = getTrainingPlan.TrainLevelId,
                            UnitIds = getTrainingPlan.UnitIds,
                            States = Const.State_2,
                            WorkPostIds = getTrainingPlan.WorkPostId,
                            PlanId = getTrainingPlan.PlanId,
                        };

                        newTrainRecord.CompileMan = UserService.GetUserNameByUserId(getTrainingPlan.DesignerId);
                        ////新增培训记录
                        db.EduTrain_TrainRecord.InsertOnSubmit(newTrainRecord);
                        db.SubmitChanges();

                        ////增加一条编码记录
                        CodeRecordsService.InsertCodeRecordsByMenuIdProjectIdUnitId(Const.ProjectTrainRecordMenuId, newTrainRecord.ProjectId, null, newTrainRecord.TrainingId, newTrainRecord.TrainStartDate);
                        CommonService.btnSaveData(newTrainRecord.ProjectId, Const.ProjectTrainRecordMenuId, newTrainRecord.TrainingId, getTrainingPlan.DesignerId, true, newTrainRecord.TrainTitle, "../EduTrain/TrainRecordView.aspx?TrainingId={0}");
                    }
                }
                responeData.data = planId;
            }
            catch (Exception ex)
            {
                responeData.code = 0;
                responeData.message = ex.Message;
            }
            return responeData;
        }
        #endregion
    }
}
