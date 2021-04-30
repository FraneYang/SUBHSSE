using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public static class APIChartAnalysisService
    {
        #region 根据类型获取图型数据
        /// <summary>
        /// 根据类型获取图型数据
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static List<Model.ChartAnalysisItem> getChartAnalysisByType(string projectId, string type, string startDate, string endDate)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                List<Model.ChartAnalysisItem> getDataLists = new List<Model.ChartAnalysisItem>();
                var getHazardRegister = from x in db.HSSE_Hazard_HazardRegister
                                        where x.ProjectId == projectId
                                        select x;
                if (!string.IsNullOrEmpty(startDate))
                {
                    var sDate = Funs.GetNewDateTime(startDate);
                    getHazardRegister = getHazardRegister.Where(x => x.RegisterDate >= sDate);
                }
                if (!string.IsNullOrEmpty(endDate))
                {
                    var eDate = Funs.GetNewDateTime(endDate);
                    getHazardRegister = getHazardRegister.Where(x => x.RegisterDate <= eDate);
                }
                if (type == "1")
                {
                    var getUnitlistIds = getHazardRegister.Select(x => x.ResponsibleUnit).Distinct().ToList();
                    foreach (var unitItem in getUnitlistIds)
                    {
                        var getUnitRegister = getHazardRegister.Where(x => x.ResponsibleUnit == unitItem);
                        Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                        {
                            DataId = unitItem,
                            Type = type,
                            DataName = UnitService.GetUnitCodeByUnitId(unitItem),
                            DataSumCount = getUnitRegister.Count(),
                            DataCount1 = getUnitRegister.Where(x => x.States == "2" || x.States == "3").Count(),
                        };

                        getDataLists.Add(newItem);

                    }
                }
                else if (type == "2")
                {
                    var getRegisterTypesIds = getHazardRegister.Select(x => x.RegisterTypesId).Distinct().ToList();
                    foreach (var typeItem in getRegisterTypesIds)
                    {
                        var getUnitRegister = getHazardRegister.Where(x => x.RegisterTypesId == typeItem);
                        Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                        {
                            DataId = typeItem,
                            Type = type,
                            DataName = db.HSSE_Hazard_HazardRegisterTypes.First(y => y.RegisterTypesId == typeItem).RegisterTypesName,
                            DataSumCount = getUnitRegister.Count(),
                            DataCount1 = getUnitRegister.Where(x => x.States == "2" || x.States == "3").Count(),
                        };

                        getDataLists.Add(newItem);

                    }
                }
                return getDataLists;
            }
        }
        #endregion

        #region 隐患整改单统计分析
        /// <summary>
        /// 隐患整改单统计分析
        /// </summary>
        /// <param name="projectId">项目ID</param>
        /// <param name="type">1：按项目；2：按单位</param>
        /// <param name="startDate">开始时间</param>
        /// <param name="endDate">结束时间</param>
        /// <returns></returns>
        public static List<Model.ChartAnalysisItem> getRectifyNoticesChartAnalysis(string projectId, string type, string startDate, string endDate)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                List<Model.ChartAnalysisItem> getDataLists = new List<Model.ChartAnalysisItem>();
                var sDate = Funs.GetNewDateTime(startDate);
                var eDate = Funs.GetNewDateTime(endDate);
                if (type == "1")
                {
                    var getRectifyNotices = from x in db.Check_RectifyNotices
                                            select x;
                    if (sDate.HasValue)
                    {
                        getRectifyNotices = getRectifyNotices.Where(x => x.CheckedDate >= sDate);
                    }
                    if (eDate.HasValue)
                    {
                        getRectifyNotices = getRectifyNotices.Where(x => x.CheckedDate <= eDate);
                    }
                    var getProjectIds = getRectifyNotices.Select(x => x.ProjectId).Distinct();
                    foreach (var pItem in getProjectIds)
                    {
                        var getproject = ProjectService.GetProjectByProjectId(pItem);
                        if (getproject != null)
                        {
                            var getPRegister = getRectifyNotices.Where(x => x.ProjectId == getproject.ProjectId);
                            Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                            {
                                DataId = getproject.ProjectId,
                                Type = type,
                                DataName = (getproject.ShortName == null || getproject.ShortName == "" ? getproject.ProjectName : getproject.ShortName),
                                DataAllName = getproject.ProjectName,
                                DataSumCount = getPRegister.Count(),
                                DataCount1 = getPRegister.Where(x => x.States == "5").Count(),
                            };

                            getDataLists.Add(newItem);
                        }
                    }
                }
                else if (type == "2")
                {
                    var getRectifyNotices = from x in db.Check_RectifyNotices
                                            where x.ProjectId == projectId
                                            select x;
                    if (sDate.HasValue)
                    {
                        getRectifyNotices = getRectifyNotices.Where(x => x.CheckedDate >= sDate);
                    }
                    if (eDate.HasValue)
                    {
                        getRectifyNotices = getRectifyNotices.Where(x => x.CheckedDate <= eDate);
                    }
                    var getUnitIds = getRectifyNotices.Select(x => x.UnitId).Distinct();
                    foreach (var uItem in getUnitIds)
                    {
                        var getUnitRegister = getRectifyNotices.Where(x => x.UnitId == uItem);
                        var getUnit = BLL.UnitService.GetUnitByUnitId(uItem);
                        if (getUnit != null)
                        {
                            Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                            {
                                DataId = uItem,
                                Type = type,
                                DataName = (getUnit.ShortUnitName == null || getUnit.ShortUnitName == "" ? getUnit.UnitName : getUnit.ShortUnitName),
                                DataAllName = getUnit.UnitName,
                                DataSumCount = getUnitRegister.Count(),
                                DataCount1 = getUnitRegister.Where(x => x.States == "5").Count(),
                            };
                            getDataLists.Add(newItem);
                        }
                    }
                }
                return getDataLists;
            }
        }
        #endregion
    }
}
