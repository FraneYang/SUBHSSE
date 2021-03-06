﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EmitMapper;

namespace BLL
{
    public static class APIUserService
    {
        /// <summary>
        /// 获取用户登录信息
        /// </summary>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        public static Model.UserItem UserLogOn(Model.UserItem userInfo)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getUser = db.View_Sys_User.FirstOrDefault(x => (x.Account == userInfo.Account || x.Telephone == userInfo.Telephone) && x.IsPost == true && x.Password == Funs.EncryptionPassword(userInfo.Password));
                return ObjectMapperManager.DefaultInstance.GetMapper<Model.View_Sys_User, Model.UserItem>().Map(getUser);
            }
        }

        /// <summary>
        /// 根据userId获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static Model.UserItem getUserByUserId(string userId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getUser =db.View_Sys_User.FirstOrDefault(x => x.UserId == userId);
                return ObjectMapperManager.DefaultInstance.GetMapper<Model.View_Sys_User, Model.UserItem>().Map(getUser);
            }
        }

        /// <summary>
        /// 根据unitid获取用户信息
        /// </summary>
        /// <param name="unitid"></param>
        /// <returns></returns>
        public static List<Model.BaseInfoItem> getUserByUnitId(string unitId, string strParam)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getUser = (from x in db.Sys_User
                               join y in db.Sys_Role on x.RoleId equals y.RoleId
                               where x.UnitId == unitId && x.IsPost == true && (strParam == null || x.UserName.Contains(strParam))
                               orderby x.UserName
                               select new Model.BaseInfoItem { BaseInfoId = x.UserId, BaseInfoName = x.UserName, BaseInfoCode = x.Telephone }).ToList();

                return getUser;
            }
        }

        /// <summary>
        ///  根据projectId、unitid获取用户信息
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="unitId"></param>
        /// <param name="strParam"></param>
        /// <returns></returns>
        public static List<Model.UserItem> getUserByProjectIdUnitIdQuery(string projectId, string unitId, string roleIds, string strParam)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                List<Model.UserItem> getDataList = new List<Model.UserItem>();
                if (string.IsNullOrEmpty(unitId))
                {
                    var unit = db.Base_Unit.FirstOrDefault(e => e.IsThisUnit == true);  //本单位
                    if (unit != null)
                    {
                        unitId = unit.UnitId;
                    }
                }
                List<string> roleList = Funs.GetStrListByStr(roleIds, ',');
                if (!string.IsNullOrEmpty(projectId))
                {
                    getDataList = (from x in db.Sys_User
                                   join y in db.Project_ProjectUser on x.UserId equals y.UserId
                                   where y.ProjectId == projectId && (x.UnitId == unitId || unitId == null)
                                      && (roleIds == null || roleList.Contains(y.RoleId)) && (strParam == null || x.UserName.Contains(strParam))
                                   select new Model.UserItem
                                   {
                                       UserId = x.UserId,
                                       Account = x.Account,
                                       UserCode = x.UserCode,
                                       Password = x.Password,
                                       UserName = x.UserName,
                                       RoleId = y.RoleId,
                                       RoleName = db.Sys_Role.First(z => z.RoleId == y.RoleId).RoleName,
                                       UnitId = y.UnitId,
                                       UnitName = db.Base_Unit.First(z => z.UnitId == y.UnitId).UnitName,
                                       LoginProjectId = y.ProjectId,
                                       LoginProjectName = db.Base_Project.First(z => z.ProjectId == y.ProjectId).ProjectName,
                                       IdentityCard = x.IdentityCard,
                                       Email = x.Email,
                                       Telephone = x.Telephone,
                                       IsOffice = x.IsOffice,
                                       SignatureUrl = x.SignatureUrl.Replace('\\', '/'),

                                   }).ToList();
                }
                else
                {
                    getDataList = (from x in db.Sys_User
                                   where x.IsPost == true && (x.UnitId == unitId || unitId == null)
                                  && (roleIds == null || roleList.Contains(x.RoleId)) && (strParam == null || x.UserName.Contains(strParam))
                                   select new Model.UserItem
                                   {
                                       UserId = x.UserId,
                                       Account = x.Account,
                                       UserCode = x.UserCode,
                                       Password = x.Password,
                                       UserName = x.UserName,
                                       RoleId = x.RoleId,
                                       RoleName = db.Sys_Role.First(z => z.RoleId == x.RoleId).RoleName,
                                       UnitId = x.UnitId,
                                       UnitName =db.Base_Unit.First(z => z.UnitId == x.UnitId).UnitName,
                                       //LoginProjectId = y.ProjectId,
                                       //LoginProjectName = Funs.DB.Base_Project.First(z => z.ProjectId == y.ProjectId).ProjectName,
                                       IdentityCard = x.IdentityCard,
                                       Email = x.Email,
                                       Telephone = x.Telephone,
                                       IsOffice = x.IsOffice,
                                       SignatureUrl = x.SignatureUrl.Replace('\\', '/'),
                                   }).ToList();
                }

                return getDataList.OrderBy(x => x.UnitName).ThenBy(x => x.UserName).ToList();
            }
        }

        /// <summary>
        ///  根据单位类型获取用户信息
        /// </summary>
        /// <param name="projectId"></param>
        /// <param name="unitType"></param>
        /// <param name="strParam"></param>
        /// <returns></returns>
        public static List<Model.UserItem> getUserByProjectIdUnitTypeQuery(string projectId, string unitType, string roleIds, string strParam)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                List<Model.UserItem> getDataList = new List<Model.UserItem>();
                List<string> roleList = Funs.GetStrListByStr(roleIds, ',');
                getDataList = (from x in db.Sys_User
                               join y in db.Project_ProjectUser on x.UserId equals y.UserId
                               join z in db.Project_ProjectUnit on x.UnitId equals z.UnitId
                               where y.ProjectId == projectId && z.ProjectId == projectId && z.UnitType == unitType
                                  && (roleIds == null || roleList.Contains(y.RoleId)) && (strParam == null || x.UserName.Contains(strParam))
                               select new Model.UserItem
                               {
                                   UserId = x.UserId,
                                   Account = x.Account,
                                   UserCode = x.UserCode,
                                   Password = x.Password,
                                   UserName = x.UserName,
                                   RoleId = y.RoleId,
                                   RoleName = db.Sys_Role.First(z => z.RoleId == y.RoleId).RoleName,
                                   UnitId = y.UnitId,
                                   UnitName = db.Base_Unit.First(z => z.UnitId == y.UnitId).UnitName,
                                   LoginProjectId = y.ProjectId,
                                   LoginProjectName =db.Base_Project.First(z => z.ProjectId == y.ProjectId).ProjectName,
                                   IdentityCard = x.IdentityCard,
                                   Email = x.Email,
                                   Telephone = x.Telephone,
                                   IsOffice = x.IsOffice,
                                   SignatureUrl = x.SignatureUrl.Replace('\\', '/'),
                               }).ToList();

                return getDataList.OrderBy(x => x.UnitName).ThenBy(x => x.UserName).ToList();
            }
        }

        /// <summary>
        ///  获取所有在岗用户
        /// </summary>
        /// <returns></returns>
        public static List<Model.UserItem> UserLogOn2()
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var user = from x in db.Sys_User
                           where x.IsPost == true
                           select x;
                return ObjectMapperManager.DefaultInstance.GetMapper<List<Model.Sys_User>, List<Model.UserItem>>().Map(user.ToList());
            }
        }

        /// <summary>
        /// 根据userId获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static void getSaveUserTel(string userId, string tel)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getUser = db.Sys_User.FirstOrDefault(x => x.UserId == userId);
                if (getUser != null)
                {
                    getUser.Telephone = tel;
                    db.SubmitChanges();
                }
            }
        }

        /// <summary>
        /// 根据userId获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static void getSaveUserSignatureUrl(string userId, string SignatureUrl)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getUser =db.Sys_User.FirstOrDefault(x => x.UserId == userId);
                if (getUser != null)
                {
                    getUser.SignatureUrl = SignatureUrl;
                    db.SubmitChanges();
                }
            }
        }

        /// <summary>
        /// 获取人员未浏览记录数
        /// </summary>
        /// <param name="unitid"></param>
        /// <returns></returns>
        public static int getMenuUnreadCount(string menuId, string projectId, string userId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                int count = 0;
                var readCount = db.Sys_UserRead.Where(x => x.MenuId == menuId && x.ProjectId == projectId && x.UserId == userId).Select(x => x.DataId).Distinct().Count();
                if (menuId == Const.ProjectNoticeMenuId)
                {
                    var noticeCount = db.InformationProject_Notice.Where(x => x.AccessProjectId.Contains(projectId) && x.IsRelease == true).Count();
                    count = noticeCount - readCount;
                }
                count = count < 0 ? 0 : count;
                return count;
            }
        }

        /// <summary>
        /// 保存浏览记录
        /// </summary>
        /// <param name="unitid"></param>
        /// <returns></returns>
        public static void getSaveUserRead(string menuId, string projectId, string userId, string dataId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var userRead = db.Sys_UserRead.FirstOrDefault(x => x.ProjectId == projectId && x.UserId == userId && x.DataId == dataId);
                if (userRead == null)
                {
                    Model.Sys_UserRead newRead = new Model.Sys_UserRead
                    {
                        UserReadId = SQLHelper.GetNewID(),
                        UserId = userId,
                        MenuId = menuId,
                        ProjectId = projectId,
                        DataId = dataId,
                        ReadTime = DateTime.Now,
                    };

                    db.Sys_UserRead.InsertOnSubmit(newRead);
                    db.SubmitChanges();
                }
            }
        }
    }
}
