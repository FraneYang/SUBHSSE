﻿using System.Collections.Generic;
using System.Linq;
using System;

namespace BLL
{
    /// <summary>
    /// 赛鼎月报
    /// </summary>
    public static class APISeDinMonthReportService
    {
        #region 获取赛鼎月报列表信息
        /// <summary>
        /// 获取赛鼎月报列表信息
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static List<Model.SeDinMonthReportItem> getSeDinMonthReportList(string projectId, string month, string states)
        {
            var monthD = Funs.GetNewDateTime(month);
            var getSeDinMonthReport = from x in Funs.DB.SeDin_MonthReport
                                      where x.ProjectId == projectId 
                                      select x;
            if (!string.IsNullOrEmpty(states))
            {
                getSeDinMonthReport = getSeDinMonthReport.Where(x => x.States == states || (states=="0" && (x.States == null || x.States == "0")));
            }

            if (monthD.HasValue)
            {
                getSeDinMonthReport = getSeDinMonthReport.Where(x => x.ReporMonth.Value.Year == monthD.Value.Year && x.ReporMonth.Value.Month == monthD.Value.Month);
            }

            var getReport = from x in getSeDinMonthReport
                            orderby x.ReporMonth descending
                            select new Model.SeDinMonthReportItem
                            {
                                MonthReportId = x.MonthReportId,
                                ProjectId = x.ProjectId,
                                DueDate = string.Format("{0:yyyy-MM-dd}", x.DueDate),
                                StartDate = string.Format("{0:yyyy-MM-dd}", x.StartDate),
                                EndDate = string.Format("{0:yyyy-MM-dd}", x.EndDate),
                                ReporMonth = string.Format("{0:yyyy-MM}", x.ReporMonth),
                                CompileManId = x.CompileManId,
                                CompileManName = Funs.DB.Sys_User.First(u => u.UserId == x.CompileManId).UserName,
                                AuditManId = x.AuditManId,
                                AuditManName = Funs.DB.Sys_User.First(u => u.UserId == x.AuditManId).UserName,
                                ApprovalManId = x.ApprovalManId,
                                ApprovalManName = Funs.DB.Sys_User.First(u => u.UserId == x.ApprovalManId).UserName,
                                ThisSummary = x.ThisSummary,
                                NextPlan = x.NextPlan,
                            };

            return getReport.ToList();
        }
        #endregion        
        
