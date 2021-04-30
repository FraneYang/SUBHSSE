namespace Model
{
    using System.Collections.Generic;
    using System.Data.Linq;
    using System.Data.Linq.Mapping;
    using System.Reflection;

    public partial class SUBHSSEDB : DataContext
    {
        /// <summary>
        /// 获取当前用户在移动端待办事项
        /// </summary>
        /// <param name="unitcode"></param>
        /// <param name="isono"></param>
        /// <returns></returns>
        [Function(Name = "[dbo].[Sp_APP_GetToDoItems]")]
        public IEnumerable<ToDoItem> Sp_APP_GetToDoItems([Parameter(DbType = "nvarchar(50)")] string projectId, [Parameter(DbType = "nvarchar(50)")] string userId)
        {
            IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)MethodInfo.GetCurrentMethod()), projectId, userId);
            return (ISingleResult<ToDoItem>)result.ReturnValue;
        }

        /// <summary>
        /// 获取人员培训教材
        /// </summary>
        /// <param name="unitcode"></param>
        /// <param name="isono"></param>
        /// <returns></returns>
        [Function(Name = "[dbo].[Sp_GetTraining_TaskItemTraining]")]
        public IEnumerable<TrainingTaskItemItem> Sp_GetTraining_TaskItemTraining([Parameter(DbType = "nvarchar(50)")] string planId, [Parameter(DbType = "nvarchar(200)")] string workPostId)
        {
            IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)MethodInfo.GetCurrentMethod()), planId, workPostId);
            return (ISingleResult<TrainingTaskItemItem>)result.ReturnValue;
        }

        /// <summary>
        /// 获取考试统计
        /// </summary>
        /// <param name="companyId"></param>
        /// <param name="projectId"></param>
        /// <param name="unitId"></param>
        /// <param name="teamGroupId"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <param name="passName"></param>
        /// <param name="isTest"></param>
        /// <param name="personName"></param>
        /// <returns></returns>
        [Function(Name = "[dbo].[SpTestStatisticsStatistic]")]
        public IEnumerable<TrainingTaskItemItem> SpTestStatisticsStatistic([Parameter(DbType = "nvarchar(50)")] string companyId, [Parameter(DbType = "nvarchar(50)")] string projectId, [Parameter(DbType = "nvarchar(50)")] string unitId, [Parameter(DbType = "nvarchar(50)")] string teamGroupId, [Parameter(DbType = "nvarchar(50)")] string trainTypeId, [Parameter(DbType = "nvarchar(50)")] string startTime, [Parameter(DbType = "nvarchar(50)")] string endTime, [Parameter(DbType = "nvarchar(50)")] string passName, [Parameter(DbType = "nvarchar(50)")] string isTest, [Parameter(DbType = "nvarchar(50)")] string personName)
        {
            IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)MethodInfo.GetCurrentMethod()), companyId, projectId, unitId, teamGroupId, trainTypeId, startTime, endTime, passName, isTest, personName);
            return (ISingleResult<TrainingTaskItemItem>)result.ReturnValue;
        }
    }
}
