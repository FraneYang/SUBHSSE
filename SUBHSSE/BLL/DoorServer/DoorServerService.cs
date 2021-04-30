using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 事故类型
    /// </summary>
    public static class DoorServerService
    {
        public static Model.SUBHSSEDB db = Funs.DB;

        #region 根据出入记录 写入考勤记录
        /// <summary>
        ///  根据出入记录 写入考勤记录
        /// </summary>
        public static void InsertEmployInOutRecord(Model.t_d_facerecordItem newFacerecord)
        {
            if (newFacerecord.DateTimeRecord.HasValue)
            {
                ///上午上班 8
                DateTime TWorkIn1= newFacerecord.DateTimeRecord.Value.Date.AddHours(8);
                ///上午下班 12：30
                DateTime TOffDuty1 = newFacerecord.DateTimeRecord.Value.Date.AddHours(12).AddMinutes(30);
                ///下午上班 1：30
                DateTime TWorkIn2 = newFacerecord.DateTimeRecord.Value.Date.AddHours(13).AddMinutes(30);
                ///下午下班 7
                DateTime TOffDuty2 = newFacerecord.DateTimeRecord.Value.Date.AddHours(19);
                Model.T_d_EmployInOutRecord newInOutRecord = new Model.T_d_EmployInOutRecord
                {
                    RecordDate = newFacerecord.DateTimeRecord.Value.Date,
                    EmployNO = newFacerecord.EmployNO,
                    EmployName = newFacerecord.EmployName
                };
                #region 上下班时间
                if (newFacerecord.InOrOut == "进门")
                {
                    ///上午上班
                    if (newFacerecord.DateTimeRecord < TOffDuty1)
                    {
                        newInOutRecord.WorkIn1 = newFacerecord.DateTimeRecord;
                    }
                    else if (newFacerecord.DateTimeRecord < TOffDuty2)
                    {
                        newInOutRecord.WorkIn2 = newFacerecord.DateTimeRecord;
                    }
                    else
                    {
                        newInOutRecord.WorkIn3 = newFacerecord.DateTimeRecord;
                    }
                }
                else
                {
                    ///上午下班
                    if (newFacerecord.DateTimeRecord < TWorkIn2)
                    {
                        newInOutRecord.OffDuty1 = newFacerecord.DateTimeRecord;
                    }
                    else if (newFacerecord.DateTimeRecord < TOffDuty2.AddHours(1))
                    {
                        newInOutRecord.OffDuty2 = newFacerecord.DateTimeRecord;
                    }
                    else
                    {
                        newInOutRecord.OffDuty3 = newFacerecord.DateTimeRecord;
                    }
                }
                #endregion

                bool isInsert = false;
                var getInOutRecord = Funs.DB.T_d_EmployInOutRecord.FirstOrDefault(x => x.EmployNO == newFacerecord.EmployNO && x.RecordDate == newFacerecord.DateTimeRecord.Value.Date);
                if (getInOutRecord == null)
                {
                    isInsert = true;
                }
                if (isInsert)
                {
                    int maxId = 1;
                    var getMax = Funs.DB.T_d_EmployInOutRecord.Select(x => x.EmployInOutRecordId) ;
                    if (getMax.Count() > 0)
                    {
                        maxId = getMax.Max() + 1;
                    }

                    #region 获取部门
                    newInOutRecord.UnitId = newFacerecord.DepartmentID;
                    newInOutRecord.UnitName = newFacerecord.DepartName;
                    var getDep = Funs.DB.T_d_department.FirstOrDefault(x => x.DepartmentID.ToString() == newFacerecord.DepartmentID);
                    if (getDep != null)
                    {
                        if (getDep.ParentID == 0)
                        {
                            newInOutRecord.InstallationId = getDep.DepartmentID.ToString();
                            newInOutRecord.InstallationName = getDep.DepartmentName;
                        }
                        else
                        {
                            var getDep0 = GetSupDep(getDep.ParentID, 0);
                            if (getDep0 != null)
                            {
                                newInOutRecord.InstallationId = getDep0.DepartmentID.ToString();
                                newInOutRecord.InstallationName = getDep0.DepartmentName;
                                var getUnit = GetSupDep(getDep.ParentID, Funs.GetNewIntOrZero(newInOutRecord.InstallationId));
                                if (getUnit != null)
                                {
                                    newInOutRecord.UnitId = getUnit.DepartmentID.ToString();
                                    newInOutRecord.UnitName = getUnit.DepartmentName;
                                }
                            }
                        }
                    }
                    #endregion
                    var getEmploy = Funs.DB.T_d_employinfo.FirstOrDefault(x => x.EmployNO == newFacerecord.EmployNO);
                    if (getEmploy != null)
                    {
                        newInOutRecord.IDCardNo = getEmploy.IDCardNo;
                        newInOutRecord.Nation = getEmploy.Nation;
                        newInOutRecord.PostName = getEmploy.PostName;
                    }

                    newInOutRecord.EmployInOutRecordId = maxId;
                    newInOutRecord.ManHours = 4;
                    Funs.DB.T_d_EmployInOutRecord.InsertOnSubmit(newInOutRecord);
                    Funs.DB.SubmitChanges();
                }
                else
                {
                    if (newInOutRecord.WorkIn1.HasValue && (!getInOutRecord.WorkIn1.HasValue || getInOutRecord.WorkIn1 > newInOutRecord.WorkIn1))
                    {
                        getInOutRecord.WorkIn1 = newInOutRecord.WorkIn1;
                    }
                    if (newInOutRecord.WorkIn2.HasValue && (!getInOutRecord.WorkIn2.HasValue || getInOutRecord.WorkIn2 > newInOutRecord.WorkIn2))
                    {
                        getInOutRecord.WorkIn2 = newInOutRecord.WorkIn2;
                    }
                    if (newInOutRecord.WorkIn3.HasValue && (!getInOutRecord.WorkIn3.HasValue || getInOutRecord.WorkIn3 > newInOutRecord.WorkIn3))
                    {
                        getInOutRecord.WorkIn3 = newInOutRecord.WorkIn3;
                    }

                    if (newInOutRecord.OffDuty1.HasValue && (!getInOutRecord.OffDuty1.HasValue || getInOutRecord.OffDuty1 < newInOutRecord.OffDuty1))
                    {
                        getInOutRecord.OffDuty1 = newInOutRecord.OffDuty1;
                    }
                    if (newInOutRecord.OffDuty2.HasValue && (!getInOutRecord.OffDuty2.HasValue || getInOutRecord.OffDuty2 < newInOutRecord.OffDuty2))
                    {
                        getInOutRecord.OffDuty2 = newInOutRecord.OffDuty2;
                    }
                    if (newInOutRecord.OffDuty3.HasValue && (!getInOutRecord.OffDuty3.HasValue || getInOutRecord.OffDuty3 < newInOutRecord.OffDuty3))
                    {
                        getInOutRecord.OffDuty3 = newInOutRecord.OffDuty3;
                    }
                     int m1 = 0;
                    if (getInOutRecord.WorkIn1.HasValue || getInOutRecord.OffDuty1.HasValue)
                    {
                        m1 = 270;
                        if (getInOutRecord.WorkIn1.HasValue && getInOutRecord.OffDuty1.HasValue)
                        {
                            m1 = Convert.ToInt32((getInOutRecord.OffDuty1 - getInOutRecord.WorkIn1).Value.TotalMinutes);
                        }
                    }
                    int m2 = 0;
                    if (getInOutRecord.WorkIn2.HasValue || getInOutRecord.OffDuty2.HasValue)
                    {
                        m2 = 270;
                        if (getInOutRecord.WorkIn2.HasValue && getInOutRecord.OffDuty2.HasValue)
                        {
                            m2 = Convert.ToInt32((getInOutRecord.OffDuty2 - getInOutRecord.WorkIn2).Value.TotalMinutes);
                        }
                    }
                    int m3 = 0;
                    if (getInOutRecord.WorkIn3.HasValue || getInOutRecord.OffDuty3.HasValue)
                    {
                        m3 = 270;
                        if (getInOutRecord.WorkIn3.HasValue && getInOutRecord.OffDuty3.HasValue)
                        {
                            m3 = Convert.ToInt32((getInOutRecord.OffDuty3 - getInOutRecord.WorkIn3).Value.TotalMinutes);
                        }
                    }

                    getInOutRecord.ManHours = Convert.ToInt32(Math.Ceiling((m1 + m2 + m3) * 1.0 / 60));
                    Funs.DB.SubmitChanges();
                }
            }
        }
        #endregion

        #region 获取单位信息
        /// <summary>
        ///  获取单位信息
        /// </summary>
        /// <returns></returns>            
        public static Model.T_d_department GetSupDep(int? departmentID, int ParentID)
        {
            var getDep = Funs.DB.T_d_department.FirstOrDefault(x => x.DepartmentID == departmentID);
            if (getDep != null)
            {
                if (getDep.ParentID == ParentID)
                {
                    return getDep;
                }
                else
                {
                  return  GetSupDep(getDep.ParentID, ParentID);
                }
            }
            else
            {
                return null;
            }
        }
        #endregion


        /// <summary>
        ///  单位表下拉框
        /// </summary>
        /// <param name="dropName">下拉框名字</param>
        /// <param name="isShowPlease">是否显示请选择</param>
        public static void InitInstallationDropDownList(FineUIPro.DropDownList dropName,  bool isShowPlease)
        {
            dropName.DataValueField = "DepartmentID";
            dropName.DataTextField = "DepartmentName";
            dropName.DataSource = (from x in Funs.DB.T_d_department where x.ParentID == 0 select x).ToList();
            dropName.DataBind();
            if (isShowPlease)
            {
                Funs.FineUIPleaseSelect(dropName);
            }
        }

        /// <summary>
        ///  单位表下拉框
        /// </summary>
        /// <param name="dropName">下拉框名字</param>
        /// <param name="isShowPlease">是否显示请选择</param>
        public static void InitDepartmentDropDownList(FineUIPro.DropDownList dropName, int? InstallationId, bool isShowPlease)
        {
            dropName.DataValueField = "DepartmentID";
            dropName.DataTextField = "DepartmentName";
            dropName.DataSource = GetDepartmentList(InstallationId);
            dropName.DataBind();
            if (isShowPlease)
            {
                Funs.FineUIPleaseSelect(dropName);
            }
        }

        /// <summary>
        /// 获取单位信息
        /// </summary>
        /// <param name="UnitId"></param>
        /// <returns></returns>
        public static List<Model.T_d_department> GetDepartmentList(int? InstallationId)
        {
            List<Model.T_d_department> geD = new List<Model.T_d_department>();
            List<int> getSupDep = new List<int>();
            if (InstallationId.HasValue)
            {
                getSupDep = (from x in Funs.DB.T_d_department where x.ParentID == InstallationId select x.DepartmentID).ToList();
            }
            else
            {
                getSupDep = (from x in Funs.DB.T_d_department where x.ParentID == 0 select x.DepartmentID).ToList();
            }
            if (getSupDep.Count() > 0)
            {
                 geD = (from x in Funs.DB.T_d_department
                           where getSupDep.Contains(x.ParentID.Value)
                           orderby x.DepartmentID
                        select x).ToList();
            }
            return geD;
        }

        /// <summary>
        ///  单位表下拉框
        /// </summary>
        /// <param name="dropName">下拉框名字</param>
        /// <param name="isShowPlease">是否显示请选择</param>
        public static void InitPostNameDropDownList(FineUIPro.DropDownList dropName, bool isShowPlease)
        {
            dropName.DataValueField = "BaseInfoId";
            dropName.DataTextField = "BaseInfoName";
            dropName.DataSource = GetPostNameList();
            dropName.DataBind();
            if (isShowPlease)
            {
                Funs.FineUIPleaseSelect(dropName);
            }
        }

        /// <summary>
        /// 获取单位信息
        /// </summary>
        /// <param name="UnitId"></param>
        /// <returns></returns>
        public static List<Model.BaseInfoItem> GetPostNameList()
        {
            List<Model.BaseInfoItem> geD = new List<Model.BaseInfoItem>();
            var getSupDep = Funs.DB.T_d_EmployInOutRecord.Where(x=>x.PostName != null).Select(x => x.PostName).Distinct().ToList();
            if (getSupDep.Count() > 0)
            {
                geD = (from x in getSupDep
                       select new Model.BaseInfoItem
                       {
                           BaseInfoId = x,
                           BaseInfoName = x,
                       }).ToList();
            }
            return geD;
        }
    }
}
