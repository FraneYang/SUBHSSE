using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using BLL;

namespace FineUIPro.Web.EduTrain
{
    public partial class TestPlanView : PageBase
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
                string testPlanId = Request.Params["TestPlanId"];
                Model.Training_TestPlan plan = BLL.TestPlanService.GetTestPlanById(testPlanId);
                if (plan != null)
                {
                    this.txtPlanCode.Text = plan.PlanCode;
                    this.txtPlanName.Text = plan.PlanName;
                    this.txtTestStartTime.Text = string.Format("{0:yyyy-MM-dd hh:mm:ss}", plan.TestStartTime);
                    this.txtTestEndTime.Text = string.Format("{0:yyyy-MM-dd hh:mm:ss}", plan.TestEndTime);
                    this.txtDuration.Text = plan.Duration.ToString();
                    this.txtTestPalce.Text = plan.TestPalce;
                    this.txtTotalScore.Text = plan.TotalScore.ToString();
                    this.txtQuestionCount.Text = plan.QuestionCount.ToString();
                    this.txtWorkPostNames.Text = WorkPostService.getWorkPostNamesWorkPostIds(plan.WorkPostIds);
                    this.txtJValue.Text = plan.JValue.ToString();
                    this.txtMValue.Text = plan.MValue.ToString();
                    this.txtSValue.Text = plan.SValue.ToString();
                    this.txtPassingScore.Text = plan.PassingScore.ToString();
                    this.txtUnits.Text = UnitService.getUnitNamesUnitIds(plan.UnitIds);

                    var testPlanTraining = APITestPlanService.getTestPlanTrainingListByTestPlanId(testPlanId);
                    DataTable tb = this.LINQToDataTable(testPlanTraining);
                    Grid4.RecordCount = tb.Rows.Count;
                    Grid4.DataSource = this.GetPagedDataTable(Grid4, tb); 
                    Grid4.DataBind();

                    var getPersons = APITestRecordService.getTestRecordListByTestPlanId(testPlanId);
                    DataTable tb1 = this.LINQToDataTable(getPersons);
                    Grid1.RecordCount = tb1.Rows.Count;
                    Grid1.DataSource = this.GetPagedDataTable(Grid1, tb1);
                    Grid1.DataBind();
                }
            }
        }
        #endregion      
    }
}