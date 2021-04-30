using System;
using System.Collections.Generic;
using System.Linq;
using BLL;

namespace FineUIPro.Web.EduTrain
{
    public partial class PlanView : PageBase
    {
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
                var getPlan = APITrainingPlanService.getTrainingPlanByTrainingId(Request.Params["PlanId"]);
                if (getPlan != null)
                {
                    this.txtPlanCode.Text = getPlan.PlanCode;
                    this.txtPlanName.Text = getPlan.PlanName;
                    this.txtDesignerName.Text = getPlan.DesignerName;
                    this.txtDesignerDate.Text = getPlan.DesignerDate;
                    this.txtTrainType.Text = getPlan.TrainTypeName;
                    this.txtTrainLevel.Text = getPlan.TrainLevelName;
                    this.txtTrainStartDate.Text = getPlan.TrainStartDate;
                    this.txtTeachHour.Text = getPlan.TeachHour.ToString();

                    this.txtWorkPostNames.Text = getPlan.WorkPostNames;
                    this.txtUnitName.Text = getPlan.UnitNames;
                    this.txtTeachMan.Text = getPlan.TeachMan;
                    this.txtTeachAddress.Text = getPlan.TeachAddress;
                    this.txtTrainContent.Text= getPlan.TrainContent;
                    var testPlanTraining = from x in Funs.DB.Training_PlanItem
                                           join y in Funs.DB.Training_Training on x.TrainingEduId equals y.TrainingId
                                           where x.PlanId == getPlan.PlanId
                                           orderby y.TrainingCode
                                           select y.TrainingName;
                    foreach (var item in testPlanTraining)
                    {
                        this.txtTrainingEdu.Text = item + "；";
                    }

                    var getTask = from x in Funs.DB.Training_Task
                                  join y in Funs.DB.SitePerson_Person on x.UserId equals y.PersonId
                                  where x.PlanId == getPlan.PlanId
                                  orderby y.PersonName
                                  select y.PersonName;
                    foreach (var item in getTask)
                    {
                        this.txtMans.Text+= item + "；";
                    }
                }
            }
        }
        #endregion
    }
}