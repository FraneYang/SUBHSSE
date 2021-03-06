﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 人员信息
    /// </summary>
    public static class PersonService
    {
        public static Model.SUBHSSEDB db = Funs.DB;

        /// <summary>
        /// 根据主键获取人员信息
        /// </summary>
        /// <param name="personId"></param>
        /// <returns></returns>
        public static Model.SitePerson_Person GetPersonById(string personId)
        {
            return Funs.DB.SitePerson_Person.FirstOrDefault(e => e.PersonId == personId);
        }

        public static string GetPersonNameById(string personId)
        {
            string name = string.Empty;
            var getp= Funs.DB.SitePerson_Person.FirstOrDefault(e => e.PersonId == personId);
            if (getp != null)
            {
                name = getp.PersonName;
            }
            return name;
        }

        /// <summary>
        /// 根据UserId主键获取人员信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static string GetPersonIdByUserId(string userId)
        {
            string personId = userId;
            var getPerson = GetPersonById(userId);
            if (getPerson == null)
            {
                var getUser = UserService.GetUserByUserId(userId);
                if (getUser != null)
                {
                    getPerson = Funs.DB.SitePerson_Person.FirstOrDefault(e => e.IdentityCard == getUser.IdentityCard);
                    if (getPerson != null)
                    {
                        personId = getPerson.PersonId;
                    }
                }
            }

            return personId;
        }

        /// <summary>
        /// 根据UserId主键获取人员信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static Model.SitePerson_Person GetPersonByUserId(string userId)
        {
            var getPerson = GetPersonById(userId);
            if (getPerson == null)
            {
                var getUser = UserService.GetUserByUserId(userId);
                if (getUser != null)
                {
                    getPerson = Funs.DB.SitePerson_Person.FirstOrDefault(e => e.IdentityCard == getUser.IdentityCard);                   
                }
            }

            return getPerson;
        }

        /// <summary>
        /// 根据UserId主键获取人员信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static Model.SitePerson_Person GetPersonByUserId(string userId, string projectId)
        {
            var getPerson = GetPersonById(userId);
            if (getPerson == null)
            {
                var getUser = UserService.GetUserByUserId(userId);
                if (getUser != null)
                {
                    getPerson = Funs.DB.SitePerson_Person.FirstOrDefault(e => e.IdentityCard == getUser.IdentityCard && (e.ProjectId == projectId || (projectId == null && e.ProjectId == null)));
                }
            }

            return getPerson;
        }
        /// <summary>
        /// 根据项目单位获取人员信息
        /// </summary>
        /// <param name="personId"></param>
        /// <returns></returns>
        public static List<Model.SitePerson_Person> GetPersonLitsByprojectIdUnitId(string projectId, string unitId)
        {
            return (from x in Funs.DB.SitePerson_Person where x.ProjectId == projectId && x.UnitId == unitId select x).ToList();
        }

        /// <summary>
        /// 获取最大的人员位置
        /// </summary>
        /// <returns>最大的人员位置</returns>
        public static int? GetMaxPersonIndex(string projectId)
        {
            return (from x in Funs.DB.SitePerson_Person where x.ProjectId == projectId select x.PersonIndex).Max();
        }

        /// <summary>
        /// 根据单位Id查询所有人员的数量
        /// </summary>
        /// <param name="unitId">单位Id</param>
        /// <returns>人员的数量</returns>
        public static int GetPersonCountByUnitId(string unitId, string projectId)
        {
            var q = (from x in Funs.DB.SitePerson_Person where x.UnitId == unitId && x.ProjectId == projectId && x.IsUsed == true select x).ToList();
            return q.Count();
        }

        /// <summary>
        /// 根据单位Id查询所有HSE人员的数量
        /// </summary>
        /// <param name="unitId">单位Id</param>
        /// <returns>HSE人员的数量</returns>
        public static int GetHSEPersonCountByUnitId(string unitId, string projectId)
        {
            var q = (from x in Funs.DB.SitePerson_Person where x.UnitId == unitId && x.ProjectId == projectId && (x.WorkPostId == BLL.Const.PostEngineer || x.WorkPostId == BLL.Const.PostMaterialPrincipal) && x.IsUsed == true select x).ToList();
            return q.Count();
        }

        /// <summary>
        /// 获取所有人员位置集合
        /// </summary>
        /// <returns>所有人员位置集合</returns>
        public static List<int?> GetPersonIndexs(string projectId)
        {
            return (from x in Funs.DB.SitePerson_Person where x.ProjectId == projectId select x.PersonIndex).ToList();
        }

        /// <summary>
        /// 根据卡号查询人员信息
        /// </summary>
        /// <param name="cardNo">卡号</param>
        /// <returns>人员实体</returns>
        public static Model.SitePerson_Person GetPersonByCardNo(string projectId, string cardNo)
        {
            return Funs.DB.SitePerson_Person.FirstOrDefault(e => e.ProjectId == projectId && e.CardNo == cardNo);
        }

        /// <summary>
        /// 根据卡号查询所有人员的数量
        /// </summary>
        /// <param name="cardNo">卡号</param>
        /// <returns>人员的数量</returns>
        public static int GetPersonCountByCardNo(string projectId, string cardNo)
        {
            var q = (from x in Funs.DB.SitePerson_Person where x.ProjectId == projectId && x.CardNo == cardNo select x).ToList();
            return q.Count();
        }

        /// <summary>
        /// 根据人员姓名和所在单位判断人员是否存在
        /// </summary>
        /// <param name="unitId"></param>
        /// <param name="personName"></param>
        /// <returns></returns>
        public static bool IsExistPersonByUnit(string unitId, string personName, string projectId)
        {
            var q = from x in BLL.Funs.DB.SitePerson_Person where x.UnitId == unitId && x.PersonName == personName && x.ProjectId == projectId select x;
            if (q.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 根据身份证号Id获取人员的数量
        /// </summary>
        /// <param name="identityCard">身份证号</param>
        /// <returns>人员的数量</returns>
        public static Model.SitePerson_Person GetPersonCountByIdentityCard(string identityCard, string projectId)
        {
            if (!string.IsNullOrEmpty(projectId))
            {
                return Funs.DB.SitePerson_Person.FirstOrDefault(x => x.IdentityCard == identityCard && x.ProjectId == projectId);
            }
            else
            {
                return Funs.DB.SitePerson_Person.FirstOrDefault(x => x.IdentityCard == identityCard && x.ProjectId == null);
            }
        }

        /// <summary>
        /// 获取人员信息列表
        /// </summary>
        /// <param name="projectId"></param>
        /// <returns></returns>
        public static List<Model.SitePerson_Person> GetPersonList(string projectId)
        {
            return (from x in Funs.DB.SitePerson_Person where x.ProjectId == projectId select x).ToList();
        }

        /// <summary>
        /// 增加人员信息
        /// </summary>
        /// <param name="person">人员实体</param>
        public static void AddPerson(Model.SitePerson_Person person)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.SitePerson_Person newPerson = new Model.SitePerson_Person
            {
                PersonId = person.PersonId,
                CardNo = person.CardNo,
                PersonName = person.PersonName,
                Sex = person.Sex,
                IdentityCard = person.IdentityCard,
                Address = person.Address,
                ProjectId = person.ProjectId,
                UnitId = person.UnitId,
                TeamGroupId = person.TeamGroupId,
                WorkAreaId = person.WorkAreaId,
                WorkPostId = person.WorkPostId,
                OutTime = person.OutTime,
                OutResult = person.OutResult,
                Telephone = person.Telephone,
                PositionId = person.PositionId,
                PostTitleId = person.PostTitleId,
                PhotoUrl = person.PhotoUrl,
                IsUsed = person.IsUsed,
                IsCardUsed = person.IsCardUsed,
                DepartId = person.DepartId,
                FromPersonId = person.FromPersonId,
                Password = GetPersonPassWord(person.IdentityCard),
                AuditorId = person.AuditorId,
                AuditorDate = person.AuditorDate,
                IsForeign = person.IsForeign,
                IsOutside = person.IsOutside,
                Languages=person.Languages,
                Isprint = "0",
            };

            if (person.InTime.HasValue)
            {
                newPerson.InTime = person.InTime;
            }
            else
            {
                newPerson.InTime = Funs.GetNewDateTime(DateTime.Now.ToShortDateString());
            }

            db.SitePerson_Person.InsertOnSubmit(newPerson);
            db.SubmitChanges();
            if (!CommonService.GetIsThisUnit(Const.UnitId_SEDIN)  &&  !string.IsNullOrEmpty(person.ProjectId))
            {
                ///写入人员出入场时间表 
                Model.SitePerson_PersonInOut newPersonInOut = new Model.SitePerson_PersonInOut
                {
                    ProjectId = person.ProjectId,
                    UnitId = person.UnitId,
                    PersonId = person.PersonId
                };

                if (newPerson.InTime.HasValue)
                {
                    newPersonInOut.ChangeTime = person.InTime;
                    newPersonInOut.IsIn = true;
                    BLL.PersonInOutService.AddPersonInOut(newPersonInOut);
                }

                if (newPerson.OutTime.HasValue)
                {
                    newPersonInOut.ChangeTime = person.OutTime;
                    newPersonInOut.IsIn = false;
                    BLL.PersonInOutService.AddPersonInOut(newPersonInOut);
                }
            }
            ////增加一条编码记录
            BLL.CodeRecordsService.InsertCodeRecordsByMenuIdProjectIdUnitId(BLL.Const.PersonListMenuId, person.ProjectId, person.UnitId, person.PersonId, person.InTime);
        }

        /// <summary>
        /// 修改人员信息
        /// </summary>
        /// <param name="person">人员实体</param>
        public static void UpdatePerson(Model.SitePerson_Person person)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.SitePerson_Person newPerson = db.SitePerson_Person.FirstOrDefault(e => e.PersonId == person.PersonId);
            if (newPerson != null)
            {
                newPerson.ProjectId = person.ProjectId;
                newPerson.FromPersonId = person.FromPersonId;
                newPerson.CardNo = person.CardNo;
                newPerson.PersonName = person.PersonName;
                newPerson.Sex = person.Sex;
                newPerson.IdentityCard = person.IdentityCard;
                newPerson.Address = person.Address;
                newPerson.ProjectId = person.ProjectId;
                newPerson.UnitId = person.UnitId;
                newPerson.TeamGroupId = person.TeamGroupId;
                newPerson.WorkAreaId = person.WorkAreaId;
                newPerson.WorkPostId = person.WorkPostId;
                newPerson.InTime = person.InTime;
                newPerson.OutTime = person.OutTime;
                newPerson.OutResult = person.OutResult;
                newPerson.Telephone = person.Telephone;
                newPerson.PositionId = person.PositionId;
                newPerson.PostTitleId = person.PostTitleId;
                newPerson.PhotoUrl = person.PhotoUrl;
                newPerson.IsUsed = person.IsUsed;
                newPerson.IsCardUsed = person.IsCardUsed;
                newPerson.DepartId = person.DepartId;
                newPerson.QRCodeAttachUrl = person.QRCodeAttachUrl;
                newPerson.Languages = person.Languages;
                newPerson.Password = GetPersonPassWord(person.IdentityCard);                
                newPerson.ExchangeTime2 = null;
                if (!string.IsNullOrEmpty(person.AuditorId))
                {
                    newPerson.AuditorId = person.AuditorId;
                }
                if (person.AuditorDate.HasValue)
                {
                    newPerson.AuditorDate = person.AuditorDate;
                }
                if (person.InTime.HasValue)
                {
                    newPerson.InTime = person.InTime;
                }
                else
                {
                    newPerson.InTime = Funs.GetNewDateTime(DateTime.Now.ToShortDateString());
                }
                newPerson.IsForeign = person.IsForeign;
                newPerson.IsOutside = person.IsOutside;
                db.SubmitChanges();
                if (!CommonService.GetIsThisUnit(Const.UnitId_SEDIN) && !string.IsNullOrEmpty(person.ProjectId))
                {
                     ////写入人员出入场时间表
                    Model.SitePerson_PersonInOut newPersonInOut = new Model.SitePerson_PersonInOut
                    {
                        ProjectId = person.ProjectId,
                        UnitId = person.UnitId,
                        PersonId = person.PersonId
                    };
                    if (newPerson.InTime.HasValue)
                    {
                        var inOutIn = BLL.PersonInOutService.GetPersonInOutByTimePersonId(person.PersonId, person.InTime.Value, true);
                        if (inOutIn == null)
                        {
                            newPersonInOut.ChangeTime = person.InTime;
                            newPersonInOut.IsIn = true;
                            BLL.PersonInOutService.AddPersonInOut(newPersonInOut);
                        }
                    }

                    if (newPerson.OutTime.HasValue)
                    {
                        var inOutIn = BLL.PersonInOutService.GetPersonInOutByTimePersonId(person.PersonId, person.OutTime.Value, false);
                        if (inOutIn == null)
                        {
                            newPersonInOut.ChangeTime = person.OutTime;
                            newPersonInOut.IsIn = false;
                            BLL.PersonInOutService.AddPersonInOut(newPersonInOut);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 根据人员Id删除一个人员信息
        /// </summary>
        /// <param name="personId">人员Id</param>
        public static void DeletePerson(string personId)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.SitePerson_Person person = db.SitePerson_Person.FirstOrDefault(e => e.PersonId == personId);
            if (person != null)
            {
                ///删除编码表记录
                BLL.CodeRecordsService.DeleteCodeRecordsByDataId(personId);
                //删除管理人员资质
                Model.QualityAudit_ManagePersonQuality managePersonQuality = db.QualityAudit_ManagePersonQuality.FirstOrDefault(e => e.PersonId == personId);
                if (managePersonQuality != null)
                {
                    CodeRecordsService.DeleteCodeRecordsByDataId(managePersonQuality.ManagePersonQualityId);
                    CommonService.DeleteAttachFileById(managePersonQuality.ManagePersonQualityId);
                    db.QualityAudit_ManagePersonQuality.DeleteOnSubmit(managePersonQuality);
                    db.SubmitChanges();
                }
                //删除特岗人员资质
                var personQuality = PersonQualityService.GetPersonQualityByPersonId(personId);
                if (personQuality != null)
                {
                    CodeRecordsService.DeleteCodeRecordsByDataId(personQuality.PersonQualityId);//删除编号
                    CommonService.DeleteAttachFileById(personQuality.PersonQualityId);//删除附件
                    db.QualityAudit_PersonQuality.DeleteOnSubmit(personQuality);
                    db.SubmitChanges();
                }
                //删除安全人员资质
                Model.QualityAudit_SafePersonQuality safePersonQuality = db.QualityAudit_SafePersonQuality.FirstOrDefault(e => e.PersonId == personId);
                if (safePersonQuality != null)
                {
                    CodeRecordsService.DeleteCodeRecordsByDataId(safePersonQuality.SafePersonQualityId);
                    CommonService.DeleteAttachFileById(safePersonQuality.SafePersonQualityId);
                    db.QualityAudit_SafePersonQuality.DeleteOnSubmit(safePersonQuality);
                    db.SubmitChanges();
                }
                ///违规人员
                var getViolation = from x in db.Check_ViolationPerson where x.PersonId == person.PersonId select x;
                if (getViolation.Count() > 0)
                {
                    db.Check_ViolationPerson.DeleteAllOnSubmit(getViolation);
                    db.SubmitChanges();
                }
                ///删除考试记录
                var getTask = from x in db.Training_Task where x.UserId == person.PersonId select x;
                if (getTask.Count() > 0)
                {
                    foreach (var item in getTask)
                    {
                        TaskService.DeleteTaskById(item.TaskId);
                    }
                }
                ///删除考试记录
                var getTestRecode = from x in db.Training_TestRecord where x.TestManId == person.PersonId select x;
                if (getTestRecode.Count() > 0)
                {
                    foreach (var item in getTestRecode)
                    {
                        TestRecordService.DeleteTestRecordByTestRecordId(item.TestRecordId);
                    }
                }
                ///删除人员绩效
                var getPerfomances = from x in db.Perfomance_PersonPerfomance where x.PersonId == person.PersonId select x;
                if (getPerfomances.Count() > 0)
                {
                    foreach (var item in getPerfomances)
                    {
                        PersonPerfomanceService.DeletePersonPerfomanceById(item.PersonPerfomanceId);
                    }
                }
                ///删除人员出入场记录
                BLL.PersonInOutService.DeletePersonInOutByPersonId(person.PersonId);

                db.SitePerson_Person.DeleteOnSubmit(person);
                db.SubmitChanges();
            }
        }

        /// <summary>
        /// 根据身份证号获取人员信息
        /// </summary>
        /// <param name="identityCard">身份证号</param>
        /// <returns>人员信息</returns>
        public static Model.SitePerson_Person GetPersonByIdentityCard(string projectId, string identityCard)
        {
            if (!string.IsNullOrEmpty(identityCard))
            {
                return Funs.DB.SitePerson_Person.FirstOrDefault(e => e.ProjectId == projectId && e.IdentityCard == identityCard);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 保存发卡信息
        /// </summary>
        /// <param name="personId"></param>
        /// <param name="cardNo"></param>
        public static void SaveSendCard(string personId, string cardNo, int personIndex)
        {
            Model.SUBHSSEDB db = Funs.DB;
            Model.SitePerson_Person card = db.SitePerson_Person.FirstOrDefault(e => e.CardNo == cardNo);
            if (card != null)
            {
                card.CardNo = null;
            }
            else
            {
                Model.SitePerson_Person person = db.SitePerson_Person.FirstOrDefault(e => e.PersonId == personId);
                person.CardNo = cardNo;
                person.PersonIndex = personIndex;
                //person.CardNo = sendCardNo;
            }

            db.SubmitChanges();
        }

        /// <summary>
        /// 根据作业区域获取人员
        /// </summary>
        /// <param name="workAreaId"></param>
        /// <returns></returns>
        public static List<Model.SitePerson_Person> GetPersonListByWorkAreaId(string workAreaId)
        {
            return (from x in db.SitePerson_Person where x.WorkAreaId == workAreaId select x).ToList();
        }

        #region 表下拉框
        /// <summary>
        ///  表下拉框
        /// </summary>
        /// <param name="dropName">下拉框名字</param>
        /// <param name="isShowPlease">是否显示请选择</param>
        public static void InitPersonByProjectUnitDropDownList(FineUIPro.DropDownList dropName, string projectId, string unitId, bool isShowPlease)
        {
            dropName.DataValueField = "PersonId";
            dropName.DataTextField = "PersonName";
            dropName.DataSource = GetPersonLitsByprojectIdUnitId(projectId, unitId);
            dropName.DataBind();
            if (isShowPlease)
            {
                Funs.FineUIPleaseSelect(dropName);
            }
        }
        #endregion

        #region 培训人员下拉框
        /// <summary>
        ///  表下拉框
        /// </summary>
        /// <param name="dropName">下拉框名字</param>
        /// <param name="isShowPlease">是否显示请选择</param>
        public static void InitTrainingPersonDropDownList(FineUIPro.DropDownList dropName, string projectId, string unitId, string workPostId, string trainTypeId, bool isShowPlease)
        {
            dropName.DataValueField = "PersonId";
            dropName.DataTextField = "PersonName";
            dropName.DataSource = APIPersonService.getTrainingPersonListByTrainTypeId(projectId, unitId, workPostId, trainTypeId, null);
            dropName.DataBind();
            if (isShowPlease)
            {
                Funs.FineUIPleaseSelect(dropName);
            }
        }
        #endregion

        /// <summary>
        /// 获取人员密码
        /// </summary>
        /// <param name="idCard"></param>
        /// <returns></returns>
        public static string GetPersonPassWord(string idCard)
        {
            string passWord= Funs.EncryptionPassword(Const.Password);
            ////现场人员密码
            if (!string.IsNullOrEmpty(idCard))
            {
                if (idCard.Length > 3)
                {
                    passWord = Funs.EncryptionPassword(idCard.Substring(idCard.Length - 4));
                }
                else
                {
                    passWord = Funs.EncryptionPassword(idCard);
                }
            }
            return passWord;
        }
    }
}
