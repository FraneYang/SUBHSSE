using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using BLL;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.DataStatistics
{
    public partial class TrainingTaskStatistics : PageBase
    {
        /// <summary>
        /// 项目id
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

        #region 加载页面
        /// <summary>
        /// 加载页面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            // 表头过滤
            //FilterDataRowItem = FilterDataRowItemImplement;
            if (!IsPostBack)
            {
                this.ProjectId = this.CurrUser.LoginProjectId;
                if (!string.IsNullOrEmpty(Request.Params["projectId"]) && Request.Params["projectId"] != this.ProjectId)
                {
                    this.ProjectId = Request.Params["projectId"];
                }
                Funs.DropDownPageSize(this.ddlPageSize);
                ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
              
                string unitId = CommonService.GetIsThisUnitId();
                UnitService.InitBranchUnitDropDownList(this.drpCompany, unitId, true);
                if (!string.IsNullOrEmpty(this.CurrUser.UnitId) && this.CurrUser.UnitId != unitId)
                {
                    this.drpCompany.SelectedValue = this.CurrUser.UnitId;
                    //this.rbType.SelectedValue = "2";
                    //this.rbType.Readonly = true;
                    this.drpCompany.Readonly = true;
                    this.DrpCompany();
                }
                TrainTypeService.InitTrainTypeDropDownList(this.drpTrainType, true);
                // 绑定表格
               // BindGrid();
            }
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            string CompanyId = null;
            if (this.drpCompany.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpCompany.SelectedValue))
            {
                CompanyId = this.drpCompany.SelectedValue;
            }
            string ProjectId = null;
            if (this.drpProject.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpProject.SelectedValue))
            {
                ProjectId = this.drpProject.SelectedValue;
            }
            string UnitId = null;
            if (this.drpUnit.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpUnit.SelectedValue))
            {
                UnitId = this.drpUnit.SelectedValue;
            }
            string TeamGroupId = null;
            if (this.drpTeamGroup.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpTeamGroup.SelectedValue))
            {
                TeamGroupId = this.drpTeamGroup.SelectedValue;
            }
            string TrainTypeId = null;
            if (this.drpTrainType.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpTrainType.SelectedValue))
            {
                TrainTypeId = this.drpTrainType.SelectedValue;
            }
            string states = null;
            if (this.drpStates.SelectedValue != Const._Null && this.drpStates.SelectedValue != "-1")
            {
                states = this.drpStates.SelectedValue;
            }
            SqlParameter[] parameter = new SqlParameter[]
                    {
                    new SqlParameter("@CompanyId", CompanyId),
                    new SqlParameter("@ProjectId", ProjectId),
                     new SqlParameter("@UnitId", UnitId),
                     new SqlParameter("@TeamGroupId", TeamGroupId),
                     new SqlParameter("@TrainTypeId", TrainTypeId),
                    new SqlParameter("@StartTime", !string.IsNullOrEmpty(this.txtStartTime.Text)?this.txtStartTime.Text:null),
                    new SqlParameter("@EndTime", !string.IsNullOrEmpty(this.txtEndTime.Text)?this.txtEndTime.Text:null),
                     new SqlParameter("@States", states),
                    new SqlParameter("@PersonName", !string.IsNullOrEmpty(this.txtPersonName.Text)?this.txtPersonName.Text:null),
                    };
            DataTable tb = SQLHelper.GetDataTableRunProc("SpTrainingTaskStatistic", parameter);
            // 2.获取当前分页数据
            //var table = this.GetPagedDataTable(Grid1, tb1);

            Grid1.RecordCount = tb.Rows.Count;
            tb = GetFilteredTable(Grid1.FilteredData, tb);
            var table = this.GetPagedDataTable(Grid1, tb);

            Grid1.DataSource = table;
            Grid1.DataBind();
            for (int i = 0; i < Grid1.Rows.Count; i++)
            {
                //string[] rowID = Grid1.Rows[i].DataKeys[0].ToString().Split(',');
                //if (rowID.Count() > 0)
                //{
                //    var checkColligation = BLL.Check_CheckColligationService.GetCheckColligationByCheckColligationId(rowID[0]);
                //    if (checkColligation != null)
                //    {
                //        if (checkColligation.States == BLL.Const.State_2)
                //        {
                //            if (rowID.Count() > 1)
                //            {
                //                Model.Check_CheckColligationDetail detail = BLL.Check_CheckColligationDetailService.GetCheckColligationDetailByCheckColligationDetailId(rowID[1]);
                //                if (detail != null)
                //                {
                //                    if (!detail.CompletedDate.HasValue)
                //                    {
                //                        Grid1.Rows[i].RowCssClass = "Yellow";
                //                    }
                //                }
                //                //else
                //                //{
                //                //    Grid1.Rows[i].RowCssClass = "Red";
                //                //}
                //            }
                //        }
                //        else
                //        {
                //            Grid1.Rows[i].RowCssClass = "Green";
                //        }
                //    }
                //}
            }
        }
        #endregion

        #region 查询
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        #endregion

        #region 排序、分页、关闭窗口
        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            BindGrid();
        }

        /// <summary>
        /// 排序
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            BindGrid();
        }

        /// <summary>
        /// 分页显示条数下拉框
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        #endregion
        
        #region 导出按钮
        /// 导出按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOut_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            string filename = Funs.GetNewFileName();
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("考试统计" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Grid1.PageSize = this.Grid1.RecordCount;
            BindGrid();
            Response.Write(GetGridTableHtml(Grid1));
            Response.End();
        }

        /// <summary>
        /// 导出方法
        /// </summary>
        /// <param name="grid"></param>
        /// <returns></returns>
        private string GetGridTableHtml(Grid grid)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<meta http-equiv=\"content-type\" content=\"application/excel; charset=UTF-8\"/>");
            sb.Append("<table cellspacing=\"0\" rules=\"all\" border=\"1\" style=\"border-collapse:collapse;\">");
            sb.Append("<tr>");
            foreach (GridColumn column in grid.Columns)
            {
                sb.AppendFormat("<td>{0}</td>", column.HeaderText);
            }
            sb.Append("</tr>");
            foreach (GridRow row in grid.Rows)
            {
                sb.Append("<tr>");
                foreach (GridColumn column in grid.Columns)
                {
                    string html = row.Values[column.ColumnIndex].ToString();
                    if (column.ColumnID == "tfPageIndex")
                    {
                        html = (row.FindControl("lblPageIndex") as AspNet.Label).Text;
                    }
                    sb.AppendFormat("<td>{0}</td>", html);
                }

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            return sb.ToString();
        }
        #endregion

        protected void drpCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            DrpCompany();
        }

        protected void DrpCompany()
        {
            this.drpProject.Items.Clear();
            this.drpUnit.Items.Clear();
            this.drpTeamGroup.Items.Clear();
            if (this.drpCompany.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpCompany.SelectedValue))
            {
                ProjectService.InitProjectByUnitIdDropDownList(this.drpProject, this.drpCompany.SelectedValue, true);
            }
        }
        protected void drpProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpUnit.Items.Clear();
            this.drpTeamGroup.Items.Clear();
            if (this.drpProject.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpProject.SelectedValue))
            {
                UnitService.InitUnitDropDownList(this.drpUnit, this.drpProject.SelectedValue, true);
            }
        }

        protected void drpUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpTeamGroup.Items.Clear();
            if (this.drpUnit.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpUnit.SelectedValue))
            {
                TeamGroupService.InitTeamGroupProjectUnitDropDownList(this.drpTeamGroup, this.drpProject.SelectedValue, this.drpUnit.SelectedValue, true);
            }
        }
    }
}