        #region 获取赛鼎月报初始化页面
        #region  获取赛鼎月报初始化页面 --0、封面
        /// <summary>
        /// 获取赛鼎月报初始化页面 --封面
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReportItem getSeDinMonthReportNullPage0(string projectId)
        {
            var nowDate = System.DateTime.Now;
            Model.SeDinMonthReportItem newItem = new Model.SeDinMonthReportItem
            {
                ProjectId = projectId,
                DueDate = nowDate.Year.ToString() + "-" + nowDate.Month.ToString() + "-05",
                StartDate = nowDate.AddMonths(-2).Year.ToString() + "-" + nowDate.AddMonths(-2).Month.ToString() + "-26",
                EndDate = nowDate.AddMonths(-1).Year.ToString() + "-" + nowDate.AddMonths(-1).Month.ToString() + "-25",
                ReporMonth = nowDate.AddMonths(-1).Year.ToString() + "-" + nowDate.AddMonths(-1).Month.ToString(),
            };
            return newItem;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --1、项目信息
        /// <summary>
        /// 获取赛鼎月报初始化页面 --1、项目信息
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport1Item getSeDinMonthReportNullPage1(string projectId)
        {
            ///项目经理
            string projectManagerId = string.Empty;
            var m = Funs.DB.Project_ProjectUser.FirstOrDefault(x => x.ProjectId == projectId && x.RoleId.Contains(Const.ProjectManager));
            if (m != null)
            {
                projectManagerId = m.UserId;
            }
            ////安全经理
            string hsseManagerId = string.Empty;
            var h = Funs.DB.Project_ProjectUser.FirstOrDefault(x => x.ProjectId == projectId && x.RoleId.Contains(Const.HSSEManager));
            if (h != null)
            {
                hsseManagerId = h.UserId;
            }
            var newItem = from x in Funs.DB.Base_Project
                          where x.ProjectId == projectId
                          select new Model.SeDinMonthReport1Item
                          {
                              ProjectCode = x.ProjectCode,
                              ProjectName = x.ProjectName,
                              ProjectType=Funs.DB.Sys_Const.First(y=>y.GroupId == ConstValue.Group_ProjectType && y.ConstValue==x.ProjectType).ConstText,
                              StartDate=string.Format("{0:yyyy-MM-dd}",x.StartDate),
                              EndDate = string.Format("{0:yyyy-MM-dd}", x.EndDate),
                              ProjectManager=UserService.GetUserNameAndTelByUserId(projectManagerId),
                              HsseManager = UserService.GetUserNameAndTelByUserId(hsseManagerId),
                              ProjectAddress = x.ProjectAddress,
                          };
            
            return newItem.FirstOrDefault();
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --2、项目安全工时统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --2、项目安全工时统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport2Item getSeDinMonthReportNullPage2(string projectId, string month,string startDate, string endDate)
        {
            var newItem = new Model.SeDinMonthReport2Item();
            var monthD = Funs.GetNewDateTime(month);
            var getProject = Funs.DB.Base_Project.FirstOrDefault(x => x.ProjectId == projectId);
            if (getProject != null && monthD.HasValue)
            {
                //// 人工时月报
                var getProjectMonthReport = from x in Funs.DB.SitePerson_MonthReport where x.ProjectId == projectId select x;
                if (getProjectMonthReport.Count() > 0)
                {
                    ////人工时月报明细
                    var getMonthReportDetail = from x in Funs.DB.SitePerson_MonthReportDetail
                                               join y in getProjectMonthReport on x.MonthReportId equals y.MonthReportId
                                               select x;
                    ///// 项目累计安全人工时
                    newItem.ProjectWorkTime = getMonthReportDetail.Sum(x => x.PersonWorkTime) ?? 0;
                    var yearMonthReport = from x in getProjectMonthReport where x.CompileDate.Value.Year == monthD.Value.Year
                                          && x.CompileDate.Value.Month <= monthD.Value.Month
                                          select x;
                    if (yearMonthReport.Count() > 0)
                    {
                        foreach (var item in yearMonthReport)
                        {
                            ////年度累计安全人工时
                            newItem.YearWorkTime += getMonthReportDetail.Where(x => x.MonthReportId == item.MonthReportId).Sum(x => x.PersonWorkTime) ?? 0;
                        }
                        //// 安全生产人工时
                        newItem.SafeWorkTime = newItem.YearWorkTime ?? 0;
                        var monthMonthReport = yearMonthReport.FirstOrDefault(x => x.CompileDate.Value.Month == monthD.Value.Month);
                        if (monthMonthReport != null)
                        {
                            ////当月安全人工时
                            newItem.MonthWorkTime += getMonthReportDetail.Where(x => x.MonthReportId == monthMonthReport.MonthReportId).Sum(x => x.PersonWorkTime) ?? 0;
                        }
                    }
                }

                newItem.StartDate = string.Format("{0:yyyy-MM-dd}", getProject.StartDate);
                newItem.EndDate = endDate; 
            }
            return newItem;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --3、项目HSE事故、事件统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --3、项目HSE事故、事件统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReportItem getSeDinMonthReportNullPage3(string projectId, string month, string startDate, string endDate)
        {
            var nowDate = System.DateTime.Now;
            Model.SeDinMonthReportItem newItem = new Model.SeDinMonthReportItem
            {
                ProjectId = projectId,
              SeDinMonthReport3Item= getSeDinMonthReport3ItemNull(projectId, month, startDate, endDate)
            };
            return newItem;
        }

        /// <summary>
        ///  获取项目HSE事故、事件统计明细
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport3Item> getSeDinMonthReport3ItemNull(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            List<Model.SeDinMonthReport3Item> getLists = new List<Model.SeDinMonthReport3Item>();
            var getAccidentReportTypes= from x in Funs.DB.Sys_Const
                                        where x.GroupId == ConstValue.Group_AccidentReportRegistration
                                        select x;
            var getAccident = from x in Funs.DB.Accident_AccidentReport
                              where x.ProjectId == projectId 
                              select x;
            var getMonthAccident = from x in getAccident
                                   where x.AccidentDate >= startDateD && x.AccidentDate < endDateD
                                   select x;
            foreach (var item in getAccidentReportTypes)
            {
                Model.SeDinMonthReport3Item newItem = new Model.SeDinMonthReport3Item();
                if (item.SortIndex <= 4)
                {
                    newItem.BigType = "人身伤害事故";
                }
                newItem.AccidentType = item.ConstText;
                newItem.SortIndex = item.SortIndex;

                newItem.MonthTimes = getMonthAccident.Count();
                newItem.TotalTimes = getAccident.Count();
                newItem.MonthLossTime = getMonthAccident.Sum(x => x.WorkingHoursLoss) ?? 0;
                newItem.TotalLossTime = getAccident.Sum(x => x.WorkingHoursLoss) ?? 0;
                newItem.MonthMoney = getMonthAccident.Sum(x => x.EconomicLoss) ?? 0;
                newItem.TotalMoney = getAccident.Sum(x => x.EconomicLoss) ?? 0;
                newItem.MonthPersons = getMonthAccident.Sum(x => x.PeopleNum) ?? 0;
                newItem.TotalPersons = getAccident.Sum(x => x.PeopleNum) ?? 0;
                getLists.Add(newItem);
            }

            return getLists.OrderBy(x=>x.SortIndex).ToList();
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --4、本月人员投入情况
        /// <summary>
        /// 获取赛鼎月报初始化页面 --4、本月人员投入情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport4Item> getSeDinMonthReportNullPage4(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            List<Model.SeDinMonthReport4Item> getLists = new List<Model.SeDinMonthReport4Item>();
            var getUnits = from x in Funs.DB.Base_Unit
                                         join y in Funs.DB.Project_ProjectUnit on x.UnitId equals y.UnitId
                                         where y.ProjectId == projectId
                                         select x;
            var getPersons = (from x in Funs.DB.SitePerson_Person
                              where x.ProjectId == projectId && x.InTime <=startDateD && (!x.OutTime.HasValue)
                              select x).ToList();
            foreach (var item in getUnits)
            {
                Model.SeDinMonthReport4Item newItem = new Model.SeDinMonthReport4Item
                {
                    UnitName = item.UnitName,
                    SafeManangerNum = getPersonsNum( getPersons, item.UnitId, "1"),
                    OtherManangerNum = getPersonsNum(getPersons, item.UnitId, "2"),
                    SpecialWorkerNum = getPersonsNum(getPersons, item.UnitId, "3"),
                    GeneralWorkerNum = getPersonsNum(getPersons, item.UnitId, "4"),
                    TotalNum = getPersonsNum(getPersons, item.UnitId, "5"),
                };
                getLists.Add(newItem);
            }

            return getLists.ToList();
        }

        /// <summary>
        ///  获取人员数量
        /// </summary>
        /// <param name="unitId"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static int getPersonsNum(List<Model.SitePerson_Person> getPersons, string unitId, string type)
        {
            int num = 0;
            var getUnitPersons = getPersons.Where(x => x.UnitId == unitId);
            if (getUnitPersons.Count() > 0)
            {
                if (type == "1")
                {
                    num = (from x in getPersons
                               join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                               where y.IsHsse == true
                               select x).Count();
                }
                else if (type == "2")
                {
                    num = (from x in getPersons
                           join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                           where (y.IsHsse == false || !y.IsHsse.HasValue)  && (y.PostType=="1" || y.PostType == "4")
                           select x).Count();
                }
              else  if (type == "3")
                {
                    num = (from x in getPersons
                           join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                           where y.PostType == "2"
                           select x).Count();
                }
                else if (type == "4")
                {
                    num = (from x in getPersons
                           join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                           where y.PostType == "3"
                           select x).Count();
                }
                else if (type == "5")
                {
                    num = getUnitPersons.Count();
                }
            }
            return num;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --5、本月大型、特种设备投入情况
        /// <summary>
        /// 获取赛鼎月报初始化页面 --5、本月大型、特种设备投入情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport5Item> getSeDinMonthReportNullPage5(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            List<Model.SeDinMonthReport5Item> getLists = new List<Model.SeDinMonthReport5Item>();
            var getUnits = from x in Funs.DB.Base_Unit
                           join y in Funs.DB.Project_ProjectUnit on x.UnitId equals y.UnitId
                           where y.ProjectId == projectId
                           select x;
            var getPerSons = from x in Funs.DB.SitePerson_Person
                             where x.ProjectId == projectId && x.InTime <= startDateD && (!x.OutTime.HasValue)
                             select x;
            foreach (var item in getUnits)
            {
                Model.SeDinMonthReport5Item newItem = new Model.SeDinMonthReport5Item
                {
                    UnitName = item.UnitName,
                    T01 =0,
                    T02 = 0,
                    T03 = 0,
                    T04 = 0,
                    T05 = 0,
                    T06 = 0,
                    D01 = 0,
                    D02 = 0,
                    D03 = 0,
                    D04 =0,
                    S01 = 0,
                };
                getLists.Add(newItem);
            }

            return getLists.ToList();
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --6、安全生产费用投入情况
        /// <summary>
        /// 获取赛鼎月报初始化页面 --6、安全生产费用投入情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport6Item getSeDinMonthReportNullPage6(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);          
               var getLists = new Model.SeDinMonthReport6Item
                {
                    SafetyMonth = 0,
                    SafetyYear = 0,
                    SafetyTotal = 0,
                    LaborMonth = 0,
                    LaborYear = 0,
                    LaborTotal = 0,
                    ProgressMonth = 0,
                    ProgressYear = 0,
                    ProgressTotal = 0,
                    EducationMonth = 0,
                    EducationYear = 0,
                    EducationTotal = 0,
                    SumMonth = 0,
                    SumYear = 0,
                    SumTotal = 0,
                    ContractMonth = 0,
                    ContractYear = 0,
                    ContractTotal = 0,
                    ConstructionCost = 0,
                };
            return getLists;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --7、项目HSE培训统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --7、项目HSE培训统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport7Item getSeDinMonthReportNullPage7(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            var getTrainRecord = from x in Funs.DB.EduTrain_TrainRecord
                                 where x.ProjectId == projectId && startDateD <= x.TrainStartDate && endDateD > x.TrainStartDate
                                 select x;
            Model.SeDinMonthReport7Item newItem = new Model.SeDinMonthReport7Item();
            newItem.SpecialMontNum = 0;
            newItem.SpecialYearNum = 0;
                newItem.SpecialTotalNum = 0;
                newItem.SpecialMontPerson = 0;
                newItem.SpecialYearPerson = 0;
                newItem.SpecialTotalPerson = 0;
                newItem.EmployeeMontNum = 0;
                newItem.EmployeeYearNum = 0;
                newItem.EmployeeTotalNum = 0;
                newItem.EmployeeMontPerson = 0;
                newItem.EmployeeYearPerson = 0;
                newItem.EmployeeTotalPerson = 0;
            return newItem;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --8、项目HSE会议统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --8、项目HSE会议统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport8Item getSeDinMonthReportNullPage8(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            Model.SeDinMonthReport8Item newItem = new Model.SeDinMonthReport8Item();
            //// 周例会
            var getAllWeeks = from x in Funs.DB.Meeting_WeekMeeting where x.ProjectId == projectId select x;
            var getMontWeeks = getAllWeeks.Where(x => x.WeekMeetingDate >= startDateD && x.WeekMeetingDate < endDateD);            
            newItem.WeekMontNum = getMontWeeks.Count();
            newItem.WeekTotalNum = getAllWeeks.Count();
            newItem.WeekMontPerson = getMontWeeks.Sum(x => x.AttentPersonNum) ?? 0;
            /// 月例会
            var getAllMonths = from x in Funs.DB.Meeting_MonthMeeting where x.ProjectId == projectId select x;
            var getMontMonths = getAllMonths.Where(x => x.MonthMeetingDate >= startDateD && x.MonthMeetingDate < endDateD);
            newItem.MonthMontNum = getMontMonths.Count();
            newItem.MonthTotalNum = getAllMonths.Count();
            newItem.MonthMontPerson = getMontMonths.Sum(x => x.AttentPersonNum) ?? 0;
            /// 专题会议
            var getAllSpecials = from x in Funs.DB.Meeting_SpecialMeeting where x.ProjectId == projectId select x;
            var getMontSpecials = getAllSpecials.Where(x => x.SpecialMeetingDate >= startDateD && x.SpecialMeetingDate < endDateD);
            newItem.SpecialMontNum = getMontSpecials.Count();
            newItem.SpecialTotalNum = getAllSpecials.Count();
            newItem.SpecialMontPerson = getMontSpecials.Sum(x => x.AttentPersonNum) ?? 0;
            ////班前会
            newItem.SeDinMonthReport8ItemItem = getSeDinMonthReport8ItemNull(projectId, month, startDateD, endDateD);
            return newItem;
        }

        /// <summary>
        ///  获取项目HSE会议统计明细
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport8ItemItem> getSeDinMonthReport8ItemNull(string projectId, string month, DateTime? startDateD, DateTime? endDateD)
        {
            List<Model.SeDinMonthReport8ItemItem> getLists = new List<Model.SeDinMonthReport8ItemItem>();
            var getUnits = from x in Funs.DB.Base_Unit
                                         join y in Funs.DB.Project_ProjectUnit on x.UnitId equals y.UnitId
                                         where y.ProjectId == projectId
                                         select x;
            var getClassMeets = from x in Funs.DB.Meeting_ClassMeeting
                                where x.ProjectId == projectId && x.ClassMeetingDate >=startDateD && x.ClassMeetingDate <endDateD
                                select x;
            foreach (var item in getUnits)
            {
                var getTeamGroups = from x in Funs.DB.ProjectData_TeamGroup
                                   where x.ProjectId == projectId && x.UnitId == item.UnitId
                                    select x;
                var getUnitClassMeets = getClassMeets.Where(x=>x.UnitId == item.UnitId);
                foreach (var itemT in getTeamGroups)
                {
                    var getTClassMeets = getUnitClassMeets.Where(x => x.TeamGroupId == itemT.TeamGroupId);
                    Model.SeDinMonthReport8ItemItem newItemT = new Model.SeDinMonthReport8ItemItem
                    {
                        UnitName = item.UnitName,
                        TeamName = itemT.TeamGroupName,
                        ClassNum = getTClassMeets.Count(),
                        ClassPersonNum = getTClassMeets.Sum(x => x.AttentPersonNum) ?? 0
                    };
                    getLists.Add(newItemT);
                }

                var getTClassMeetNulls = getUnitClassMeets.Where(x => x.TeamGroupId ==null);
                if (getTClassMeetNulls.Count() > 0)
                {
                    Model.SeDinMonthReport8ItemItem newItemNT = new Model.SeDinMonthReport8ItemItem
                    {
                        UnitName = item.UnitName,
                        TeamName = "/",
                        ClassNum = getTClassMeetNulls.Count(),
                        ClassPersonNum = getTClassMeetNulls.Sum(x => x.AttentPersonNum) ?? 0
                    };
                    getLists.Add(newItemNT);
                }
            }

            return getLists.OrderBy(x=>x.UnitName).ToList();
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --9、项目HSE检查统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --9、项目HSE检查统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport9Item getSeDinMonthReportNullPage9(string projectId, string month, string startDate, string endDate)
        {
            var nowDate = System.DateTime.Now;
            Model.SeDinMonthReport9Item newItem = new Model.SeDinMonthReport9Item
            {
                DailyMonth = 0,
                DailyYear = 0,
                DailyTotal = 0,
                WeekMonth = 0,
                WeekYear = 0,
                WeekTotal = 0,
                SpecialMonth = 0,
                SpecialYear = 0,
                SpecialTotal = 0,
                MonthlyMonth = 0,
                MonthlyYear = 0,
                MonthlyTotal = 0,
                SeDinMonthReport9ItemRectification = getSeDinMonthReport9ItemRectificationNull(projectId, month, startDate, endDate),
                SeDinMonthReport9ItemSpecial= getSeDinMonthReport9ItemSpecialNull(projectId, month, startDate, endDate),
                SeDinMonthReport9ItemStoppage = getSeDinMonthReport9ItemStoppageNull(projectId, month, startDate, endDate),
            };
            return newItem;
        }

        /// <summary>
        ///  获取隐患整改单
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport9ItemRectification> getSeDinMonthReport9ItemRectificationNull(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            List<Model.SeDinMonthReport9ItemRectification> getLists = new List<Model.SeDinMonthReport9ItemRectification>();
            var getUnits = from x in Funs.DB.Base_Unit
                           join y in Funs.DB.Project_ProjectUnit on x.UnitId equals y.UnitId
                           where y.ProjectId == projectId
                           select x;
            foreach (var item in getUnits)
            {
                Model.SeDinMonthReport9ItemRectification newItem = new Model.SeDinMonthReport9ItemRectification
                {
                    UnitName = item.UnitName,
                    IssuedMonth = 0,
                    RectificationMoth = 0,
                    IssuedTotal = 0,
                    RectificationTotal = 0,
                };
                getLists.Add(newItem);
            }

            return getLists.OrderBy(x => x.UnitName).ToList();
        }
        /// <summary>
        ///  获取专项检查
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport9ItemSpecial> getSeDinMonthReport9ItemSpecialNull(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            List<Model.SeDinMonthReport9ItemSpecial> getLists = new List<Model.SeDinMonthReport9ItemSpecial>();
            var getUnits =  APIBaseInfoService.getProjectCheckItemSet(projectId, "2", "0");  
            foreach (var item in getUnits)
            {
                Model.SeDinMonthReport9ItemSpecial newItem = new Model.SeDinMonthReport9ItemSpecial
                {
                    TypeName = item.BaseInfoName,
                    CheckMonth = 0,
                    CheckYear = 0,
                    CheckTotal = 0,
                };
                getLists.Add(newItem);
            }

            return getLists.ToList();
        }

        /// <summary>
        ///  获取停工令
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport9ItemStoppage> getSeDinMonthReport9ItemStoppageNull(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            List<Model.SeDinMonthReport9ItemStoppage> getLists = new List<Model.SeDinMonthReport9ItemStoppage>();
            var getUnits = from x in Funs.DB.Base_Unit
                           join y in Funs.DB.Project_ProjectUnit on x.UnitId equals y.UnitId
                           where y.ProjectId == projectId
                           select x;
            foreach (var item in getUnits)
            {
                Model.SeDinMonthReport9ItemStoppage newItem = new Model.SeDinMonthReport9ItemStoppage
                {
                    UnitName = item.UnitName,
                    IssuedMonth = 0,
                    StoppageMonth = 0,
                    IssuedTotal = 0,
                    StoppageTotal = 0,
                };
                getLists.Add(newItem);
            }

            return getLists.OrderBy(x => x.UnitName).ToList();
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --10、项目HSE培训统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --10、项目奖惩情况统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport10Item getSeDinMonthReportNullPage10(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            var getLists = new Model.SeDinMonthReport10Item
            {
                SafeMonthNum = 0,
                SafeTotalNum = 0,
                SafeMonthMoney = 0,
                SafeTotalMoney = 0,
                HseMonthNum = 0,
                HseTotalNum = 0,
                HseMonthMoney = 0,
                HseTotalMoney = 0,
                ProduceMonthNum = 0,
                ProduceTotalNum = 0,
                ProduceMonthMoney = 0,
                ProduceTotalMoney = 0,
                AccidentMonthNum = 0,
                AccidentTotalNum = 0,
                AccidentMonthMoney = 0,
                AccidentTotalMoney = 0,
                ViolationMonthNum = 0,
                ViolationTotalNum = 0,
                ViolationMonthMoney = 0,
                ViolationTotalMoney = 0,
                ManageMonthNum = 0,
                ManageTotalNum = 0,
                ManageMonthMoney = 0,
                ManageTotalMoney = 0,
            };
            return getLists;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --11、项目危大工程施工情况
        /// <summary>
        /// 获取赛鼎月报初始化页面 --11、项目危大工程施工情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport11Item getSeDinMonthReportNullPage11(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            var getLists = new Model.SeDinMonthReport11Item
            {
                RiskWorkNum = 0,
                RiskFinishedNum = 0,
                RiskWorkNext = "",
                LargeWorkNum = 0,
                LargeFinishedNum = 0,
                LargeWorkNext = "",
            };
            return getLists;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --12、项目应急演练情况
        /// <summary>
        /// 获取赛鼎月报初始化页面 --12、项目应急演练情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport12Item getSeDinMonthReportNullPage12(string projectId, string month, string startDate, string endDate)
        {
            var startDateD = Funs.GetNewDateTime(startDate);
            var endDateD = Funs.GetNewDateTime(endDate);
            var getLists = new Model.SeDinMonthReport12Item
            {
                MultipleSiteInput = 0,
                MultipleSitePerson = 0,
                MultipleSiteNum = 0,
                MultipleSiteTotalNum = 0,
                MultipleSiteNext = "",
                MultipleDesktopInput = 0,
                MultipleDesktopPerson = 0,
                MultipleDesktopNum = 0,
                MultipleDesktopTotalNum = 0,
                MultipleDesktopNext = "",
                SingleSiteInput = 0,
                SingleSitePerson = 0,
                SingleSiteNum = 0,
                SingleSiteTotalNum = 0,
                SingleSiteNext = "",
                SingleDesktopInput = 0,
                SingleDesktopPerson = 0,
                SingleDesktopNum = 0,
                SingleDesktopTotalNum = 0,
                SingleDesktopNext = "",
            };
            return getLists;
        }
        #endregion
        #endregion

        #region 获取赛鼎月报详细
        #region  获取赛鼎月报详细 --0、封面
        /// <summary>
        /// 获取赛鼎月报详细
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReportItem getSeDinMonthReport0ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReportItem getInfo = new Model.SeDinMonthReportItem();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport
                           where x.ProjectId == projectId && x.ReporMonth.Value.Year == monthD.Value.Year && x.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReportItem
                           {
                               MonthReportId = x.MonthReportId,
                               ProjectId = x.ProjectId,
                               DueDate = string.Format("{0:yyyy-MM-dd}", x.DueDate),
                               StartDate = string.Format("{0:yyyy-MM-dd}", x.StartDate),
                               EndDate = string.Format("{0:yyyy-MM-dd}", x.EndDate),
                               ReporMonth = string.Format("{0:yyyy-MM}", x.ReporMonth),
                               CompileManId = x.CompileManId,
                               CompileManName = Funs.DB.Sys_User.First(u => u.UserId == x.CompileManId).UserName,
                               AuditManId = x.AuditManId,
                               AuditManName = Funs.DB.Sys_User.First(u => u.UserId == x.AuditManId).UserName,
                               ApprovalManId = x.ApprovalManId,
                               ApprovalManName = Funs.DB.Sys_User.First(u => u.UserId == x.ApprovalManId).UserName,                             
                               //ThisSummary = x.ThisSummary,
                               //NextPlan = x.NextPlan,

                           }).FirstOrDefault();
            }

            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --1、项目信息
        /// <summary>
        /// 获取赛鼎月报详细 --1、项目信息
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport1Item getSeDinMonthReport1ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport1Item getInfo = new Model.SeDinMonthReport1Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport1
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport1Item
                           {
                               MonthReport1Id = x.MonthReport1Id,
                               MonthReportId = x.MonthReportId,
                               ProjectCode = x.ProjectCode,
                               ProjectName = x.ProjectName,
                               ProjectType = x.ProjectType,
                               StartDate = string.Format("{0:yyyy-MM-dd}", x.StartDate),
                               EndDate = string.Format("{0:yyyy-MM-dd}", x.EndDate),
                               ProjectManager = x.ProjectManager,
                               HsseManager = x.HsseManager,
                               ContractAmount = x.ContractAmount,
                               ConstructionStage = x.ConstructionStage,
                               ProjectAddress = x.ProjectAddress,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --2、项目安全工时统计
        /// <summary>
        /// 获取赛鼎月报详细 --2、项目安全工时统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport2Item getSeDinMonthReport2ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport2Item getInfo = new Model.SeDinMonthReport2Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport2
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport2Item
                           {
                               MonthReport2Id = x.MonthReport2Id,
                               MonthReportId = x.MonthReportId,
                               MonthWorkTime = x.MonthWorkTime,
                               YearWorkTime = x.YearWorkTime,
                               ProjectWorkTime = x.ProjectWorkTime,
                               TotalLostTime = x.TotalLostTime,
                               MillionLossRate = x.MillionLossRate,
                               TimeAccuracyRate = x.TimeAccuracyRate,
                               StartDate = string.Format("{0:yyyy-MM-dd}", x.StartDate),
                               EndDate = string.Format("{0:yyyy-MM-dd}", x.EndDate),
                               SafeWorkTime = x.SafeWorkTime,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --3、项目HSE事故、事件统计
        /// <summary>
        /// 获取赛鼎月报详细
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReportItem getSeDinMonthReport3ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReportItem getInfo = new Model.SeDinMonthReportItem();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport
                           where x.ProjectId == projectId && x.ReporMonth.Value.Year == monthD.Value.Year && x.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReportItem
                           {
                               MonthReportId = x.MonthReportId,
                               ProjectId = x.ProjectId,
                               AccidentsSummary = x.AccidentsSummary,
                               SeDinMonthReport3Item = getSeDinMonthReport3Item(x.MonthReportId),
                           }).FirstOrDefault();
            }
            return getInfo;
        }

        /// <summary>
        ///  获取项目HSE事故、事件统计明细
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport3Item> getSeDinMonthReport3Item(string monthReportId)
        {
            var getInfo = from x in Funs.DB.SeDin_MonthReport3
                          where x.MonthReportId == monthReportId
                          orderby x.SortIndex
                          select new Model.SeDinMonthReport3Item
                          {
                              BigType = x.BigType,
                              AccidentType = x.AccidentType,
                              SortIndex = x.SortIndex,
                              MonthTimes = x.MonthTimes,
                              TotalTimes=x.TotalTimes,
                              MonthLossTime=x.MonthLossTime,
                              TotalLossTime = x.TotalLossTime,
                              MonthMoney = x.MonthMoney,
                              TotalMoney = x.TotalMoney,
                              MonthPersons = x.MonthPersons,
                              TotalPersons = x.TotalPersons,
                          };
            return getInfo.ToList();
        }
        #endregion
        #region  获取赛鼎月报详细 --4、本月人员投入情况
        /// <summary>
        /// 获取赛鼎月报详细 --4、本月人员投入情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport4Item> getSeDinMonthReport4ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            List<Model.SeDinMonthReport4Item> getInfo = new List<Model.SeDinMonthReport4Item>();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport4
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport4Item
                           {
                               MonthReport4Id = x.MonthReport4Id,
                               MonthReportId = x.MonthReportId,
                               UnitName = x.UnitName,
                               SafeManangerNum = x.SafeManangerNum,
                               OtherManangerNum = x.OtherManangerNum,
                               SpecialWorkerNum = x.SpecialWorkerNum,
                               GeneralWorkerNum = x.GeneralWorkerNum,
                               TotalNum = x.TotalNum,
                           }).ToList();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --5、本月大型、特种设备投入情况
        /// <summary>
        /// 获取赛鼎月报详细 --5、本月大型、特种设备投入情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport5Item> getSeDinMonthReport5ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            List<Model.SeDinMonthReport5Item> getInfo = new List<Model.SeDinMonthReport5Item>();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport5
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport5Item
                           {
                               MonthReport5Id = x.MonthReport5Id,
                               MonthReportId = x.MonthReportId,
                               UnitName = x.UnitName,
                               T01 = x.T01,
                               T02 = x.T02,
                               T03 = x.T03,
                               T04 = x.T04,
                               T05 = x.T05,
                               T06 = x.T06,
                               D01 = x.D01,
                               D02 = x.D02,
                               D03 = x.D03,
                               D04 = x.D04,
                               S01 = x.S01,
                           }).ToList();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --6、安全生产费用投入情况
        /// <summary>
        /// 获取赛鼎月报详细 --6、安全生产费用投入情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport6Item getSeDinMonthReport6ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport6Item getInfo = new Model.SeDinMonthReport6Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport6
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport6Item
                           {
                               MonthReport6Id = x.MonthReport6Id,
                               MonthReportId = x.MonthReportId,
                               SafetyMonth = x.SafetyMonth,
                               SafetyYear = x.SafetyYear,
                               SafetyTotal = x.SafetyTotal,
                               LaborMonth = x.LaborMonth,
                               LaborYear = x.LaborYear,
                               LaborTotal = x.LaborTotal,
                               ProgressMonth = x.ProgressMonth,
                               ProgressYear = x.ProgressYear,
                               ProgressTotal = x.ProgressTotal,
                               EducationMonth = x.EducationMonth,
                               EducationYear = x.EducationYear,
                               EducationTotal = x.EducationTotal,
                               SumMonth = x.SumMonth,
                               SumYear = x.SumYear,
                               SumTotal = x.SumTotal,
                               ContractMonth = x.ContractMonth,
                               ContractYear = x.ContractYear,
                               ContractTotal = x.ContractTotal,
                               ConstructionCost = x.ConstructionCost,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --7、项目HSE培训统计
        /// <summary>
        /// 获取赛鼎月报详细 --7、项目HSE培训统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport7Item getSeDinMonthReport7ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport7Item getInfo = new Model.SeDinMonthReport7Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport7
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport7Item
                           {
                               MonthReport7Id = x.MonthReport7Id,
                               MonthReportId = x.MonthReportId,
                               SpecialMontNum = x.SpecialMontNum,
                               SpecialYearNum = x.SpecialYearNum,
                               SpecialTotalNum = x.SpecialTotalNum,
                               SpecialMontPerson = x.SpecialMontPerson,
                               SpecialYearPerson = x.SpecialYearPerson,
                               SpecialTotalPerson = x.SpecialTotalPerson,
                               EmployeeMontNum = x.EmployeeMontNum,
                               EmployeeYearNum = x.EmployeeYearNum,
                               EmployeeTotalNum = x.EmployeeTotalNum,
                               EmployeeMontPerson = x.EmployeeMontPerson,
                               EmployeeYearPerson = x.EmployeeYearPerson,
                               EmployeeTotalPerson = x.EmployeeTotalPerson,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --8、项目HSE会议统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --8、项目HSE会议统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport8Item getSeDinMonthReport8ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport8Item getInfo = new Model.SeDinMonthReport8Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport8
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport8Item
                           {
                               MonthReport8Id=x.MonthReport8Id,
                               MonthReportId = x.MonthReportId,
                               WeekMontNum = x.WeekMontNum,
                               WeekTotalNum = x.WeekTotalNum,
                               WeekMontPerson = x.WeekMontPerson,
                               MonthMontNum = x.MonthMontNum,
                               MonthTotalNum = x.MonthTotalNum,
                               MonthMontPerson = x.MonthMontPerson,
                               SpecialMontNum = x.SpecialMontNum,
                               SpecialTotalNum = x.SpecialTotalNum,
                               SpecialMontPerson = x.SpecialMontPerson,
                               SeDinMonthReport8ItemItem = getSeDinMonthReport8Item(x.MonthReportId),
                           }).FirstOrDefault();
            }
            return getInfo;
        }

        /// <summary>
        ///  获取项目HSE会议统计明细
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport8ItemItem> getSeDinMonthReport8Item(string monthReportId)
        {
            var getInfo = from x in Funs.DB.SeDin_MonthReport8Item
                          where x.MonthReportId == monthReportId
                          orderby x.UnitName
                          select new Model.SeDinMonthReport8ItemItem
                          {
                              MonthReport8ItemId = x.MonthReport8ItemId,
                              MonthReportId = x.MonthReportId,
                              UnitName = x.UnitName,
                              TeamName = x.TeamName,
                              ClassNum = x.ClassNum,
                              ClassPersonNum = x.ClassPersonNum,
                          };
            return getInfo.ToList();
        }
        #endregion
        #region  获取赛鼎月报初始化页面 --9、项目HSE检查统计
        /// <summary>
        /// 获取赛鼎月报初始化页面 --9、项目HSE检查统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport9Item getSeDinMonthReport9ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport9Item getInfo = new Model.SeDinMonthReport9Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport9
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport9Item
                           {
                               MonthReport9Id = x.MonthReport9Id,
                               MonthReportId = x.MonthReportId,
                               DailyMonth = x.DailyMonth,
                               DailyYear = x.DailyYear,
                               DailyTotal = x.DailyTotal,
                               WeekMonth = x.WeekMonth,
                               WeekYear = x.WeekYear,
                               WeekTotal = x.WeekTotal,
                               SpecialMonth = x.SpecialMonth,
                               SpecialYear = x.SpecialYear,
                               SpecialTotal = x.SpecialTotal,
                               MonthlyMonth = x.MonthlyMonth,
                               MonthlyYear = x.MonthlyYear,
                               MonthlyTotal = x.MonthlyTotal,
                               SeDinMonthReport9ItemRectification = getSeDinMonthReport9ItemRectification(x.MonthReportId),
                               SeDinMonthReport9ItemSpecial = getSeDinMonthReport9ItemSpecial(x.MonthReportId),
                               SeDinMonthReport9ItemStoppage = getSeDinMonthReport9ItemStoppage(x.MonthReportId),
                           }).FirstOrDefault();
            }
            return getInfo;
        }

