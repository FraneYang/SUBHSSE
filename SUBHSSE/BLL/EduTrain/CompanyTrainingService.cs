using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    /// <summary>
    /// 公司培训主表
    /// </summary>
    public class CompanyTrainingService
    {
        public static Model.SUBHSSEDB db = Funs.DB;

        /// <summary>
        /// 根据主键获取公司培训
        /// </summary>
        /// <param name="companyTrainingId"></param>
        /// <returns></returns>
        public static Model.Training_CompanyTraining GetCompanyTrainingById(string companyTrainingId)
        {
            return db.Training_CompanyTraining.FirstOrDefault(e => e.CompanyTrainingId == companyTrainingId);
        }

        /// <summary>
        /// 添加公司培训
        /// </summary>
        /// <param name="companyTraining"></param>
        public static void AddCompanyTraining(Model.Training_CompanyTraining companyTraining)
        {
            Model.Training_CompanyTraining newTraining = new Model.Training_CompanyTraining
            {
                CompanyTrainingId = companyTraining.CompanyTrainingId,
                CompanyTrainingCode = companyTraining.CompanyTrainingCode,
                CompanyTrainingName = companyTraining.CompanyTrainingName,
                SupCompanyTrainingId = companyTraining.SupCompanyTrainingId,
                IsEndLever = companyTraining.IsEndLever,
                ProjectId = companyTraining.ProjectId
            };
            db.Training_CompanyTraining.InsertOnSubmit(newTraining);
            db.SubmitChanges();
        }

        /// <summary>
        /// 修改公司培训
        /// </summary>
        /// <param name="companyTraining"></param>
        public static void UpdateCompanyTraining(Model.Training_CompanyTraining companyTraining)
        {
            Model.Training_CompanyTraining newTraining = db.Training_CompanyTraining.FirstOrDefault(e => e.CompanyTrainingId == companyTraining.CompanyTrainingId);
            if (newTraining != null)
            {
                newTraining.CompanyTrainingCode = companyTraining.CompanyTrainingCode;
                newTraining.CompanyTrainingName = companyTraining.CompanyTrainingName;
                newTraining.SupCompanyTrainingId = companyTraining.SupCompanyTrainingId;
                newTraining.IsEndLever = companyTraining.IsEndLever;
                newTraining.ProjectId = companyTraining.ProjectId;
                db.SubmitChanges();
            }
        }

        /// <summary>
        /// 根据主键删除公司培训
        /// </summary>
        /// <param name="companyTrainingId"></param>
        public static void DeleteCompanyTraining(string companyTrainingId)
        {
            Model.Training_CompanyTraining companyTraining = db.Training_CompanyTraining.FirstOrDefault(e => e.CompanyTrainingId == companyTrainingId);
            if (companyTraining!=null)
            {
                db.Training_CompanyTraining.DeleteOnSubmit(companyTraining);
                db.SubmitChanges();
            }
        }

        /// <summary>
        /// 是否可删除资源节点
        /// </summary>
        /// <param name="postName"></param>
        /// <returns>true-可以，false-不可以</returns>
        public static bool IsDeleteCompanyTraining(string companyTrainingId)
        {
            bool isDelete = true;
            var Training = BLL.CompanyTrainingService.GetCompanyTrainingById(companyTrainingId);
            if (Training != null)
            {
                if (Training.IsEndLever == true)
                {
                    var detailCout = Funs.DB.Training_CompanyTrainingItem.FirstOrDefault(x => x.CompanyTrainingId == companyTrainingId);
                    if (detailCout != null)
                    {
                        isDelete = false;
                    }
                }
                else
                {
                    var supItemSetCount = BLL.CompanyTrainingService.GetCompanyTrainingBySupItem(companyTrainingId);
                    if (supItemSetCount.Count() > 0)
                    {
                        isDelete = false;
                    }
                }
            }
            return isDelete;
        }

        /// <summary>
        /// 根据上级Id查询所有公司培训
        /// </summary>
        /// <param name="supItem">上级Id</param>
        /// <returns>公司培训的集合</returns>
        public static List<Model.Training_CompanyTraining> GetCompanyTrainingBySupItem(string supItem)
        {
            return (from x in Funs.DB.Training_CompanyTraining
                    where x.SupCompanyTrainingId == supItem
                    orderby x.CompanyTrainingCode
                    select x).ToList();
        }

        /// <summary>
        /// 根据上级Id查询所有公司培训
        /// </summary>
        /// <param name="supItem">上级Id</param>
        /// <returns>公司培训的集合</returns>
        public static List<Model.Training_CompanyTraining> GetCompanyTrainingBySupItem(string supItem, string projectId)
        {
            return (from x in Funs.DB.Training_CompanyTraining
                    where x.SupCompanyTrainingId == supItem && (x.ProjectId == projectId || x.ProjectId.Contains(projectId))
                    orderby x.CompanyTrainingCode
                    select x).ToList();
        }       
    }
}