using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 数据统计
    /// </summary>
    public static class DataStatisticsService
    {
        public static Model.SUBHSSEDB db = Funs.DB;
        
        #region 安全检查统计
        /// <summary>
        ///  安全检查统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="unitId"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        public static List<Model.ChartAnalysisItem> GetCheckStatistics(string type, string companyId, string projectId,string unitId,DateTime? startTime,DateTime? endTime)
        {           
            List<Model.ChartAnalysisItem> GetCheckStatistics = new List<Model.ChartAnalysisItem>();
            var getProjects = ProjectService.GetProjectWorkList();
            string thisunitId = CommonService.GetIsThisUnitId();
            if (companyId != Const._Null && !string.IsNullOrEmpty(companyId))
            {
                getProjects = getProjects.Where(x => x.UnitId == companyId).ToList();
            }
            else if (type == "1")
            {
                getProjects = getProjects.Where(x => x.UnitId == thisunitId).ToList();
            }
            else if(type == "2")
            {              
                getProjects = getProjects.Where(x => x.UnitId != thisunitId).ToList();
            }
            if (projectId != Const._Null && !string.IsNullOrEmpty(projectId))
            {
                getProjects = getProjects.Where(x => x.ProjectId == projectId).ToList();
            }
            foreach (var pitem in getProjects)
            {
           
                string getcompanyName = UnitService.GetUnitNameByUnitId(pitem.UnitId);
                var getUnits = UnitService.GetUnitByProjectIdList(pitem.ProjectId);
                if (unitId != Const._Null && !string.IsNullOrEmpty(unitId))
                {
                    getUnits = getUnits.Where(x => x.UnitId == unitId).ToList();
                }
                foreach (var item in getUnits)
                {
                    var getHazardRegister = from x in Funs.DB.HSSE_Hazard_HazardRegister
                                            where x.ProjectId == pitem.ProjectId && x.ResponsibleUnit == item.UnitId 
                                            && (x.States  =="1" || x.States == "2" || x.States == "3")
                                            select x;
                    if (startTime.HasValue)
                    {
                        getHazardRegister = getHazardRegister.Where(x => x.CheckTime >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getHazardRegister = getHazardRegister.Where(x => x.CheckTime <= endTime);
                    }
                    Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                    {
                        DataId = SQLHelper.GetNewID(),
                        DataColName = getcompanyName,
                        DataAllName=pitem.ProjectName,
                        DataName= item.UnitName,
                    };

                    newItem.DataSumCount = getHazardRegister.Count();
                    newItem.DataCount1 = getHazardRegister.Where(x=>x.States=="1").Count();
                    newItem.DataCount2 = getHazardRegister.Where(x => x.States == "2").Count();
                    newItem.DataCount3 = getHazardRegister.Where(x => x.States == "3").Count();
                    GetCheckStatistics.Add(newItem);
                }
            }
            return GetCheckStatistics;
        }
        #endregion

        #region 隐患整改单统计
        /// <summary>
        ///  隐患整改单统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="unitId"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        public static List<Model.ChartAnalysisItem> RectifyNoticesStatistics(string type, string companyId, string projectId, string unitId, DateTime? startTime, DateTime? endTime)
        {
            List<Model.ChartAnalysisItem> GetCheckStatistics = new List<Model.ChartAnalysisItem>();
            var getProjects = ProjectService.GetProjectWorkList();
            string thisunitId = CommonService.GetIsThisUnitId();
            if (companyId != Const._Null && !string.IsNullOrEmpty(companyId))
            {
                getProjects = getProjects.Where(x => x.UnitId == companyId).ToList();
            }
            else if (type == "1")
            {
                getProjects = getProjects.Where(x => x.UnitId == thisunitId).ToList();
            }
            else if (type == "2")
            {
                getProjects = getProjects.Where(x => x.UnitId != thisunitId).ToList();
            }
            if (projectId != Const._Null && !string.IsNullOrEmpty(projectId))
            {
                getProjects = getProjects.Where(x => x.ProjectId == projectId).ToList();
            }
            foreach (var pitem in getProjects)
            {           
                string getcompanyName = UnitService.GetUnitNameByUnitId(pitem.UnitId);
                var getUnits = UnitService.GetUnitByProjectIdList(pitem.ProjectId);
                if (unitId != Const._Null && !string.IsNullOrEmpty(unitId))
                {
                    getUnits = getUnits.Where(x => x.UnitId == unitId).ToList();
                }
                foreach (var item in getUnits)
                {
                    var getHazardRegister = from x in Funs.DB.Check_RectifyNotices
                                            where x.ProjectId == pitem.ProjectId && x.UnitId == item.UnitId
                                            && x.States != "0"
                                            select x;
                    if (startTime.HasValue)
                    {
                        getHazardRegister = getHazardRegister.Where(x => x.CheckedDate >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getHazardRegister = getHazardRegister.Where(x => x.CheckedDate <= endTime);
                    }
                    Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                    {
                        DataId = SQLHelper.GetNewID(),
                        DataColName = getcompanyName,
                        DataAllName = pitem.ProjectName,
                        DataName = item.UnitName,
                    };
                    newItem.DataSumCount = getHazardRegister.Count();
                    newItem.DataCount1 = getHazardRegister.Where(x => x.States == "1").Count();
                    newItem.DataCount2 = getHazardRegister.Where(x => x.States == "2").Count();
                    newItem.DataCount3 = getHazardRegister.Where(x => x.States == "3").Count();
                    newItem.DataCount4 = getHazardRegister.Where(x => x.States == "4").Count();
                    newItem.DataCount5 = getHazardRegister.Where(x => x.States == "5").Count();
                    GetCheckStatistics.Add(newItem);
                }
            }
            return GetCheckStatistics;
        }
        #endregion

        #region 安全会议统计
        /// <summary>
        ///  安全会议统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="unitId"></param>
        /// <param name="startTime"></param>
        /// <param name="endTime"></param>
        /// <returns></returns>
        public static List<Model.ChartAnalysisItem> MeetStatistics(string type, string companyId, string projectId, string unitId, DateTime? startTime, DateTime? endTime)
        {
            List<Model.ChartAnalysisItem> GetCheckStatistics = new List<Model.ChartAnalysisItem>();
            var getProjects = ProjectService.GetProjectWorkList();
            string thisunitId = CommonService.GetIsThisUnitId();
            if (companyId != Const._Null && !string.IsNullOrEmpty(companyId))
            {
                getProjects = getProjects.Where(x => x.UnitId == companyId).ToList();
            }
            else if (type == "1")
            {
                getProjects = getProjects.Where(x => x.UnitId == thisunitId).ToList();
            }
            else if (type == "2")
            {
                getProjects = getProjects.Where(x => x.UnitId != thisunitId).ToList();
            }
            if (projectId != Const._Null && !string.IsNullOrEmpty(projectId))
            {
                getProjects = getProjects.Where(x => x.ProjectId == projectId).ToList();
            }
            foreach (var pitem in getProjects)
            {           
                string getcompanyName = UnitService.GetUnitNameByUnitId(pitem.UnitId);
                var getUnits = UnitService.GetUnitByProjectIdList(pitem.ProjectId);
                if (unitId != Const._Null && !string.IsNullOrEmpty(unitId))
                {
                    getUnits = getUnits.Where(x => x.UnitId == unitId).ToList();
                }
                foreach (var item in getUnits)
                {
                    Model.ChartAnalysisItem newItem = new Model.ChartAnalysisItem
                    {
                        DataId = SQLHelper.GetNewID(),
                        DataColName = getcompanyName,
                        DataAllName = pitem.ProjectName,
                        DataName = item.UnitName,
                    };
                    ///班前会
                    var getClassMeeting = from x in Funs.DB.Meeting_ClassMeeting
                                            where x.ProjectId == pitem.ProjectId && x.UnitId == item.UnitId                                         
                                            select x;
                    if (startTime.HasValue)
                    {
                        getClassMeeting = getClassMeeting.Where(x => x.ClassMeetingDate >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getClassMeeting = getClassMeeting.Where(x => x.ClassMeetingDate <= endTime);
                    }
                    ////周例会
                    var getWeekMeeting = from x in Funs.DB.Meeting_WeekMeeting
                                          where x.ProjectId == pitem.ProjectId && x.UnitId == item.UnitId
                                          select x;
                    if (startTime.HasValue)
                    {
                        getWeekMeeting = getWeekMeeting.Where(x => x.WeekMeetingDate >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getWeekMeeting = getWeekMeeting.Where(x => x.WeekMeetingDate <= endTime);
                    }
                    ////月例会
                    var getMonthMeeting = from x in Funs.DB.Meeting_MonthMeeting
                                         where x.ProjectId == pitem.ProjectId && x.UnitId == item.UnitId
                                         select x;
                    if (startTime.HasValue)
                    {
                        getMonthMeeting = getMonthMeeting.Where(x => x.MonthMeetingDate >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getMonthMeeting = getMonthMeeting.Where(x => x.MonthMeetingDate <= endTime);
                    }
                    ////专题会
                    var getSpecialMeeting = from x in Funs.DB.Meeting_SpecialMeeting
                                          where x.ProjectId == pitem.ProjectId && x.UnitId == item.UnitId
                                          select x;
                    if (startTime.HasValue)
                    {
                        getSpecialMeeting = getSpecialMeeting.Where(x => x.SpecialMeetingDate >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getSpecialMeeting = getSpecialMeeting.Where(x => x.SpecialMeetingDate <= endTime);
                    }
                    ////其他会议
                    var getAttendMeeting = from x in Funs.DB.Meeting_AttendMeeting
                                            where x.ProjectId == pitem.ProjectId && x.UnitId == item.UnitId
                                            select x;
                    if (startTime.HasValue)
                    {
                        getAttendMeeting = getAttendMeeting.Where(x => x.AttendMeetingDate >= startTime);
                    }
                    if (endTime.HasValue)
                    {
                        getAttendMeeting = getAttendMeeting.Where(x => x.AttendMeetingDate <= endTime);
                    }
                    newItem.DataCount1 = getClassMeeting.Where(x => x.States == "1").Count();
                    newItem.DataCount2 = getWeekMeeting.Where(x => x.States == "2").Count();
                    newItem.DataCount3 = getMonthMeeting.Where(x => x.States == "3").Count();
                    newItem.DataCount4 = getSpecialMeeting.Where(x => x.States == "4").Count();
                    newItem.DataCount5 = getAttendMeeting.Where(x => x.States == "5").Count();
                    GetCheckStatistics.Add(newItem);
                }
            }
            return GetCheckStatistics;
        }
        #endregion
    }
}
