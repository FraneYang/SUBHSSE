using BLL;
using Model;
using System;
using System.Linq;

namespace FineUIPro.Web.EduTrain
{
    public partial class TestTrainingSave : PageBase
    {
        #region 自定义项
        /// <summary>
        /// 主键
        /// </summary>
        public string TrainingId
        {
            get
            {
                return (string)ViewState["TrainingId"];
            }
            set
            {
                ViewState["TrainingId"] = value;
            }
        }

        /// <summary>
        /// 上级主键
        /// </summary>
        public string SupTrainingId
        {
            get
            {
                return (string)ViewState["SupTrainingId"];
            }
            set
            {
                ViewState["SupTrainingId"] = value;
            }
        }
        /// <summary>
        /// 菜单主键
        /// </summary>
        public string MenuId
        {
            get
            {
                return (string)ViewState["MenuId"];
            }
            set
            {
                ViewState["MenuId"] = value;
            }
        }
        public string ThisUnitId
        {
            get
            {
                return (string)ViewState["ThisUnitId"];
            }
            set
            {
                ViewState["ThisUnitId"] = value;
            }
        }
        #endregion

        /// <summary>
        ///  页面加载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.MenuId = !string.IsNullOrEmpty(this.CurrUser.LoginProjectId) ? Const.ProjectTestTrainingMenuId : Const.TestTrainingMenuId;
                this.GetButtonPower();
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                this.TrainingId = Request.QueryString["TrainingId"];
                this.SupTrainingId = Request.QueryString["SupTrainingId"];

                this.ThisUnitId = CommonService.GetIsThisUnitId();
                UnitService.InitUnitUnitIdDropDownList(this.drpCompany, this.ThisUnitId, true);
                UnitService.InitBranchUnitDropDownList(this.drpUnit, this.ThisUnitId, true);
                ProjectService.InitAllProjectDropDownList(this.drpProject, true);
                if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
                {
                    this.drpProject.SelectedValue = this.CurrUser.LoginProjectId;
                    this.drpProject.Readonly = true;
                    this.drpCompany.Hidden = true;
                    this.drpUnit.Hidden = true;
                    this.SelectALLUnit.Hidden = true;
                    this.SelectNoALLUnit.Hidden = true;

                    this.SelectALL.Hidden = true;
                    this.SelectNoALL.Hidden = true;
                }
                else if (this.CurrUser.UnitId != this.ThisUnitId && this.CurrUser.UserId != Const.sysglyId && this.CurrUser.UserId != Const.hfnbdId)
                {
                    this.drpUnit.Items.Clear();
                    UnitService.InitUnitUnitIdDropDownList(this.drpUnit, this.CurrUser.UnitId, true);
                    this.drpCompany.Hidden = true;
                    this.SelectALLUnit.Hidden = true;
                    this.SelectNoALLUnit.Hidden = true;

                    this.drpProject.Items.Clear();
                    ProjectService.InitProjectByUnitIdDropDownList(this.drpProject, this.CurrUser.UnitId, true);
                }

