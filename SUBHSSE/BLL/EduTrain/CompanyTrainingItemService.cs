using System.Linq;

namespace BLL
{
    /// <summary>
    /// 公司培训明细表
    /// </summary>
    public class CompanyTrainingItemService
    {
        public static Model.SUBHSSEDB db = Funs.DB;

        /// <summary>
        /// 根据主键获取公司培训明细信息
        /// </summary>
        /// <param name="companyTrainingItemId"></param>
        /// <returns></returns>
        public static Model.Training_CompanyTrainingItem GetCompanyTrainingItemById(string companyTrainingItemId)
        {
            return db.Training_CompanyTrainingItem.FirstOrDefault(e => e.CompanyTrainingItemId == companyTrainingItemId);
        }
        
        /// <summary>
        /// 添加公司培训明细
        /// </summary>
        /// <param name="companyTrainingItem"></param>
        public static void AddCompanyTrainingItem(Model.Training_CompanyTrainingItem companyTrainingItem)
        {
            Model.Training_CompanyTrainingItem newCompanyTrainingItem = new Model.Training_CompanyTrainingItem();
            newCompanyTrainingItem.CompanyTrainingItemId = companyTrainingItem.CompanyTrainingItemId;
            newCompanyTrainingItem.CompanyTrainingId = companyTrainingItem.CompanyTrainingId;
            newCompanyTrainingItem.CompanyTrainingItemCode = companyTrainingItem.CompanyTrainingItemCode;
            newCompanyTrainingItem.CompanyTrainingItemName = companyTrainingItem.CompanyTrainingItemName;
            newCompanyTrainingItem.AttachUrl = companyTrainingItem.AttachUrl;
            newCompanyTrainingItem.CompileMan = companyTrainingItem.CompileMan;
            newCompanyTrainingItem.CompileDate = companyTrainingItem.CompileDate;
            db.Training_CompanyTrainingItem.InsertOnSubmit(newCompanyTrainingItem);
            db.SubmitChanges();
        }

        /// <summary>
        /// 修改公司培训明细
        /// </summary>
        /// <param name="companyTrainingItem"></param>
        public static void UpdateCompanyTrainingItem(Model.Training_CompanyTrainingItem companyTrainingItem)
        {
            Model.Training_CompanyTrainingItem newCompanyTrainingItem = db.Training_CompanyTrainingItem.FirstOrDefault(e => e.CompanyTrainingItemId == companyTrainingItem.CompanyTrainingItemId);
            if (newCompanyTrainingItem != null)
            {
                newCompanyTrainingItem.CompanyTrainingItemCode = companyTrainingItem.CompanyTrainingItemCode;
                newCompanyTrainingItem.CompanyTrainingItemName = companyTrainingItem.CompanyTrainingItemName;
                newCompanyTrainingItem.AttachUrl = companyTrainingItem.AttachUrl;
                newCompanyTrainingItem.CompileMan = companyTrainingItem.CompileMan;
                newCompanyTrainingItem.CompileDate = companyTrainingItem.CompileDate;
                db.SubmitChanges();
            }
        }

        /// <summary>
        /// 根据主键删除明细信息
        /// </summary>
        /// <param name="companyTrainItemId"></param>
        public static void DeleteCompanyTrainingItemById(string companyTrainItemId)
        {
            Model.Training_CompanyTrainingItem companyTrainingItem = db.Training_CompanyTrainingItem.FirstOrDefault(e => e.CompanyTrainingItemId == companyTrainItemId);
            if (companyTrainingItem != null)
            {
                db.Training_CompanyTrainingItem.DeleteOnSubmit(companyTrainingItem);
                db.SubmitChanges();
            }
        }

        /// <summary>
        ///  教材下拉框
        /// </summary>
        /// <param name="dropName">下拉框名字</param>
        /// <param name="isShowPlease">是否显示请选择</param>
        public static void InitCompanyTrainingItemDropDownList(FineUIPro.DropDownList dropName, string projectId, bool isShowPlease)
        {
            dropName.DataValueField = "CompanyTrainingItemId";
            dropName.DataTextField = "CompanyTrainingItemName";
            dropName.DataSource = from x in Funs.DB.Training_CompanyTrainingItem
                                  join y in Funs.DB.Training_CompanyTraining on x.CompanyTrainingId equals y.CompanyTrainingId
                                  orderby y.CompanyTrainingCode, x.CompanyTrainingItemCode
                                  select new { x.CompanyTrainingItemId, CompanyTrainingItemName = y.CompanyTrainingName + "-" + x.CompanyTrainingItemName };
            dropName.DataBind();
            if (isShowPlease)
            {
                Funs.FineUIPleaseSelect(dropName);
            }
        }
    }
}