        /// <summary>
        ///  获取隐患整改单
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport9ItemRectification> getSeDinMonthReport9ItemRectification(string monthReportId)
        {
            var getInfo = from x in Funs.DB.SeDin_MonthReport9Item_Rectification
                          where x.MonthReportId == monthReportId
                          orderby x.UnitName
                          select new Model.SeDinMonthReport9ItemRectification
                          {
                              MonthReport9ItemId = x.MonthReport9ItemId,
                              MonthReportId = x.MonthReportId,
                              UnitName = x.UnitName,
                              IssuedMonth = x.IssuedMonth,
                              RectificationMoth = x.RectificationMoth,
                              IssuedTotal = x.IssuedTotal,
                              RectificationTotal = x.RectificationTotal,
                          };
            return getInfo.ToList();
        }
        /// <summary>
        ///  获取专项检查
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport9ItemSpecial> getSeDinMonthReport9ItemSpecial(string monthReportId)
        {
            var getInfo = from x in Funs.DB.SeDin_MonthReport9Item_Special
                          where x.MonthReportId == monthReportId
                          orderby x.TypeName
                          select new Model.SeDinMonthReport9ItemSpecial
                          {
                              MonthReport9ItemId = x.MonthReport9ItemId,
                              MonthReportId = x.MonthReportId,
                              TypeName = x.TypeName,
                              CheckMonth = x.CheckMonth,
                              CheckYear = x.CheckYear,
                              CheckTotal = x.CheckTotal,
                          };
            return getInfo.ToList();
        }
        /// <summary>
        ///  获取停工令
        /// </summary>
        /// <returns></returns>
        public static List<Model.SeDinMonthReport9ItemStoppage> getSeDinMonthReport9ItemStoppage(string monthReportId)
        {
            var getInfo = from x in Funs.DB.SeDin_MonthReport9Item_Stoppage
                          where x.MonthReportId == monthReportId
                          orderby x.UnitName
                          select new Model.SeDinMonthReport9ItemStoppage
                          {
                              MonthReport9ItemId = x.MonthReport9ItemId,
                              MonthReportId = x.MonthReportId,
                              UnitName = x.UnitName,
                              IssuedMonth = x.IssuedMonth,
                              StoppageMonth = x.StoppageMonth,
                              IssuedTotal = x.IssuedTotal,
                              StoppageTotal = x.StoppageTotal,
                          };
            return getInfo.ToList();
        }
        #endregion
        #region  获取赛鼎月报详细 --10、项目HSE培训统计
        /// <summary>
        /// 获取赛鼎月报详细 --10、项目HSE培训统计
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport10Item getSeDinMonthReport10ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport10Item getInfo = new Model.SeDinMonthReport10Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport10
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport10Item
                           {
                               MonthReport10Id = x.MonthReport10Id,
                               MonthReportId = x.MonthReportId,
                               SafeMonthNum = x.SafeMonthNum,
                               SafeTotalNum = x.SafeTotalNum,
                               SafeMonthMoney = x.SafeMonthMoney,
                               SafeTotalMoney = x.SafeTotalMoney,
                               HseMonthNum = x.HseMonthNum,
                               HseTotalNum = x.HseTotalNum,
                               HseMonthMoney = x.HseMonthMoney,
                               HseTotalMoney = x.HseTotalMoney,
                               ProduceMonthNum = x.ProduceMonthNum,
                               ProduceTotalNum = x.ProduceTotalNum,
                               ProduceMonthMoney = x.ProduceMonthMoney,
                               ProduceTotalMoney = x.ProduceTotalMoney,
                               AccidentMonthNum = x.AccidentMonthNum,
                               AccidentTotalNum = x.AccidentTotalNum,
                               AccidentMonthMoney = x.AccidentMonthMoney,
                               AccidentTotalMoney = x.AccidentTotalMoney,
                               ViolationMonthNum = x.ViolationMonthNum,
                               ViolationTotalNum = x.ViolationTotalNum,
                               ViolationMonthMoney = x.ViolationMonthMoney,
                               ViolationTotalMoney = x.ViolationTotalMoney,
                               ManageMonthNum = x.ManageMonthNum,
                               ManageTotalNum = x.ManageTotalNum,
                               ManageMonthMoney = x.ManageMonthMoney,
                               ManageTotalMoney = x.ManageTotalMoney,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --11、项目危大工程施工情况
        /// <summary>
        /// 获取赛鼎月报详细 --11、项目危大工程施工情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport11Item getSeDinMonthReport11ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport11Item getInfo = new Model.SeDinMonthReport11Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport11
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport11Item
                           {
                               MonthReport11Id = x.MonthReport11Id,
                               MonthReportId = x.MonthReportId,
                               RiskWorkNum = x.RiskWorkNum,
                               RiskFinishedNum = x.RiskFinishedNum,
                               RiskWorkNext = x.RiskWorkNext,
                               LargeWorkNum = x.LargeWorkNum,
                               LargeFinishedNum = x.LargeFinishedNum,
                               LargeWorkNext = x.LargeWorkNext,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --12、项目应急演练情况
        /// <summary>
        /// 获取赛鼎月报详细 --12、项目应急演练情况
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReport12Item getSeDinMonthReport12ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReport12Item getInfo = new Model.SeDinMonthReport12Item();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport12
                           join y in Funs.DB.SeDin_MonthReport on x.MonthReportId equals y.MonthReportId
                           where y.ProjectId == projectId && y.ReporMonth.Value.Year == monthD.Value.Year && y.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReport12Item
                           {
                               MonthReport12Id = x.MonthReport12Id,
                               MonthReportId = x.MonthReportId,
                               MultipleSiteInput = x.MultipleSiteInput,
                               MultipleSitePerson = x.MultipleSitePerson,
                               MultipleSiteNum = x.MultipleSiteNum,
                               MultipleSiteTotalNum = x.MultipleSiteTotalNum,
                               MultipleSiteNext = x.MultipleSiteNext,
                               MultipleDesktopInput = x.MultipleDesktopInput,
                               MultipleDesktopPerson = x.MultipleDesktopPerson,
                               MultipleDesktopNum = x.MultipleDesktopNum,
                               MultipleDesktopTotalNum = x.MultipleDesktopTotalNum,
                               MultipleDesktopNext = x.MultipleDesktopNext,
                               SingleSiteInput = x.SingleSiteInput,
                               SingleSitePerson = x.SingleSitePerson,
                               SingleSiteNum = x.SingleSiteNum,
                               SingleSiteTotalNum = x.SingleSiteTotalNum,
                               SingleSiteNext = x.SingleSiteNext,
                               SingleDesktopInput = x.SingleDesktopInput,
                               SingleDesktopPerson = x.SingleDesktopPerson,
                               SingleDesktopNum = x.SingleDesktopNum,
                               SingleDesktopTotalNum = x.SingleDesktopTotalNum,
                               SingleDesktopNext = x.SingleDesktopNext,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #region  获取赛鼎月报详细 --13、14、本月HSE活动综述、下月HSE工作计划
        /// <summary>
        /// 获取赛鼎月报详细
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="month"></param>
        /// <returns></returns>
        public static Model.SeDinMonthReportItem getSeDinMonthReport13ById(string projectId, string month)
        {
            var monthD = Funs.GetNewDateTime(month);
            Model.SeDinMonthReportItem getInfo = new Model.SeDinMonthReportItem();
            if (monthD.HasValue)
            {
                getInfo = (from x in Funs.DB.SeDin_MonthReport
                           where x.ProjectId == projectId && x.ReporMonth.Value.Year == monthD.Value.Year && x.ReporMonth.Value.Month == monthD.Value.Month
                           select new Model.SeDinMonthReportItem
                           {
                               MonthReportId = x.MonthReportId,
                               ProjectId = x.ProjectId,
                               ThisSummary = x.ThisSummary,
                               NextPlan = x.NextPlan,
                           }).FirstOrDefault();
            }
            return getInfo;
        }
        #endregion
        #endregion

        #region 保存
        #region 保存 MonthReport0 封面
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport0(Model.SeDinMonthReportItem newItem)
        {
           
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport newReport = new Model.SeDin_MonthReport
                {
                    MonthReportId = newItem.MonthReportId,
                    ProjectId = newItem.ProjectId,                  
                    DueDate = Funs.GetNewDateTime(newItem.DueDate),
                    StartDate = Funs.GetNewDateTime(newItem.StartDate),
                    EndDate = Funs.GetNewDateTime(newItem.EndDate),
                    ReporMonth = Funs.GetNewDateTime(newItem.ReporMonth),
                    States =newItem.States,
                    //ThisSummary = System.Web.HttpUtility.HtmlEncode(newItem.ThisSummary),
                    //NextPlan = System.Web.HttpUtility.HtmlEncode(newItem.NextPlan),
                };
                if (!string.IsNullOrEmpty(newItem.CompileManId))
                {
                    newReport.CompileManId = newItem.CompileManId;
                }
                if (!string.IsNullOrEmpty(newItem.AuditManId))
                {
                    newReport.AuditManId = newItem.AuditManId;
                }
                if (!string.IsNullOrEmpty(newItem.ApprovalManId))
                {
                    newReport.ApprovalManId = newItem.ApprovalManId;
                }
                var updateReport = db.SeDin_MonthReport.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId || (x.ProjectId==newItem.ProjectId && x.ReporMonth ==newReport.ReporMonth));
                if (updateReport == null)
                {
                    newReport.MonthReportId = SQLHelper.GetNewID();
                    db.SeDin_MonthReport.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.DueDate = newReport.DueDate;
                    updateReport.StartDate = newReport.StartDate;
                    updateReport.EndDate = newReport.EndDate;
                    updateReport.CompileManId = newReport.CompileManId;
                    updateReport.AuditManId = newReport.AuditManId;
                    updateReport.ApprovalManId = newReport.ApprovalManId;
                    //updateReport.ThisSummary = newReport.ThisSummary;
                    //updateReport.NextPlan = newReport.NextPlan;                  
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport1、项目信息
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport1(Model.SeDinMonthReport1Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport1 newReport = new Model.SeDin_MonthReport1
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport1Id = newItem.MonthReport1Id,
                    ProjectCode=newItem.ProjectCode,
                    ProjectName = newItem.ProjectName,
                    ProjectType=newItem.ProjectType,
                    StartDate = Funs.GetNewDateTime(newItem.StartDate),
                    EndDate = Funs.GetNewDateTime(newItem.EndDate),
                    ProjectManager = newItem.ProjectManager,
                    HsseManager = newItem.HsseManager,
                    ContractAmount = newItem.ContractAmount,
                    ConstructionStage = newItem.ConstructionStage,
                    ProjectAddress = newItem.ProjectAddress,
                };
                var updateReport = db.SeDin_MonthReport1.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId );
                if (updateReport == null)
                {
                    newReport.MonthReport1Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport1.InsertOnSubmit(newReport);                   
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.ProjectCode = newReport.ProjectCode;
                    updateReport.ProjectName = newReport.ProjectName;
                    updateReport.ProjectType = newReport.ProjectType;
                    updateReport.StartDate = newReport.StartDate;
                    updateReport.EndDate = newReport.EndDate;
                    updateReport.ProjectManager = newReport.ProjectManager;
                    updateReport.HsseManager = newReport.HsseManager;
                    updateReport.ContractAmount = newReport.ContractAmount;
                    updateReport.ConstructionStage = newReport.ConstructionStage;
                    updateReport.ProjectAddress = newReport.ProjectAddress;
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport2、项目安全工时统计
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport2(Model.SeDinMonthReport2Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport2 newReport = new Model.SeDin_MonthReport2
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport2Id = newItem.MonthReport2Id,
                    MonthWorkTime = newItem.MonthWorkTime,
                    YearWorkTime = newItem.YearWorkTime,
                    ProjectWorkTime = newItem.ProjectWorkTime,
                    TotalLostTime=newItem.TotalLostTime,
                    MillionLossRate = newItem.MillionLossRate,
                    TimeAccuracyRate = newItem.TimeAccuracyRate,
                    StartDate = Funs.GetNewDateTime(newItem.StartDate),
                    EndDate = Funs.GetNewDateTime(newItem.EndDate),
                    SafeWorkTime = newItem.SafeWorkTime,
                };
                var updateReport = db.SeDin_MonthReport2.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId);
                if (updateReport == null)
                {
                    newReport.MonthReport2Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport2.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.MonthWorkTime = newReport.MonthWorkTime;
                    updateReport.YearWorkTime = newReport.YearWorkTime;
                    updateReport.ProjectWorkTime = newReport.ProjectWorkTime;
                    updateReport.TotalLostTime = newReport.TotalLostTime;
                    updateReport.MillionLossRate = newReport.MillionLossRate;
                    updateReport.TimeAccuracyRate = newReport.TimeAccuracyRate;
                    updateReport.StartDate = newReport.StartDate;
                    updateReport.EndDate = newReport.EndDate;
                    updateReport.SafeWorkTime = newReport.SafeWorkTime;                   
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport3、项目HSE事故、事件统计
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport3(Model.SeDinMonthReportItem newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {                
                var updateReport = db.SeDin_MonthReport.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId);
                if (updateReport != null)
                {
                    ///更新事故综述
                    updateReport.AccidentsSummary = newItem.AccidentsSummary;
                    db.SubmitChanges();
                    ////删除明细
                    var delMonthReport3s = from x in db.SeDin_MonthReport3
                                          where x.MonthReportId == newItem.MonthReportId
                                          select x;
                    if (delMonthReport3s.Count() > 0)
                    {
                        db.SeDin_MonthReport3.DeleteAllOnSubmit(delMonthReport3s);
                        db.SubmitChanges();
                    }
                    ////新增明细
                    if (newItem.SeDinMonthReport3Item != null && newItem.SeDinMonthReport3Item.Count() > 0)
                    {
                        foreach (var item in newItem.SeDinMonthReport3Item)
                        {
                            Model.SeDin_MonthReport3 newItem3 = new Model.SeDin_MonthReport3
                            {
                                MonthReport3Id = SQLHelper.GetNewID(),
                                MonthReportId = newItem.MonthReportId,
                                BigType= item.BigType,
                                AccidentType = item.AccidentType,
                                SortIndex = item.SortIndex,
                                MonthTimes = item.MonthTimes,
                                TotalTimes = item.TotalTimes,
                                MonthLossTime = item.MonthLossTime,
                                TotalLossTime = item.TotalLossTime,
                                MonthMoney = item.MonthMoney,
                                TotalMoney = item.TotalMoney,
                                MonthPersons = item.MonthPersons,
                                TotalPersons = item.TotalPersons,
                            };

                            db.SeDin_MonthReport3.InsertOnSubmit(newItem3);
                            db.SubmitChanges();
                        }
                    }
                }

                return newItem.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport4、本月人员投入情况
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport4(Model.SeDinMonthReportItem newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var updateReport = db.SeDin_MonthReport.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId);
                if (updateReport != null)
                {
                    ////删除明细
                    var delMonthReport4s = from x in db.SeDin_MonthReport4
                                           where x.MonthReportId == newItem.MonthReportId
                                           select x;
                    if (delMonthReport4s.Count() > 0)
                    {
                        db.SeDin_MonthReport4.DeleteAllOnSubmit(delMonthReport4s);
                        db.SubmitChanges();
                    }
                    ////新增明细
                    if (newItem.SeDinMonthReport4Item != null && newItem.SeDinMonthReport4Item.Count() > 0)
                    {
                        foreach (var item in newItem.SeDinMonthReport4Item)
                        {
                            Model.SeDin_MonthReport4 newReport4Item = new Model.SeDin_MonthReport4
                            {
                                MonthReportId = newItem.MonthReportId,
                                MonthReport4Id = SQLHelper.GetNewID(),
                                UnitName = item.UnitName,
                                SafeManangerNum = item.SafeManangerNum,
                                OtherManangerNum = item.OtherManangerNum,
                                SpecialWorkerNum = item.SpecialWorkerNum,
                                GeneralWorkerNum = item.GeneralWorkerNum,
                                TotalNum = item.TotalNum,
                            };
                            db.SeDin_MonthReport4.InsertOnSubmit(newReport4Item);
                            db.SubmitChanges();
                        }
                    }
                }
              
                return newItem.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport5、本月大型、特种设备投入情况
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport5(Model.SeDinMonthReportItem newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {

                var updateReport = db.SeDin_MonthReport.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId);
                if (updateReport != null)
                {
                    ////删除明细
                    var delMonthReport5s = from x in db.SeDin_MonthReport5
                                           where x.MonthReportId == newItem.MonthReportId
                                           select x;
                    if (delMonthReport5s.Count() > 0)
                    {
                        db.SeDin_MonthReport5.DeleteAllOnSubmit(delMonthReport5s);
                        db.SubmitChanges();
                    }
                    ////新增明细
                    if (newItem.SeDinMonthReport5Item != null && newItem.SeDinMonthReport5Item.Count() > 0)
                    {
                        foreach (var item in newItem.SeDinMonthReport5Item)
                        {
                            Model.SeDin_MonthReport5 newReport5Item = new Model.SeDin_MonthReport5
                            {
                                MonthReportId = newItem.MonthReportId,
                                MonthReport5Id = SQLHelper.GetNewID(),
                                UnitName = item.UnitName,
                                T01 = item.T01,
                                T02 = item.T02,
                                T03 = item.T03,
                                T04 = item.T04,
                                T05 = item.T05,
                                T06 = item.T06,
                                D01 = item.D01,
                                D02 = item.D02,
                                D03 = item.D03,
                                D04 = item.D04,
                                S01 = item.S01,
                            };
                            db.SeDin_MonthReport5.InsertOnSubmit(newReport5Item);
                            db.SubmitChanges();
                        }
                    }
                }

                return newItem.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport6、安全生产费用投入情况
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport6(Model.SeDinMonthReport6Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport6 newReport = new Model.SeDin_MonthReport6
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport6Id = newItem.MonthReport6Id,
                    SafetyMonth = newItem.SafetyMonth,
                    SafetyYear = newItem.SafetyYear,
                    SafetyTotal = newItem.SafetyTotal,
                    LaborMonth = newItem.LaborMonth,
                    LaborYear = newItem.LaborYear,
                    LaborTotal = newItem.LaborTotal,
                    ProgressMonth = newItem.ProgressMonth,
                    ProgressYear = newItem.ProgressYear,
                    ProgressTotal = newItem.ProgressTotal,
                    EducationMonth = newItem.EducationMonth,
                    EducationYear = newItem.EducationYear,
                    EducationTotal = newItem.EducationTotal,
                    SumMonth = newItem.SumMonth,
                    SumYear = newItem.SumYear,
                    SumTotal = newItem.SumTotal,
                    ContractMonth = newItem.ContractMonth,
                    ContractYear = newItem.ContractYear,
                    ContractTotal = newItem.ContractTotal,
                    ConstructionCost = newItem.ConstructionCost,
                };
                var updateReport = db.SeDin_MonthReport6.FirstOrDefault(x => x.MonthReport6Id == newItem.MonthReport6Id);
                if (updateReport == null)
                {
                    newReport.MonthReport6Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport6.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.SafetyMonth = newReport.SafetyMonth;
                    updateReport.SafetyYear = newReport.SafetyYear;
                    updateReport.SafetyTotal = newReport.SafetyTotal;
                    updateReport.LaborMonth = newReport.LaborMonth;
                    updateReport.LaborYear = newReport.LaborYear;
                    updateReport.LaborTotal = newReport.LaborTotal;
                    updateReport.ProgressMonth = newReport.ProgressMonth;
                    updateReport.ProgressYear = newReport.ProgressYear;
                    updateReport.ProgressTotal = newReport.ProgressTotal;
                    updateReport.EducationMonth = newReport.EducationMonth;
                    updateReport.EducationYear = newReport.EducationYear;
                    updateReport.EducationTotal = newReport.EducationTotal;
                    updateReport.SumMonth = newReport.SumMonth;
                    updateReport.SumYear = newReport.SumYear;
                    updateReport.SumTotal = newReport.SumTotal;
                    updateReport.ContractMonth = newReport.ContractMonth;
                    updateReport.ContractYear = newReport.ContractYear;
                    updateReport.ContractTotal = newReport.ContractTotal;
                    updateReport.ConstructionCost = newReport.ConstructionCost;
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport7、项目HSE培训统计
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport7(Model.SeDinMonthReport7Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport7 newReport = new Model.SeDin_MonthReport7
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport7Id = newItem.MonthReport7Id,
                    SpecialMontNum = newItem.SpecialMontNum,
                    SpecialYearNum = newItem.SpecialYearNum,
                    SpecialTotalNum = newItem.SpecialTotalNum,
                    SpecialMontPerson = newItem.SpecialMontPerson,
                    SpecialYearPerson = newItem.SpecialYearPerson,
                    SpecialTotalPerson = newItem.SpecialTotalPerson,
                    EmployeeMontNum = newItem.EmployeeMontNum,
                    EmployeeYearNum = newItem.EmployeeYearNum,
                    EmployeeTotalNum = newItem.EmployeeTotalNum,
                    EmployeeMontPerson = newItem.EmployeeMontPerson,
                    EmployeeYearPerson = newItem.EmployeeYearPerson,
                    EmployeeTotalPerson = newItem.EmployeeTotalPerson,
                };
                var updateReport = db.SeDin_MonthReport7.FirstOrDefault(x => x.MonthReport7Id == newItem.MonthReport7Id);
                if (updateReport == null)
                {
                    newReport.MonthReport7Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport7.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.SpecialMontNum = newReport.SpecialMontNum;
                    updateReport.SpecialYearNum = newReport.SpecialYearNum;
                    updateReport.SpecialTotalNum = newReport.SpecialTotalNum;
                    updateReport.SpecialMontPerson = newReport.SpecialMontPerson;
                    updateReport.SpecialYearPerson = newReport.SpecialYearPerson;
                    updateReport.SpecialTotalPerson = newReport.SpecialTotalPerson;
                    updateReport.EmployeeMontNum = newReport.EmployeeMontNum;
                    updateReport.EmployeeYearNum = newReport.EmployeeYearNum;
                    updateReport.EmployeeTotalNum = newReport.EmployeeTotalNum;
                    updateReport.EmployeeMontPerson = newReport.EmployeeMontPerson;
                    updateReport.EmployeeYearPerson = newReport.EmployeeYearPerson;
                    updateReport.EmployeeTotalPerson = newReport.EmployeeTotalPerson;
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport8、项目HSE会议统计
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport8(Model.SeDinMonthReport8Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport8 newReport = new Model.SeDin_MonthReport8
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport8Id = newItem.MonthReport8Id,
                    WeekMontNum = newItem.WeekMontNum,
                    WeekTotalNum = newItem.WeekTotalNum,
                    WeekMontPerson = newItem.WeekMontPerson,
                    MonthMontNum = newItem.MonthMontNum,
                    MonthTotalNum = newItem.MonthTotalNum,
                    MonthMontPerson = newItem.MonthMontPerson,
                    SpecialMontNum = newItem.SpecialMontNum,
                    SpecialTotalNum = newItem.SpecialTotalNum,
                    SpecialMontPerson = newItem.SpecialMontPerson,
                };
                var updateReport = db.SeDin_MonthReport8.FirstOrDefault(x => x.MonthReport8Id == newItem.MonthReport8Id);
                if (updateReport == null)
                {
                    newReport.MonthReport8Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport8.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.WeekMontNum = newReport.WeekMontNum;
                    updateReport.WeekTotalNum = newReport.WeekTotalNum;
                    updateReport.WeekMontPerson = newReport.WeekMontPerson;
                    updateReport.MonthMontNum = newReport.MonthMontNum;
                    updateReport.MonthTotalNum = newReport.MonthTotalNum;
                    updateReport.MonthMontPerson = newReport.MonthMontPerson;
                    updateReport.SpecialMontNum = newReport.SpecialMontNum;
                    updateReport.SpecialTotalNum = newReport.SpecialTotalNum;
                    updateReport.SpecialMontPerson = newReport.SpecialMontPerson;           
                }
                db.SubmitChanges();
                var get8Items = from x in db.SeDin_MonthReport8Item
                                where x.MonthReportId == newItem.MonthReportId
                                select x;
                if (get8Items.Count() > 0)
                {
                    db.SeDin_MonthReport8Item.DeleteAllOnSubmit(get8Items);
                    db.SubmitChanges();
                }
                if (newItem.SeDinMonthReport8ItemItem != null && newItem.SeDinMonthReport8ItemItem.Count() > 0)
                {
                    foreach (var item in newItem.SeDinMonthReport8ItemItem)
                    {
                        Model.SeDin_MonthReport8Item new8Item = new Model.SeDin_MonthReport8Item
                        {
                            MonthReport8ItemId = SQLHelper.GetNewID(),
                            MonthReportId= newItem.MonthReportId,
                            UnitName=item.UnitName,
                            TeamName = item.TeamName,
                            ClassNum = item.ClassNum,
                            ClassPersonNum = item.ClassPersonNum,
                        };
                        db.SeDin_MonthReport8Item.InsertOnSubmit(new8Item);
                        db.SubmitChanges();
                    }
                }

                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport9、项目HSE检查统计
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport9(Model.SeDinMonthReport9Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport9 newReport = new Model.SeDin_MonthReport9
                {
                    MonthReport9Id = newItem.MonthReport9Id,
                    MonthReportId = newItem.MonthReportId,
                    DailyMonth = newItem.DailyMonth,
                    DailyYear = newItem.DailyYear,
                    DailyTotal = newItem.DailyTotal,
                    WeekMonth = newItem.WeekMonth,
                    WeekYear = newItem.WeekYear,
                    WeekTotal = newItem.WeekTotal,
                    SpecialMonth = newItem.SpecialMonth,
                    SpecialYear = newItem.SpecialYear,
                    SpecialTotal = newItem.SpecialTotal,
                    MonthlyMonth = newItem.MonthlyMonth,
                    MonthlyYear = newItem.MonthlyYear,
                    MonthlyTotal = newItem.MonthlyTotal,
                };

                var updateReport = db.SeDin_MonthReport9.FirstOrDefault(x => x.MonthReport9Id == newItem.MonthReport9Id);
                if (updateReport == null)
                {
                    newReport.MonthReport9Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport9.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.DailyMonth = newReport.DailyMonth;
                    updateReport.DailyYear = newReport.DailyYear;
                    updateReport.DailyTotal = newReport.DailyTotal;
                    updateReport.WeekMonth = newReport.WeekMonth;
                    updateReport.WeekYear = newReport.WeekYear;
                    updateReport.WeekTotal = newReport.WeekTotal;
                    updateReport.SpecialMonth = newReport.SpecialMonth;
                    updateReport.SpecialYear = newReport.SpecialYear;
                    updateReport.SpecialTotal = newReport.SpecialTotal;
                    updateReport.MonthlyMonth = newReport.MonthlyMonth;
                    updateReport.MonthlyYear = newReport.MonthlyYear;
                    updateReport.MonthlyTotal = newReport.MonthlyTotal;
                }
                db.SubmitChanges();
                ////隐患整改单
                var get9Items = from x in db.SeDin_MonthReport9Item_Rectification
                                where x.MonthReportId == newItem.MonthReportId
                                select x;
                if (get9Items.Count() > 0)
                {
                    db.SeDin_MonthReport9Item_Rectification.DeleteAllOnSubmit(get9Items);
                    db.SubmitChanges();
                }
                if (newItem.SeDinMonthReport9ItemRectification != null && newItem.SeDinMonthReport9ItemRectification.Count() > 0)
                {
                    foreach (var item in newItem.SeDinMonthReport9ItemRectification)
                    {
                        Model.SeDin_MonthReport9Item_Rectification new9Item = new Model.SeDin_MonthReport9Item_Rectification
                        {
                            MonthReport9ItemId = SQLHelper.GetNewID(),
                            MonthReportId = newItem.MonthReportId,
                            UnitName = item.UnitName,
                            IssuedMonth = item.IssuedMonth,
                            RectificationMoth = item.RectificationMoth,
                            IssuedTotal = item.IssuedTotal,
                            RectificationTotal = item.RectificationTotal,
                        };
                        db.SeDin_MonthReport9Item_Rectification.InsertOnSubmit(new9Item);
                        db.SubmitChanges();
                    }
                }
                ////专项检查
                var get9Specials = from x in db.SeDin_MonthReport9Item_Special
                                where x.MonthReportId == newItem.MonthReportId
                                select x;
                if (get9Specials.Count() > 0)
                {
                    db.SeDin_MonthReport9Item_Special.DeleteAllOnSubmit(get9Specials);
                    db.SubmitChanges();
                }
                if (newItem.SeDinMonthReport9ItemSpecial != null && newItem.SeDinMonthReport9ItemSpecial.Count() > 0)
                {
                    foreach (var item in newItem.SeDinMonthReport9ItemSpecial)
                    {
                        Model.SeDin_MonthReport9Item_Special new9Item = new Model.SeDin_MonthReport9Item_Special
                        {
                            MonthReport9ItemId = SQLHelper.GetNewID(),
                            MonthReportId = newItem.MonthReportId,
                            TypeName = item.TypeName,
                            CheckMonth = item.CheckMonth,
                            CheckYear = item.CheckYear,
                            CheckTotal = item.CheckTotal,
                        };
                        db.SeDin_MonthReport9Item_Special.InsertOnSubmit(new9Item);
                        db.SubmitChanges();
                    }
                }
                ////停工令
                var get9Stoppages = from x in db.SeDin_MonthReport9Item_Stoppage
                                    where x.MonthReportId == newItem.MonthReportId
                                    select x;
                if (get9Stoppages.Count() > 0)
                {
                    db.SeDin_MonthReport9Item_Stoppage.DeleteAllOnSubmit(get9Stoppages);
                    db.SubmitChanges();
                }
                if (newItem.SeDinMonthReport9ItemStoppage != null && newItem.SeDinMonthReport9ItemStoppage.Count() > 0)
                {
                    foreach (var item in newItem.SeDinMonthReport9ItemStoppage)
                    {
                        Model.SeDin_MonthReport9Item_Stoppage new9Item = new Model.SeDin_MonthReport9Item_Stoppage
                        {
                            MonthReport9ItemId = SQLHelper.GetNewID(),
                            MonthReportId = newItem.MonthReportId,
                            UnitName = item.UnitName,
                            IssuedMonth = item.IssuedMonth,
                            StoppageMonth = item.StoppageMonth,
                            IssuedTotal = item.IssuedTotal,
                            StoppageTotal = item.StoppageTotal,
                        };
                        db.SeDin_MonthReport9Item_Stoppage.InsertOnSubmit(new9Item);
                        db.SubmitChanges();
                    }
                }
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport10、项目HSE培训统计
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport10(Model.SeDinMonthReport10Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport10 newReport = new Model.SeDin_MonthReport10
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport10Id = newItem.MonthReport10Id,
                    SafeMonthNum = newItem.SafeMonthNum,
                    SafeTotalNum = newItem.SafeTotalNum,
                    SafeMonthMoney = newItem.SafeMonthMoney,
                    SafeTotalMoney = newItem.SafeTotalMoney,
                    HseMonthNum = newItem.HseMonthNum,
                    HseTotalNum = newItem.HseTotalNum,
                    HseMonthMoney = newItem.HseMonthMoney,
                    HseTotalMoney = newItem.HseTotalMoney,
                    ProduceMonthNum = newItem.ProduceMonthNum,
                    ProduceTotalNum = newItem.ProduceTotalNum,
                    ProduceMonthMoney = newItem.ProduceMonthMoney,
                    ProduceTotalMoney = newItem.ProduceTotalMoney,
                    AccidentMonthNum = newItem.AccidentMonthNum,
                    AccidentTotalNum = newItem.AccidentTotalNum,
                    AccidentMonthMoney = newItem.AccidentMonthMoney,
                    AccidentTotalMoney = newItem.AccidentTotalMoney,
                    ViolationMonthNum = newItem.ViolationMonthNum,
                    ViolationTotalNum = newItem.ViolationTotalNum,
                    ViolationMonthMoney = newItem.ViolationMonthMoney,
                    ViolationTotalMoney = newItem.ViolationTotalMoney,
                    ManageMonthNum = newItem.ManageMonthNum,
                    ManageTotalNum = newItem.ManageTotalNum,
                    ManageMonthMoney = newItem.ManageMonthMoney,
                    ManageTotalMoney = newItem.ManageTotalMoney,
                };
                var updateReport = db.SeDin_MonthReport10.FirstOrDefault(x => x.MonthReport10Id == newItem.MonthReport10Id);
                if (updateReport == null)
                {
                    newReport.MonthReport10Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport10.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.SafeMonthNum = newItem.SafeMonthNum;
                    updateReport.SafeTotalNum = newItem.SafeTotalNum;
                    updateReport.SafeMonthMoney = newItem.SafeMonthMoney;
                    updateReport.SafeTotalMoney = newItem.SafeTotalMoney;
                    updateReport.HseMonthNum = newItem.HseMonthNum;
                    updateReport.HseTotalNum = newItem.HseTotalNum;
                    updateReport.HseMonthMoney = newItem.HseMonthMoney;
                    updateReport.HseTotalMoney = newItem.HseTotalMoney;
                    updateReport.ProduceMonthNum = newItem.ProduceMonthNum;
                    updateReport.ProduceTotalNum = newItem.ProduceTotalNum;
                    updateReport.ProduceMonthMoney = newItem.ProduceMonthMoney;
                    updateReport.ProduceTotalMoney = newItem.ProduceTotalMoney;
                    updateReport.AccidentMonthNum = newItem.AccidentMonthNum;
                    updateReport.AccidentTotalNum = newItem.AccidentTotalNum;
                    updateReport.AccidentMonthMoney = newItem.AccidentMonthMoney;
                    updateReport.AccidentTotalMoney = newItem.AccidentTotalMoney;
                    updateReport.ViolationMonthNum = newItem.ViolationMonthNum;
                    updateReport.ViolationTotalNum = newItem.ViolationTotalNum;
                    updateReport.ViolationMonthMoney = newItem.ViolationMonthMoney;
                    updateReport.ViolationTotalMoney = newItem.ViolationTotalMoney;
                    updateReport.ManageMonthNum = newItem.ManageMonthNum;
                    updateReport.ManageTotalNum = newItem.ManageTotalNum;
                    updateReport.ManageMonthMoney = newItem.ManageMonthMoney;
                    updateReport.ManageTotalMoney = newItem.ManageTotalMoney;
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport11、项目危大工程施工情况
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport11(Model.SeDinMonthReport11Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport11 newReport = new Model.SeDin_MonthReport11
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport11Id = newItem.MonthReport11Id,
                    RiskWorkNum = newItem.RiskWorkNum,
                    RiskFinishedNum = newItem.RiskFinishedNum,
                    RiskWorkNext = newItem.RiskWorkNext,
                    LargeWorkNum = newItem.LargeWorkNum,
                    LargeFinishedNum = newItem.LargeFinishedNum,
                    LargeWorkNext = newItem.LargeWorkNext,
                };
                var updateReport = db.SeDin_MonthReport11.FirstOrDefault(x => x.MonthReport11Id == newItem.MonthReport11Id);
                if (updateReport == null)
                {
                    newReport.MonthReport11Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport11.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.RiskWorkNum = newItem.RiskWorkNum;
                    updateReport.RiskFinishedNum = newItem.RiskFinishedNum;
                    updateReport.RiskWorkNext = newItem.RiskWorkNext;
                    updateReport.LargeWorkNum = newItem.LargeWorkNum;
                    updateReport.LargeFinishedNum = newItem.LargeFinishedNum;
                    updateReport.LargeWorkNext = newItem.LargeWorkNext;                    
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport12、项目应急演练情况
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport12(Model.SeDinMonthReport12Item newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                Model.SeDin_MonthReport12 newReport = new Model.SeDin_MonthReport12
                {
                    MonthReportId = newItem.MonthReportId,
                    MonthReport12Id = newItem.MonthReport12Id,
                    MultipleSiteInput = newItem.MultipleSiteInput,
                    MultipleSitePerson = newItem.MultipleSitePerson,
                    MultipleSiteNum = newItem.MultipleSiteNum,
                    MultipleSiteTotalNum = newItem.MultipleSiteTotalNum,
                    MultipleSiteNext = newItem.MultipleSiteNext,
                    MultipleDesktopInput = newItem.MultipleDesktopInput,
                    MultipleDesktopPerson = newItem.MultipleDesktopPerson,
                    MultipleDesktopNum = newItem.MultipleDesktopNum,
                    MultipleDesktopTotalNum = newItem.MultipleDesktopTotalNum,
                    MultipleDesktopNext = newItem.MultipleDesktopNext,
                    SingleSiteInput = newItem.SingleSiteInput,
                    SingleSitePerson = newItem.SingleSitePerson,
                    SingleSiteNum = newItem.SingleSiteNum,
                    SingleSiteTotalNum = newItem.SingleSiteTotalNum,
                    SingleSiteNext = newItem.SingleSiteNext,
                    SingleDesktopInput = newItem.SingleDesktopInput,
                    SingleDesktopPerson = newItem.SingleDesktopPerson,
                    SingleDesktopNum = newItem.SingleDesktopNum,
                    SingleDesktopTotalNum = newItem.SingleDesktopTotalNum,
                    SingleDesktopNext = newItem.SingleDesktopNext,
                };
                var updateReport = db.SeDin_MonthReport12.FirstOrDefault(x => x.MonthReport12Id == newItem.MonthReport12Id);
                if (updateReport == null)
                {
                    newReport.MonthReport12Id = SQLHelper.GetNewID();
                    db.SeDin_MonthReport12.InsertOnSubmit(newReport);
                }
                else
                {
                    newReport.MonthReportId = updateReport.MonthReportId;
                    updateReport.MultipleSiteInput = newReport.MultipleSiteInput;
                    updateReport.MultipleSitePerson = newReport.MultipleSitePerson;
                    updateReport.MultipleSiteNum = newReport.MultipleSiteNum;
                    updateReport.MultipleSiteTotalNum = newReport.MultipleSiteTotalNum;
                    updateReport.MultipleSiteNext = newReport.MultipleSiteNext;
                    updateReport.MultipleDesktopInput = newReport.MultipleDesktopInput;
                    updateReport.MultipleDesktopPerson = newReport.MultipleDesktopPerson;
                    updateReport.MultipleDesktopNum = newReport.MultipleDesktopNum;
                    updateReport.MultipleDesktopTotalNum = newReport.MultipleDesktopTotalNum;
                    updateReport.MultipleDesktopNext = newReport.MultipleDesktopNext;
                    updateReport.SingleSiteInput = newReport.SingleSiteInput;
                    updateReport.SingleSitePerson = newReport.SingleSitePerson;
                    updateReport.SingleSiteNum = newReport.SingleSiteNum;
                    updateReport.SingleSiteTotalNum = newReport.SingleSiteTotalNum;
                    updateReport.SingleSiteNext = newReport.SingleSiteNext;
                    updateReport.SingleDesktopInput = newReport.SingleDesktopInput;
                    updateReport.SingleDesktopPerson = newReport.SingleDesktopPerson;
                    updateReport.SingleDesktopNum = newReport.SingleDesktopNum;
                    updateReport.SingleDesktopTotalNum = newReport.SingleDesktopTotalNum;
                    updateReport.SingleDesktopNext = newReport.SingleDesktopNext;
                }
                db.SubmitChanges();
                return newReport.MonthReportId;
            }
        }
        #endregion
        #region 保存 MonthReport13、14、本月HSE活动综述、下月HSE工作计划
        /// <summary>
        /// 保存SeDin_MonthReport
        /// </summary>
        /// <param name="newItem">赛鼎月报</param>
        /// <returns></returns>
        public static string SaveSeDinMonthReport13(Model.SeDinMonthReportItem newItem)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var updateReport = db.SeDin_MonthReport.FirstOrDefault(x => x.MonthReportId == newItem.MonthReportId);
                if (updateReport != null)
                {
                    ///更新事故综述
                    updateReport.ThisSummary = newItem.ThisSummary;
                    updateReport.NextPlan = newItem.NextPlan;
                    if (!string.IsNullOrEmpty(newItem.States))
                    {
                        updateReport.States = newItem.States;
                    }
                    db.SubmitChanges();
                }

                return newItem.MonthReportId;
            }
        }
        #endregion
        #endregion
    }
}
