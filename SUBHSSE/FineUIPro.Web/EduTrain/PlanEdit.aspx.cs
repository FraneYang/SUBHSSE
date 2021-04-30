using System;
using System.Collections.Generic;
using System.Linq;
using BLL;
using Model;

namespace FineUIPro.Web.EduTrain
{
    public partial class PlanEdit : PageBase
    {
        #region 定义项
        /// <summary>
        /// 主键
        /// </summary>
        public string PlanId
        {
            get
            {
                return (string)ViewState["PlanId"];
            }
            set
            {
                ViewState["PlanId"] = value;
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
                this.btnClose.OnClientClick = ActiveWindow.GetHideReference();
                this.PlanId = Request.Params["PlanId"];
                this.ProjectId = this.CurrUser.LoginProjectId;
                UserService.InitUserDropDownList(this.drpDesignerId, this.ProjectId, true);
                TrainTypeService.InitTrainTypeDropDownList(this.drpTrainType, true);
                TrainLevelService.InitTrainLevelDropDownList(this.drpTrainLevel, true);
                UnitService.InitUnitDropDownList(this.drpUnit, this.ProjectId, true);
                WorkPostService.InitWorkPostDropDownList(this.drpWorkPost, this.ProjectId, null, true);
                CompanyTrainingItemService.InitCompanyTrainingItemDropDownList(this.drpTrainingEdu, this.ProjectId, true);

                var getPlan = TrainingPlanService.GetPlanById(this.PlanId);
                if (getPlan != null)
                {
                    this.ProjectId = getPlan.ProjectId;
                    this.txtPlanCode.Text = getPlan.PlanCode;
                    this.txtPlanName.Text = getPlan.PlanName;
                    this.drpDesignerId.SelectedValue = getPlan.DesignerId;
                    this.txtDesignerDate.Text = string.Format("{0:yyyy-MM-dd HH:mm}", getPlan.DesignerDate);
                    if (!string.IsNullOrEmpty(getPlan.TrainTypeId))
                    {
                        this.drpTrainType.SelectedValue = getPlan.TrainTypeId;
                    }
                    if (!string.IsNullOrEmpty(getPlan.TrainLevelId))
                    {
                        this.drpTrainLevel.SelectedValue = getPlan.TrainLevelId;
                    }
                    this.txtTrainStartDate.Text = string.Format("{0:yyyy-MM-dd HH:mm}", getPlan.TrainStartDate);
                    this.txtTeachHour.Text = getPlan.TeachHour.ToString();
                    if (!string.IsNullOrEmpty(getPlan.UnitIds))
                    {
                        this.drpUnit.SelectedValueArray = getPlan.UnitIds.Split(',');
                    }
                    if (!string.IsNullOrEmpty(getPlan.WorkPostId))
                    {
                        this.drpWorkPost.SelectedValueArray = getPlan.WorkPostId.Split(',');
                    }
                    this.txtTeachMan.Text = getPlan.TeachMan;
                    this.txtTeachAddress.Text = getPlan.TeachAddress;
                    this.txtTrainContent.Text = getPlan.TrainContent;
                    SetDrpMan();
                    var getTasks = Funs.DB.Training_Task.Where(x => x.PlanId == getPlan.PlanId).Select(x => x.UserId).ToArray();
                    if (getTasks.Count() > 0)
                    {
                        this.drpMan.SelectedValueArray = getTasks;
                    }

                    var getItem = Funs.DB.Training_PlanItem.Where(x => x.PlanId == getPlan.PlanId).Select(x => x.CompanyTrainingItemId).ToArray();
                    if (getItem.Count() > 0)
                    {
                        this.drpTrainingEdu.SelectedValueArray = getItem;
                    }
                }
                else
                {
                    this.txtDesignerDate.Text = string.Format("{0:yyyy-MM-dd HH:mm}", DateTime.Now);
                    this.txtTrainStartDate.Text = string.Format("{0:yyyy-MM-dd HH:mm}", DateTime.Now);
                    this.drpDesignerId.SelectedValue = this.CurrUser.UserId;
                    this.txtTeachHour.Text = "1";
                    this.PlanId = SQLHelper.GetNewID();
                }
            }
        }
        #endregion

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SaveData(Const.BtnSave);     
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData(Const.BtnSubmit);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="saveType"></param>
        protected void SaveData(string saveType)
        {
            if (this.drpDesignerId.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择制定人！");
                return;
            }
            if (this.drpTrainType.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择培训类型！");
                return;
            }
            if (this.drpUnit.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择培训单位！");
                return;
            }
            if (this.drpWorkPost.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择培训岗位！");
                return;
            }
            TrainingPlanItem newTrainingPlan = new TrainingPlanItem
            {
                PlanId = this.PlanId,
                PlanCode = this.txtPlanCode.Text.Trim(),
                DesignerId = this.drpDesignerId.SelectedValue,
                PlanName = this.txtPlanName.Text.Trim(),
                TrainContent = this.txtTrainContent.Text.Trim(),
                TrainStartDate = this.txtTrainStartDate.Text.Trim(),
                TeachHour = Funs.GetNewDecimalOrZero( this.txtTeachHour.Text),
                TeachMan = this.txtTeachMan.Text,
                TeachAddress = this.txtTeachAddress.Text,
                States =Const.State_0,
            };
            if (saveType == Const.BtnSubmit)
            {
                newTrainingPlan.States = Const.State_1;
            }
            if (this.drpTrainType.SelectedValue != null)
            {
                newTrainingPlan.TrainTypeId = this.drpTrainType.SelectedValue;
            }
            if (this.drpUnit.SelectedValue != BLL.Const._Null)
            {
                newTrainingPlan.UnitIds = Funs.GetStringByArray(this.drpUnit.SelectedValueArray);
            }
            if (this.drpWorkPost.SelectedValue != BLL.Const._Null)
            {
                newTrainingPlan.WorkPostId = Funs.GetStringByArray(this.drpWorkPost.SelectedValueArray);
                newTrainingPlan.WorkPostNames = this.drpWorkPost.SelectedText;
            }
            if (!string.IsNullOrEmpty(this.ProjectId))
            {
                newTrainingPlan.ProjectId = this.ProjectId;
            }
            if (this.drpTrainLevel.SelectedValue != Const._Null)
            {
                newTrainingPlan.TrainLevelId = this.drpTrainLevel.SelectedValue;
            }
            List<TrainingTaskItem> TrainingTasks = new List<TrainingTaskItem>(); 
            foreach (var item in this.drpMan.SelectedItemArray)
            {
                if (item.Value != Const._Null)
                {
                    Model.TrainingTaskItem newTrainingTasks = new TrainingTaskItem()
                    {
                        PlanId = this.PlanId,
                        PersonId = item.Value,
                    };
                    TrainingTasks.Add(newTrainingTasks);
                }
            }
            if (TrainingTasks.Count() > 0)
            {
                newTrainingPlan.TrainingTasks = TrainingTasks;
            }

            List<TrainingPlanItemItem> TrainingPlanItemItems = new List<TrainingPlanItemItem>();
            foreach (var item in this.drpTrainingEdu.SelectedItemArray)
            {
                if (item.Value != Const._Null)
                {
                    Model.TrainingPlanItemItem newPlanItem = new Model.TrainingPlanItemItem
                    {
                        PlanId = this.PlanId,
                        CompanyTrainingItemId = item.Value,
                    };
                    var getC = CompanyTrainingItemService.GetCompanyTrainingItemById(item.Value);
                    if (getC != null)
                    {
                        newPlanItem.CompanyTrainingId = getC.CompanyTrainingId;
                    }
                    TrainingPlanItemItems.Add(newPlanItem);
                }
            }
            if (TrainingPlanItemItems.Count() > 0)
            {
                newTrainingPlan.TrainingPlanItems = TrainingPlanItemItems;
            }
            APITrainingPlanService.SaveTrainingPlan(newTrainingPlan);
            ShowNotify(saveType + "成功！", MessageBoxIcon.Success);
            PageContext.RegisterStartupScript(ActiveWindow.GetHideRefreshReference());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpUnit.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpUnit.SelectedValueArray);
            SetDrpMan();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpWorkPost_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpWorkPost.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpWorkPost.SelectedValueArray);
            SetDrpMan();
        }
        protected void drpMan_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpMan.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpMan.SelectedValueArray);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpTrainType_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetDrpMan();
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetDrpMan()
        {
            this.drpMan.Items.Clear();
            string unitId = Funs.GetStringByArray(this.drpUnit.SelectedValueArray);
            string workPostId = Funs.GetStringByArray(this.drpWorkPost.SelectedValueArray);
            if (!string.IsNullOrEmpty(unitId) && unitId != Const._Null && !string.IsNullOrEmpty(workPostId) && workPostId != Const._Null && this.drpTrainType.SelectedValue != Const._Null)
            {
                PersonService.InitTrainingPersonDropDownList(this.drpMan, this.ProjectId, unitId, workPostId, this.drpTrainType.SelectedValue, true);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpTrainingEdu_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpTrainingEdu.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpTrainingEdu.SelectedValueArray);
        }


        protected void SelectALL_U_Click(object sender, EventArgs e)
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
            SetDrpMan();
        }

        protected void SelectNoALL_U_Click(object sender, EventArgs e)
        {
            this.drpUnit.SelectedValueArray = null;
            SetDrpMan();
        }

        protected void SelectALL_W_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            foreach (var item in this.drpWorkPost.Items)
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
                this.drpWorkPost.SelectedValueArray = value.Split(',');
            }
            SetDrpMan();
        }

        protected void SelectNoALL_W_Click(object sender, EventArgs e)
        {
            this.drpWorkPost.SelectedValueArray = null;
            SetDrpMan();
        }
    }
}