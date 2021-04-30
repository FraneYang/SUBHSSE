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
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.MenuId = !string.IsNullOrEmpty(this.CurrUser.LoginProjectId) ? Const.ProjectTestTrainingMenuId : Const.TestTrainingMenuId;
                this.GetButtonPower();
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                this.TrainingId = Request.QueryString["TrainingId"];
                this.SupTrainingId = Request.QueryString["SupTrainingId"];
                ProjectService.InitAllProjectDropDownList(this.drpProject, true);
                if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
                {
                    this.drpProject.SelectedValue = this.CurrUser.LoginProjectId;
                    this.drpProject.Readonly = true;
                }
                if (!String.IsNullOrEmpty(TrainingId))
                {
                    var q = BLL.TestTrainingService.GetTestTrainingById(TrainingId);
                    if (q != null)
                    {
                        if (!string.IsNullOrEmpty(q.ProjectId))
                        {
                            this.drpProject.SelectedValueArray = q.ProjectId.Split(',');
                        }
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
                    }
                }
                var supq = BLL.TestTrainingService.GetTestTrainingById(this.SupTrainingId);
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
            if (this.drpProject.SelectedValue != BLL.Const._Null)
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
            // 2. 关闭本窗体，然后刷新父窗体
            // PageContext.RegisterStartupScript(ActiveWindow.GetHideRefreshReference());
            // 2. 关闭本窗体，然后回发父窗体
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
            //PageContext.RegisterStartupScript(ActiveWindow.GetWriteBackValueReference(trainingId) + ActiveWindow.GetHideReference());

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
    }
}