using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BLL;
using WebAPI.Filter;

namespace WebAPI.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class DoorServerController : ApiController
    {
        #region 获取部门、人员、出入记录最大ID
        /// <summary>
        ///  获取部门、人员、出入记录最大ID
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public string getMaxID(string projectId)
        {
            int DepartmentID = 0,  ID=0;
            long EmployID = 0;
            var getD = Funs.DB.T_d_department.Select(x => x.DepartmentID);
            if (getD.Count()>0)
            {
                DepartmentID = getD.Max();
            }
            var getE= Funs.DB.T_d_employinfo.Select(x => x.EmployID);
            if (getE.Count() > 0)
            {
                EmployID = getE.Max();
            }
            var getI = Funs.DB.T_d_facerecord.Select(x => x.ID);
            if (getI.Count() > 0)
            {
                ID = getI.Max();
            }
            return ("$" + DepartmentID.ToString()+"$"+ EmployID.ToString()+"$"+ID.ToString() + "$");
        }
        #endregion

        #region 保存部门信息
        /// <summary>
        /// 保存部门信息
        /// </summary>
        /// <param name="department">部门信息</param>
        /// <returns></returns>
        [HttpPost]
        public Model.ResponeData SaveDepartment([FromBody] Model.t_d_departmentItem department)
        {
            var responeData = new Model.ResponeData();
            try
            {
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    if (department != null)
                    {
                        var getDep = db.T_d_department.FirstOrDefault(x => x.DepartmentID == department.DepartmentID);
                        if (getDep == null)
                        {
                            Model.T_d_department newDep = new Model.T_d_department()
                            {
                                DepartmentID= department.DepartmentID,
                                DepartmentName = department.DepartmentName,
                                ParentID = department.ParentID,
                                IsDel = department.IsDel,
                                IsDown = department.IsDown,
                                ParentDepartmentName = department.ParentDepartmentName,
                                IsEnable = department.IsEnable,
                            };
                            db.T_d_department.InsertOnSubmit(newDep);
                            db.SubmitChanges();
                        }
                    }
                    else
                    {
                        responeData.code = 2;
                        responeData.message = "信息有误！";
                    }
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

        #region 保存人员信息
        /// <summary>
        /// 保存人员信息
        /// </summary>
        /// <param name="employinfo">人员信息</param>
        /// <returns></returns>
        [HttpPost]
        public Model.ResponeData SaveEmployinfo([FromBody] Model.t_d_employinfoItem employinfo)
        {
            var responeData = new Model.ResponeData();
            try
            {
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    if (employinfo != null)
                    {
                        var getDep = db.T_d_employinfo.FirstOrDefault(x => x.EmployID == employinfo.EmployID);
                        if (getDep == null)
                        {
                            Model.T_d_employinfo newEmploy = new Model.T_d_employinfo()
                            {
                                EmployID = employinfo.EmployID,
                                WxEmployID = employinfo.WxEmployID,
                                EmployNO = employinfo.EmployNO,
                                EmployName = employinfo.EmployName,
                                CardNO = employinfo.CardNO,
                                GroupID = employinfo.GroupID,
                                IsAttend = employinfo.IsAttend,
                                IsDoor = employinfo.IsDoor,
                                BeginDateTime = employinfo.BeginDateTime,
                                EndDateTime = employinfo.EndDateTime,
                                InPassWord = employinfo.InPassWord,
                                DepartmentName = employinfo.DepartmentName,
                                Mailbox = employinfo.Mailbox,
                                Mobilephone = employinfo.Mobilephone,
                                WeiXinNO = employinfo.WeiXinNO,
                                PostName = employinfo.PostName,
                                Gender = employinfo.Gender,
                                IsDown = employinfo.IsDown,
                                IsWxDown = employinfo.IsWxDown,
                                IDCardNo = employinfo.IDCardNo,
                                PlayCardNumber = employinfo.PlayCardNumber,
                                PlayCardSum = employinfo.PlayCardSum,
                                UpdataCloud = employinfo.UpdataCloud,
                                Birthday = employinfo.Birthday,
                                Police = employinfo.Police,
                                Nation = employinfo.Nation,
                                Address = employinfo.Address,
                                UpdateState = employinfo.UpdateState,
                                UpdateDateTime = employinfo.UpdateDateTime,
                                IsSubmarineBack = employinfo.IsSubmarineBack,
                                OnSiteState = employinfo.OnSiteState,
                                TimeNumber = employinfo.TimeNumber,
                                CardTimeRecord = employinfo.CardTimeRecord,
                                ReservedFieldsOne = employinfo.ReservedFieldsOne,
                                ReservedFieldsTwo = employinfo.ReservedFieldsTwo,
                                ReservedFieldsThree = employinfo.ReservedFieldsThree,
                                ReservedFieldsFour = employinfo.ReservedFieldsFour,
                                ReservedFieldsFive = employinfo.ReservedFieldsFive,
                            };
                            db.T_d_employinfo.InsertOnSubmit(newEmploy);
                            db.SubmitChanges();
                        }
                    }
                    else
                    {
                        responeData.code = 2;
                        responeData.message = "信息有误！";
                    }
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

        #region 保存出入记录信息
        /// <summary>
        /// 保存出入记录信息
        /// </summary>
        /// <param name="facerecord">出入记录信息</param>
        /// <returns></returns>
        [HttpPost]
        public Model.ResponeData SaveFacerecord([FromBody] Model.t_d_facerecordItem facerecord)
        {
            var responeData = new Model.ResponeData();
            try
            {
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    if (facerecord != null)
                    {
                        var getDep = db.T_d_facerecord.FirstOrDefault(x => x.ID == facerecord.ID);
                        if (getDep == null)
                        {
                            Model.T_d_facerecord newFacerecord = new Model.T_d_facerecord()
                            {
                                ID = facerecord.ID,
                                EmployName = facerecord.EmployName,
                                DepartmentID = facerecord.DepartmentID,
                                DepartName = facerecord.DepartName,
                                AreaID = facerecord.AreaID,
                                AreaName = facerecord.AreaName,
                                EmployNO = facerecord.EmployNO,
                                CardID = facerecord.CardID,
                                RoleID = facerecord.RoleID,
                                DateTimeRecord = facerecord.DateTimeRecord,
                                RecordDes = facerecord.RecordDes,
                                FaceIP = facerecord.FaceIP,
                                InOrOut = facerecord.InOrOut,
                                Des1 = facerecord.Des1,
                                Des2 = facerecord.Des2,
                                Des3 = facerecord.Des3,
                                Des4 = facerecord.Des4,
                            };

                            db.T_d_facerecord.InsertOnSubmit(newFacerecord);
                            db.SubmitChanges();
                            ///// 根据出入记录 写入考勤记录
                            DoorServerService.InsertEmployInOutRecord(facerecord);
                        }
                    }
                    else
                    {
                        responeData.code = 2;
                        responeData.message = "信息有误！";
                    }
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

        #region 保存出入记录信息
        /// <summary>
        /// 保存出入记录信息
        /// </summary>
        /// <param name="facerecord">出入记录信息</param>
        /// <returns></returns>
        [HttpPost]
        public Model.ResponeData SaveEmployInOutRecord([FromBody] Model.t_d_facerecordItem facerecord)
        {
            var responeData = new Model.ResponeData();
            try
            {
                if (facerecord != null)
                {
                    ///// 根据出入记录 写入考勤记录
                    DoorServerService.InsertEmployInOutRecord(facerecord);
                }
                else
                {
                    responeData.code = 2;
                    responeData.message = "信息有误！";
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

    }
}
