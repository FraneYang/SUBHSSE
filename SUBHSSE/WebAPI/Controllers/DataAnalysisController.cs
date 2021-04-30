using BLL;
using System;
using System.Linq;
using System.Web.Http;

namespace WebAPI.Controllers
{
    /// <summary>
    /// 数据统计分析
    /// </summary>
    public class DataAnalysisController : ApiController
    {
        #region 根据类型获取图型数据
        /// <summary>
        /// 根据类型获取图型数据
        /// </summary>
        /// <param name="level">1项目；2施工单位；3班组</param>
        /// <param name="levelId">参数ID</param>
        /// <param name="startDate">开始时间</param>
        /// <param name="endDate">结束时间</param>
        /// <param name="strParam">关键字</param>
        /// <param name="pageIndex">分页</param>
        /// <returns></returns>
        public Model.ResponeData getTestStatistics(string level, string levelId, string startDate,string endDate,string strParam, int pageIndex)
        {
            var responeData = new Model.ResponeData();
            try
            {
                var getDataList = APITestRecordService.getTestStatistics(level, levelId, startDate, endDate, strParam, pageIndex);
                int pageCount = getDataList.Count();
                if (pageCount > 0 && pageIndex > 0)
                {
                    getDataList = getDataList.Skip(Funs.PageSize * (pageIndex - 1)).Take(Funs.PageSize).ToList();
                }
                responeData.data = new { pageCount, getDataList };
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
