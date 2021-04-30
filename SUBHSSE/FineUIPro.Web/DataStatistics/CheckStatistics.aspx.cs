using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using BLL;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.DataStatistics
{
    public partial class CheckStatistics : PageBase
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
                string unitId = CommonService.GetIsThisUnitId();
                UnitService.InitBranchUnitDropDownList(this.drpCompany, unitId, true);
                if (!string.IsNullOrEmpty(this.CurrUser.UnitId) && this.CurrUser.UnitId != unitId)
                {
                    this.drpCompany.SelectedValue = this.CurrUser.UnitId;
                    this.rbType.SelectedValue = "2";
                    this.rbType.Readonly = true;
                    this.drpCompany.Readonly = true;
                    DrpCompany();
                }
                this.ProjectId = this.CurrUser.LoginProjectId;
                if (!string.IsNullOrEmpty(Request.Params["projectId"]) && Request.Params["projectId"] != this.ProjectId)
                {
                    this.ProjectId = Request.Params["projectId"];
                }
                Funs.DropDownPageSize(this.ddlPageSize);
                ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
                ProjectService.InitProjectDropDownList(this.drpProject, true);
                if (!string.IsNullOrEmpty(this.ProjectId))
                {
                    this.drpProject.SelectedValue = this.ProjectId;
                }
                // 绑定表格
             //   BindGrid();
            }
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            var getDatas= DataStatisticsService.GetCheckStatistics(this.rbType.SelectedValue, this.drpCompany.SelectedValue, this.drpProject.SelectedValue,this.drpUnit.SelectedValue,Funs.GetNewDateTime(this.txtStartTime.Text), Funs.GetNewDateTime(this.txtEndTime.Text));
            DataTable tb = this.GetPagedDataTable(Grid1, getDatas);
            Grid1.RecordCount = tb.Rows.Count;
            var table = this.GetPagedDataTable(Grid1, tb);
            Grid1.DataSource = table;
            Grid1.DataBind();
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
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("安全检查统计" + filename, System.Text.Encoding.UTF8) + ".xls");
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

        protected void rbType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string unitId = CommonService.GetIsThisUnitId();
            UnitService.InitBranchUnitDropDownList(this.drpCompany, unitId, true);
            this.drpCompany.SelectedValue = Const._Null;
            this.drpCompany.Readonly = false;
            if (this.rbType.SelectedValue == "1")
            {
                this.drpCompany.SelectedValue = unitId;
                this.drpCompany.Readonly = true;
            }
            else if (this.rbType.SelectedValue == "2")
            {
                this.drpCompany.Items.Remove(this.drpCompany.Items.FindByValue(unitId));
                this.drpCompany.SelectedValue = Const._Null;
            }

            DrpCompany();
        }

        protected void drpCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            DrpCompany();
        }

        public void DrpCompany()
        {
            this.drpProject.Items.Clear();
            this.drpUnit.Items.Clear();
            if (this.drpCompany.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpCompany.SelectedValue))
            {
                ProjectService.InitProjectByUnitIdDropDownList(this.drpProject, this.drpCompany.SelectedValue, true);
            }
        }

        protected void drpProject_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpUnit.Items.Clear();
            if (this.drpProject.SelectedValue != Const._Null && !string.IsNullOrEmpty(this.drpProject.SelectedValue))
            {
                UnitService.InitUnitDropDownList(this.drpUnit, this.drpProject.SelectedValue, true);
            }
        }
    }
}