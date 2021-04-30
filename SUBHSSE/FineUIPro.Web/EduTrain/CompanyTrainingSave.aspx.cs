using System;
using System.Linq;
using BLL;

namespace FineUIPro.Web.EduTrain
{
    public partial class CompanyTrainingSave : PageBase
    {
        #region 定义变量
        /// <summary>
        /// 主键
        /// </summary>
        public string CompanyTrainingId
        {
            get
            {
                return (string)ViewState["CompanyTrainingId"];
            }
            set
            {
                ViewState["CompanyTrainingId"] = value;
            }
        }

        /// <summary>
        /// 上级ID
        /// </summary>
        public string SupCompanyTrainingId
        {
            get
            {
                return (string)ViewState["SupCompanyTrainingId"];
            }
            set
            {
                ViewState["SupCompanyTrainingId"] = value;
            }
        }
        #endregion

        #region 加载
        /// <summary>
        /// 加载页面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetButtonPower();
                btnClose.OnClientClick = ActiveWindow.GetHideReference();

                this.drpIsEndLever.DataTextField = "TypeName";
                drpIsEndLever.DataValueField = "TypeId";
                drpIsEndLever.DataSource = BLL.TrainingService.GetIsEndLeverList();
                drpIsEndLever.DataBind();

                ProjectService.InitAllProjectDropDownList(this.drpProject, true);
                if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
                {
                    this.drpProject.SelectedValue = this.CurrUser.LoginProjectId;
                    this.drpProject.Readonly = true;
                }

                this.CompanyTrainingId = Request.QueryString["CompanyTrainingId"];
                this.SupCompanyTrainingId = Request.QueryString["SupCompanyTrainingId"];
                if (!string.IsNullOrEmpty(CompanyTrainingId))
                {
                    var q = BLL.CompanyTrainingService.GetCompanyTrainingById(CompanyTrainingId);
                    if (q != null)
                    {
                        this.SupCompanyTrainingId = q.SupCompanyTrainingId;                     
                        if (!string.IsNullOrEmpty(q.ProjectId))
                        {
                            this.drpProject.SelectedValueArray = q.ProjectId.Split(',');
                        }

                        txtCompanyTrainingCode.Text = q.CompanyTrainingCode;
                        txtCompanyTrainingName.Text = q.CompanyTrainingName;
                        if (q.IsEndLever == true)
                        {
                            this.drpIsEndLever.SelectedValue = "true";
                        }
                        else
                        {
                            this.drpIsEndLever.SelectedValue = "false";
                        }
                    }
                }
            }
        }
        #endregion

        #region 保存
        /// <summary>
        /// 保存按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Model.Training_CompanyTraining newTraining = new Model.Training_CompanyTraining
            {
                CompanyTrainingCode = this.txtCompanyTrainingCode.Text.Trim(),
                CompanyTrainingName = this.txtCompanyTrainingName.Text.Trim(),
                IsEndLever = Convert.ToBoolean(drpIsEndLever.SelectedValue),
                SupCompanyTrainingId = this.SupCompanyTrainingId,
            };
            if (this.drpProject.SelectedValue != BLL.Const._Null)
            {
                newTraining.ProjectId = Funs.GetStringByArray(this.drpProject.SelectedValueArray);
            }
            if (!string.IsNullOrEmpty(this.CompanyTrainingId))
            {
                newTraining.CompanyTrainingId = this.CompanyTrainingId;
                BLL.CompanyTrainingService.UpdateCompanyTraining(newTraining);
            }
            else
            {
                this.CompanyTrainingId = SQLHelper.GetNewID();
                newTraining.CompanyTrainingId = this.CompanyTrainingId;
                BLL.CompanyTrainingService.AddCompanyTraining(newTraining);
            }
            // 2. 关闭本窗体，然后刷新父窗体
            // PageContext.RegisterStartupScript(ActiveWindow.GetHideRefreshReference());
            // 2. 关闭本窗体，然后回发父窗体
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
            //PageContext.RegisterStartupScript(ActiveWindow.GetWriteBackValueReference(trainingId) + ActiveWindow.GetHideReference());
        }
        #endregion

        #region 验证公司教材库名称是否存在
        /// <summary>
        /// 验证公司教材库名称是否存在
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            var companyTraining = Funs.DB.Training_CompanyTraining.FirstOrDefault(x => x.SupCompanyTrainingId == this.SupCompanyTrainingId && x.CompanyTrainingName == this.txtCompanyTrainingName.Text.Trim() && (x.CompanyTrainingId != this.CompanyTrainingId || (this.CompanyTrainingId == null && x.CompanyTrainingId != null)));
            if (companyTraining != null)
            {
                ShowNotify("输入的名称已存在！", MessageBoxIcon.Warning);
            }
        }
        #endregion

        #region 按钮权限
        /// <summary>
        /// 获取按钮权限
        /// </summary>
        /// <param name="button"></param>
        /// <returns></returns>
        private void GetButtonPower()
        {
            if (Request.Params["value"] == "0")
            {
                return;
            }
            string menuId = !string.IsNullOrEmpty(this.CurrUser.LoginProjectId) ? Const.ProjectCompanyTrainingMenuId : Const.CompanyTrainingMenuId;
            var buttonList = CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, menuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnSave))
                {
                    this.btnSave.Hidden = false;
                }
            }
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpProject.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpProject.SelectedValueArray);
        }
    }
}