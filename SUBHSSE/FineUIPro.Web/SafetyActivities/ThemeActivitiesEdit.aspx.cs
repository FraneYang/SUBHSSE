using BLL;
using System;
using System.Web;

namespace FineUIPro.Web.SafetyActivities
{
    public partial class ThemeActivitiesEdit : PageBase
    {
        #region 定义项
        /// <summary>
        /// 主键
        /// </summary>
        public string ThemeActivitiesId
        {
            get
            {
                return (string)ViewState["ThemeActivitiesId"];
            }
            set
            {
                ViewState["ThemeActivitiesId"] = value;
            }
        }
        /// <summary>
        /// 项目主键
        /// </summary>
        public string ProjectId
        {
            get
            {
                return (string)ViewState["ProjectId"];
            }
            set
            {
                ViewState["ProjectId"] = value;
            }
        }

        /// <summary>
        /// 主键
        /// </summary>
        public string UnitId
        {
            get
            {
                return (string)ViewState["UnitId"];
            }
            set
            {
                ViewState["UnitId"] = value;
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
                this.ProjectId = this.CurrUser.LoginProjectId;
                this.UnitId = Request.Params["UnitId"];
                this.btnClose.OnClientClick = ActiveWindow.GetHideReference();
                this.InitDropDownList();
  
                this.ThemeActivitiesId = Request.Params["ThemeActivitiesId"];
                if (!string.IsNullOrEmpty(this.ThemeActivitiesId))
                {
                   var getData = BLL.ThemeActivitiesService.GetThemeActivitiesById(this.ThemeActivitiesId);
                    if (getData != null)
                    {
                        this.ProjectId = getData.ProjectId;
                        this.UnitId = getData.UnitId;
                        if (this.ProjectId != this.CurrUser.LoginProjectId)
                        {
                            this.InitDropDownList();
                        }

                        this.txtTitle.Text = getData.Title;
                        this.txtCompileDate.Text = string.Format("{0:yyyy-MM-dd}", getData.CompileDate);
                        if (!string.IsNullOrEmpty(getData.CompileMan))
                        {
                            this.drpCompileMan.SelectedValue = getData.CompileMan;
                        }
                        this.txtRemark.Text = getData.Remark;                       
                        this.txtSeeFile.Text = HttpUtility.HtmlDecode(getData.SeeFile);                                               
                    }
                }
                else
                {
                    this.drpCompileMan.SelectedValue = this.CurrUser.UserId;
                    this.txtCompileDate.Text = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
                    var codeTemplateRule = BLL.ProjectData_CodeTemplateRuleService.GetProjectData_CodeTemplateRuleByMenuIdProjectId(BLL.Const.ProjectThemeActivitiesMenuId, this.ProjectId);
                    if (codeTemplateRule != null)
                    {
                        this.txtSeeFile.Text = HttpUtility.HtmlDecode(codeTemplateRule.Template);
                    }
                                        
                    this.txtTitle.Text = this.SimpleForm1.Title;
                }
            }
        }
        #endregion

        /// <summary>
        ///  初始化下拉框
        /// </summary>
        private void InitDropDownList()
        {
            UserService.InitFlowOperateControlUserDropDownList(this.drpCompileMan, this.ProjectId,this.UnitId, true);
            this.drpCompileMan.SelectedValue = this.CurrUser.UserId;
        }

        #region 保存
        /// <summary>
        /// 保存按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {           
            this.SaveData(BLL.Const.BtnSave);
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }
        
        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="type"></param>
        private void SaveData(string type)
        {
            Model.SafetyActivities_ThemeActivities newThemeActivities = new Model.SafetyActivities_ThemeActivities
            {
                ProjectId = this.ProjectId,
                UnitId=this.UnitId,
                Title = this.txtTitle.Text.Trim(),
                CompileDate = Funs.GetNewDateTime(this.txtCompileDate.Text.Trim())
            };
            if (this.drpCompileMan.SelectedValue != BLL.Const._Null)
            {
                newThemeActivities.CompileMan = this.drpCompileMan.SelectedValue;
            }
            newThemeActivities.Remark = this.txtRemark.Text.Trim();
            newThemeActivities.SeeFile = HttpUtility.HtmlEncode(this.txtSeeFile.Text);
            if (!string.IsNullOrEmpty(this.ThemeActivitiesId))
            {
                newThemeActivities.ThemeActivitiesId = this.ThemeActivitiesId;
                BLL.ThemeActivitiesService.UpdateThemeActivities(newThemeActivities);
                BLL.LogService.AddSys_Log(this.CurrUser, newThemeActivities.Title, newThemeActivities.ThemeActivitiesId,BLL.Const.ProjectThemeActivitiesMenuId,BLL.Const.BtnModify );
            }
            else
            {
                this.ThemeActivitiesId = SQLHelper.GetNewID(typeof(Model.SafetyActivities_ThemeActivities));
                newThemeActivities.ThemeActivitiesId = this.ThemeActivitiesId;
                BLL.ThemeActivitiesService.AddThemeActivities(newThemeActivities);
                BLL.LogService.AddSys_Log(this.CurrUser, newThemeActivities.Title, newThemeActivities.ThemeActivitiesId, BLL.Const.ProjectThemeActivitiesMenuId, BLL.Const.BtnAdd);
            }
        }
        #endregion

        #region 附件上传
        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAttachUrl_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.ThemeActivitiesId))
            {
                SaveData(BLL.Const.BtnSave);
            }

            PageContext.RegisterStartupScript(WindowAtt.GetShowReference(String.Format("../AttachFile/webuploader.aspx?toKeyId={0}&path=FileUpload/ThemeActivitiesAttachUrl&menuId={1}", ThemeActivitiesId,BLL.Const.ProjectThemeActivitiesMenuId)));
        }
        #endregion
    }
}