using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    /// <summary>
    /// 资源信息
    /// </summary>
    public static class APIResourcesService
    {
        #region 集团培训教材
        /// <summary>
        /// 根据父级类型ID获取培训教材类型
        /// </summary>
        /// <param name="supTypeId"></param>
        /// <returns></returns>
        public static List<Model.ResourcesItem> getTrainingListBySupTrainingId(string supTypeId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_Training
                                   where x.SupTrainingId == supTypeId || (supTypeId == null && x.SupTrainingId == "0")
                                   orderby x.TrainingCode
                                   select new Model.ResourcesItem
                                   {
                                       ResourcesId = x.TrainingId,
                                       ResourcesCode = x.TrainingCode,
                                       ResourcesName = x.TrainingName,
                                       SupResourcesId = x.SupTrainingId,
                                       IsEndLever = x.IsEndLever,
                                   };
                return getDataLists.ToList();
            }
        }

        /// <summary>
        /// 根据培训教材类型id获取培训教材列表
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static List<Model.BaseInfoItem> getTrainingItemListByTrainingId(string trainingId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = (from x in db.Training_TrainingItem
                                    where x.TrainingId == trainingId && x.IsPass == true
                                    orderby x.TrainingItemCode
                                    select new Model.BaseInfoItem
                                    {
                                        BaseInfoId = x.TrainingItemId,
                                        BaseInfoCode = x.TrainingItemCode,
                                        BaseInfoName = x.TrainingItemName,
                                        ImageUrl = x.AttachUrl
                                    }).ToList();
                return getDataLists;
            }
        }

        /// <summary>
        /// 根据培训教材主键获取培训教材详细信息
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static Model.BaseInfoItem getTrainingItemByTrainingItemId(string trainingItemId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataInfo = from x in db.Training_TrainingItem
                                  where x.TrainingItemId == trainingItemId
                                  select new Model.BaseInfoItem
                                  {
                                      BaseInfoId = x.TrainingItemId,
                                      BaseInfoCode = x.TrainingItemCode,
                                      BaseInfoName = x.TrainingItemName,
                                      ImageUrl = APIUpLoadFileService.getFileUrl(x.TrainingItemId, x.AttachUrl),
                                  };
                return getDataInfo.FirstOrDefault();
            }
        }
        #endregion

        #region 公司培训教材
        /// <summary>
        /// 根据父级类型ID获取公司培训教材类型
        /// </summary>
        /// <param name="supTypeId"></param>
        /// <returns></returns>
        public static List<Model.ResourcesItem> getCompanyTrainingListBySupTrainingId(string supTypeId, string projectId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_CompanyTraining
                                   where (x.SupCompanyTrainingId == supTypeId || (supTypeId == null && x.SupCompanyTrainingId == "0"))
                                   && (projectId == null || x.ProjectId.Contains(projectId))
                                   orderby x.CompanyTrainingCode
                                   select new Model.ResourcesItem
                                   {
                                       ResourcesId = x.CompanyTrainingId,
                                       ResourcesCode = x.CompanyTrainingCode,
                                       ResourcesName = x.CompanyTrainingName,
                                       SupResourcesId = x.SupCompanyTrainingId,
                                       IsEndLever = x.IsEndLever,
                                   };
                return getDataLists.ToList();
            }
        }

        /// <summary>
        /// 根据培训教材类型id获取公司培训教材列表
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static List<Model.BaseInfoItem> getCompanyTrainingItemListByTrainingId(string trainingId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = (from x in db.Training_CompanyTrainingItem
                                    where x.CompanyTrainingId == trainingId
                                    orderby x.CompanyTrainingItemCode
                                    select new Model.BaseInfoItem
                                    {
                                        BaseInfoId = x.CompanyTrainingItemId,
                                        BaseInfoCode = x.CompanyTrainingItemCode,
                                        BaseInfoName = x.CompanyTrainingItemName,
                                        ImageUrl = x.AttachUrl
                                    }).ToList();
                return getDataLists;
            }
        }

        /// <summary>
        /// 根据培训教材主键获取公司培训教材详细信息
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static Model.BaseInfoItem getCompanyTrainingItemByTrainingItemId(string trainingItemId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataInfo = from x in db.Training_CompanyTrainingItem
                                  where x.CompanyTrainingItemId == trainingItemId
                                  select new Model.BaseInfoItem
                                  {
                                      BaseInfoId = x.CompanyTrainingItemId,
                                      BaseInfoCode = x.CompanyTrainingItemCode,
                                      BaseInfoName = x.CompanyTrainingItemName,
                                      ImageUrl = APIUpLoadFileService.getFileUrl(x.CompanyTrainingItemId, x.AttachUrl),

                                  };
                return getDataInfo.FirstOrDefault();
            }
        }
        #endregion

        #region 公司制度
        /// <summary>
        /// 获取公司制度列表
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static List<Model.BaseInfoItem> getCompanySafetyInstitutionList()
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = (from x in db.HSSESystem_SafetyInstitution
                                    orderby x.EffectiveDate descending
                                    select new Model.BaseInfoItem
                                    {
                                        BaseInfoId = x.SafetyInstitutionId,
                                        BaseInfoCode = string.Format("{0:yyyy-MM-dd}", x.EffectiveDate),
                                        BaseInfoName = x.SafetyInstitutionName,
                                        ImageUrl = APIUpLoadFileService.getFileUrl(x.SafetyInstitutionId, x.AttachUrl),
                                    }).ToList();
                return getDataLists;
            }
        }

        /// <summary>
        /// 获取公司制度详细信息
        /// </summary>
        /// <param name="safetyInstitutionId"></param>
        /// <returns></returns>
        public static Model.BaseInfoItem getCompanySafetyInstitutionInfo(string safetyInstitutionId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataInfo = from x in db.HSSESystem_SafetyInstitution
                                  where x.SafetyInstitutionId == safetyInstitutionId
                                  select new Model.BaseInfoItem
                                  {
                                      BaseInfoId = x.SafetyInstitutionId,
                                      BaseInfoCode = string.Format("{0:yyyy-MM-dd}", x.EffectiveDate),
                                      BaseInfoName = x.SafetyInstitutionName,
                                      ImageUrl = APIUpLoadFileService.getFileUrl(x.SafetyInstitutionId, x.AttachUrl),
                                  };
                return getDataInfo.FirstOrDefault();
            }
        }
        #endregion

        #region 考试试题
        public static int getTestTrainingListCount
        {
            get;
            set;
        }
        /// <summary>
        /// 根据父级类型ID获取考试试题类型
        /// </summary>
        /// <param name="supTypeId"></param>
        /// <returns></returns>
        public static List<Model.ResourcesItem> getTestTrainingListBySupTrainingId(string supTypeId, string unitId,string projectId, int pageIndex)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = from x in db.Training_TestTraining
                                   where x.IsEndLever == true
                                   //(x.SupTrainingId == supTypeId || (supTypeId == null && x.SupTrainingId == "0"))                       
                                   orderby x.TrainingCode
                                   select new Model.ResourcesItem
                                   {
                                       ResourcesId = x.TrainingId,
                                       CompanyId=x.CompanyId,
                                       UnitId = x.UnitIds,
                                       ProjectId = x.ProjectId,
                                       ResourcesCode = x.TrainingCode,
                                       ResourcesName = getTrainingName(x.TrainingId),
                                       SupResourcesId = x.SupTrainingId,
                                       IsEndLever = x.IsEndLever,
                                   };
                if (!string.IsNullOrEmpty(supTypeId) && supTypeId != "0")
                {
                    getDataLists = getDataLists.Where(x => x.SupResourcesId == supTypeId);
                }

                if (!string.IsNullOrEmpty(projectId))
                {
                    getDataLists = getDataLists.Where(x => x.ProjectId.Contains(projectId));
                }
                else
                {
                    if (!string.IsNullOrEmpty(unitId))
                    {
                        if (CommonService.GetIsThisUnit(unitId))
                        {
                            getDataLists = getDataLists.Where(x => x.CompanyId == unitId);
                        }
                        else
                        {
                            getDataLists = getDataLists.Where(x => x.UnitId.Contains(unitId));
                        }
                    }
                }
               
                if (!string.IsNullOrEmpty(projectId))
                {
                    getDataLists = getDataLists.Where(x => x.ProjectId.Contains(projectId));
                }
                else
                {
                    getDataLists = getDataLists.Where(x => x.ProjectId == null);
                }
                getTestTrainingListCount = getDataLists.Count();
                if (getTestTrainingListCount == 0)
                {
                    return null;
                }
                else
                {
                    if (pageIndex > 0)
                    {
                        return getDataLists.Skip(Funs.PageSize * (pageIndex - 1)).Take(Funs.PageSize).ToList();
                    }
                    else
                    {
                        return getDataLists.ToList();
                    }
                }
                
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static string getTrainingName(string trainingId)
        {
            string name = string.Empty;
            var getT = TestTrainingService.GetTestTrainingById(trainingId);
            if (getT != null)
            {
                name = getT.TrainingName;
                if (getT.SupTrainingId != "0")
                {
                    var getST = TestTrainingService.GetTestTrainingById(getT.SupTrainingId);
                    if (getST != null)
                    {
                        name = getST.TrainingName + "-" + getT.TrainingName;
                    }
                }
            }
            return name;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static string getTestTrainingCountByTrainingId(string trainingId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                string name = "";
                var getIdList = Funs.GetStrListByStr(trainingId, ',');
                foreach (var item in getIdList)
                {
                    var getTest = db.Training_TestTraining.FirstOrDefault(x => x.TrainingId == item);
                    if (getTest != null)
                    {
                        name += getTest.TrainingName + "：";
                        var getTestTrainingItems = db.Training_TestTrainingItem.Where(x => x.TrainingId == item);
                        if (getTestTrainingItems.Count() > 0)
                        {
                            var getT1 = getTestTrainingItems.Where(x => x.TestType == "1");
                            var getT2 = getTestTrainingItems.Where(x => x.TestType == "2");
                            var getT3 = getTestTrainingItems.Where(x => x.TestType == "3");
                            name += "单选[" + getT1.Count().ToString() + "]题|多选[" + getT2.Count().ToString() + "]题|判断[" + getT3.Count().ToString() + "]题.";
                        }
                        else
                        {
                            name += "单选[0]题|多选[0]题|判断[0]题.";
                        }
                    }
                }
                return name;
            }
        }

        /// <summary>
        /// 根据培训教材类型id获取考试试题列表
        /// </summary>
        /// <param name="testTrainingId">试题类型ID</param>
        /// <returns></returns>
        public static List<Model.BaseInfoItem> getTestTrainingItemListByTrainingId(string testTrainingId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataLists = (from x in db.Training_TestTrainingItem
                                    where x.TrainingId == testTrainingId
                                    orderby x.TrainingItemCode
                                    select new Model.BaseInfoItem
                                    {
                                        BaseInfoId = x.TrainingItemId,
                                        BaseInfoCode = x.TrainingItemCode,
                                        BaseInfoName = x.Abstracts,
                                        ImageUrl = x.AttachUrl
                                    }).ToList();
                return getDataLists;
            }
        }

        /// <summary>
        /// 根据培训教材主键获取考试试题详细信息
        /// </summary>
        /// <param name="trainingId"></param>
        /// <returns></returns>
        public static Model.TestTrainingResourcesItem getTestTrainingItemByTrainingItemId(string trainingItemId)
        {
            using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
            {
                var getDataInfo = from x in db.Training_TestTrainingItem
                                  where x.TrainingItemId == trainingItemId
                                  select new Model.TestTrainingResourcesItem
                                  {
                                      TrainingItemId = x.TrainingItemId,
                                      TrainingId = x.TrainingId,
                                      TrainingItemCode = x.TrainingItemCode,
                                      Abstracts = x.Abstracts,
                                      AttachUrl = x.AttachUrl.Replace('\\', '/'),
                                      TestType = x.TestType,
                                      TestTypeName = x.TestType == "1" ? "单选题" : (x.TestType == "2" ? "多选题" : "判断题"),
                                      WorkPostIds = x.WorkPostIds,
                                      WorkPostNames = WorkPostService.getWorkPostNamesWorkPostIds(x.WorkPostIds),
                                      AItem = x.AItem,
                                      BItem = x.BItem,
                                      CItem = x.CItem,
                                      DItem = x.DItem,
                                      EItem = x.EItem,
                                      AnswerItems = x.AnswerItems,
                                  };
                return getDataInfo.FirstOrDefault();
            }
        }
        #endregion
    }
}
