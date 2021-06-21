using BLL;
using System;

namespace FineUIPro.Web.EduTrain
{
    public partial class TestTrainingView : PageBase
    {

        /// <summary>
        ///  页面加载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {    
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                string trainingId = Request.QueryString["TrainingId"];
                var q = BLL.TestTrainingService.GetTestTrainingById(trainingId);
                if (q != null)
                {                 
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
                    this.txtCompany.Text = UnitService.GetUnitNameByUnitId(q.CompanyId);
                    this.txtUnit.Text = UnitService.getUnitNamesUnitIds(q.UnitIds);
                    this.txtProject.Text = ProjectService.GetProjectNamesByProjectIds(q.ProjectId);

                    var supq = TestTrainingService.GetTestTrainingById(q.SupTrainingId);
                    if (supq != null)
                    {
                        this.txtSupTraining.Text = supq.TrainingName;
                    }
                    else
                    {
                        this.txtSupTraining.Text = "考试试题库";
                    }
                }
            }
        }
    }
}