                if (!String.IsNullOrEmpty(TrainingId))
                {
                    var q = BLL.TestTrainingService.GetTestTrainingById(TrainingId);
                    if (q != null)
                    {
                        this.SupTrainingId = q.SupTrainingId;
                        txtTrainingCode.Text = q.TrainingCode;
                        txtTrainingName.Text = q.TrainingName;
                        if (q.IsEndLever == true)
                        {
                            ckIsEndLever.Checked = true;
                        }
                        else
                        {
                            ckIsEndLever.Checked = false;
                        }

                        var getsup = Funs.DB.Training_TestTraining.FirstOrDefault(x => x.SupTrainingId == TrainingId);
                        if (getsup != null)
                        {
                            ckIsEndLever.Checked = false;
                            ckIsEndLever.Readonly = true;
                        }
                        var getE = Funs.DB.Training_TestTrainingItem.FirstOrDefault(x => x.TrainingId == TrainingId);
                        if (getE != null)
                        {
                            ckIsEndLever.Checked = true;
                            ckIsEndLever.Readonly = true;
                        }
                        if (!string.IsNullOrEmpty(q.CompanyId))
                        {
                            this.drpCompany.SelectedValue = q.CompanyId;
                        }
                        if (!string.IsNullOrEmpty(q.UnitIds))
                        {
                            this.drpUnit.SelectedValueArray = q.UnitIds.Split(',');
                            this.drpProject.Items.Clear();
                            ProjectService.InitProjectByUnitIdDropDownList(this.drpProject, q.UnitIds, true);
                            this.drpProject.SelectedValueArray = q.ProjectId.Split(',');
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(q.ProjectId))
                            {
                                this.drpProject.SelectedValueArray = q.ProjectId.Split(',');
                            }
                        }
                    }
                }
                var supq = TestTrainingService.GetTestTrainingById(this.SupTrainingId);
                if (supq != null)
                {
                    this.txtSupTraining.Text = supq.TrainingName;
                }
                else
                {
                    this.SupTrainingId = "0";
                    this.txtSupTraining.Text = "考试试题库";
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Training_TestTraining newTraining = new Training_TestTraining
            {
                TrainingCode = txtTrainingCode.Text.Trim(),
                TrainingName = txtTrainingName.Text.Trim(),
                SupTrainingId = this.SupTrainingId,
                IsEndLever = this.ckIsEndLever.Checked,
            };
            if (this.drpCompany.SelectedValue != Const._Null)
            {
                newTraining.CompanyId = drpCompany.SelectedValue;
            }
            else
            {
                newTraining.CompanyId = null;
            }

            if (this.drpUnit.SelectedValue != Const._Null)
            {
                newTraining.UnitIds = Funs.GetStringByArray(this.drpUnit.SelectedValueArray);
            }
            else
            {
                newTraining.UnitIds = null;
            }
            if (this.drpProject.SelectedValue != Const._Null)
            {
                newTraining.ProjectId = Funs.GetStringByArray(this.drpProject.SelectedValueArray);
            }
            else
            {
                newTraining.ProjectId = null;
            }
            if (String.IsNullOrEmpty(TrainingId))
            {
                TrainingId = SQLHelper.GetNewID(typeof(Model.Training_TestTraining));
                newTraining.TrainingId = TrainingId;
                BLL.TestTrainingService.AddTestTraining(newTraining);
            }
            else
            {
                newTraining.TrainingId = TrainingId;
                BLL.TestTrainingService.UpdateTestTraining(newTraining);
            }

            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }

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

            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, this.MenuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnSave))
                {
                    this.btnSave.Hidden = false;
                }
            }
        }
        #endregion

        #region 验证考试试题库名称是否存在
        /// <summary>
        /// 验证考试试题库名称是否存在
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            var standard = Funs.DB.Training_TestTraining.FirstOrDefault(x => x.TrainingName == this.txtTrainingName.Text.Trim()
            && x.ProjectId == this.CurrUser.LoginProjectId
            && (x.TrainingId != this.TrainingId || (this.TrainingId == null && x.TrainingId != null)));
            if (standard != null)
            {
                ShowNotify("输入的名称已存在！", MessageBoxIcon.Warning);
            }
        }
        #endregion

        #region 项目下拉框
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpProject.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpProject.SelectedValueArray);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SelectALL_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            foreach (var item in this.drpProject.Items)
            {
                if (!string.IsNullOrEmpty(item.Value) && item.Value != Const._Null)
                {
                    if (string.IsNullOrEmpty(value))
                    {
                        value = item.Value;
                    }
                    else
                    {
                        value += "," + item.Value; ;
                    }
                }
            }
            if (!string.IsNullOrEmpty(value))
            {
                this.drpProject.SelectedValueArray = value.Split(',');
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SelectNoALL_Click(object sender, EventArgs e)
        {
            this.drpProject.SelectedValueArray = null;
        }
        #endregion

        #region 单位下拉框
        protected void SelectALLUnit_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            foreach (var item in this.drpUnit.Items)
            {
                if (!string.IsNullOrEmpty(item.Value) && item.Value != Const._Null)
                {
                    if (string.IsNullOrEmpty(value))
                    {
                        value = item.Value;
                    }
                    else
                    {
                        value += "," + item.Value; ;
                    }
                }
            }
            if (!string.IsNullOrEmpty(value))
            {
                this.drpUnit.SelectedValueArray = value.Split(',');
            }
            this.drpProject.Items.Clear();
            ProjectService.InitAllProjectDropDownList(this.drpProject, true);
        }

        protected void SelectNoALLUnit_Click(object sender, EventArgs e)
        {
            this.drpUnit.SelectedValueArray = null;
            this.drpProject.Items.Clear();
            ProjectService.InitAllProjectDropDownList(this.drpProject, true);
        }

        protected void drpUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpUnit.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpUnit.SelectedValueArray);
            if (this.drpUnit.SelectedValueArray.Count() == 0 || this.drpUnit.SelectedValueArray.Count() == this.drpUnit.Items.Count())
            {
                this.drpProject.Items.Clear();
                if (this.CurrUser.UnitId != this.ThisUnitId && this.CurrUser.UserId != Const.sysglyId && this.CurrUser.UserId != Const.hfnbdId)
                {
                    ProjectService.InitProjectByUnitIdDropDownList(this.drpProject, this.CurrUser.UnitId, true);
                }
                else
                {
                    ProjectService.InitAllProjectDropDownList(this.drpProject, true);                  
                }
            }
            else
            {
                this.drpProject.Items.Clear();
                ProjectService.InitProjectByUnitIdListDropDownList(this.drpProject, this.drpUnit.SelectedValueArray, true);
            }
        }
        #endregion
    }
}