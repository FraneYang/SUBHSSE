﻿using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.Door
{
    public partial class InOutRecord : PageBase
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ProjectId = this.CurrUser.LoginProjectId;
                if (!string.IsNullOrEmpty(Request.Params["projectId"]) && Request.Params["projectId"] != this.ProjectId)
                {
                    this.ProjectId = Request.Params["projectId"];
                }

                DoorServerService.InitDepartmentDropDownList(this.drpUnit, null, true);
                DoorServerService.InitPostNameDropDownList(this.drpWorkPost, true);
                this.txtStartDate.Text = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
                this.txtEndDate.Text = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
                if (this.CurrUser != null && this.CurrUser.PageSize.HasValue)
                {
                    Grid1.PageSize = this.CurrUser.PageSize.Value;
                }
                this.ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
                GetPersonStatistic();
            }
        }

        /// <summary>
        /// 获取数据，合并相同行
        /// </summary>
        private void GetPersonStatistic()
        {
            string strSql = @"SELECT EmployInOutRecordId,InstallationId,InstallationName,UnitId,UnitName,EmployNO,EmployName,RecordDate
                    , IDCardNo, Nation, PostName, WorkIn1, OffDuty1, WorkIn2, OffDuty2, WorkIn3, OffDuty3, ManHours
                    FROM dbo.t_d_EmployInOutRecord where 1 = 1";

            List<SqlParameter> listStr = new List<SqlParameter>();

            if (this.drpUnit.SelectedValue != BLL.Const._Null)
            {
                strSql += " AND (UnitId = @UnitId OR  UnitName = @UnitName)";
                listStr.Add(new SqlParameter("@UnitId", this.drpUnit.SelectedValue));
                listStr.Add(new SqlParameter("@UnitName", this.drpUnit.SelectedText));
            }
            if (this.drpWorkPost.SelectedValue != BLL.Const._Null)
            {
                strSql += " AND PostName = @PostName";
                listStr.Add(new SqlParameter("@PostName", this.drpWorkPost.SelectedValue));
            }
            if (!string.IsNullOrEmpty(this.txtStartDate.Text))
            {
                strSql += " AND RecordDate >= @StartDate";
                listStr.Add(new SqlParameter("@StartDate", this.txtStartDate.Text));
            }
            if (!string.IsNullOrEmpty(this.txtEndDate.Text))
            {
                strSql += " AND RecordDate <= @EndDate";
                listStr.Add(new SqlParameter("@EndDate", this.txtEndDate.Text));
            }
            if (!string.IsNullOrEmpty(this.txtName.Text.Trim()))
            {
                strSql += " AND EmployName LIKE @EmployName";
                listStr.Add(new SqlParameter("@EmployName", "%" + this.txtName.Text.Trim() + "%"));
            }
            SqlParameter[] parameter = listStr.ToArray();
            DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);
            Grid1.RecordCount = tb.Rows.Count;
            var table = this.GetPagedDataTable(Grid1, tb);

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GetPersonStatistic();
        }

        #region 导出按钮
        /// 导出按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOut_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            string filename = Funs.GetNewFileName();
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("现场考勤记录" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Grid1.PageSize = this.Grid1.RecordCount;
            GetPersonStatistic();
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
                    if (column.ColumnID == "tfNumber")
                    {
                        html = (row.FindControl("labNumber") as AspNet.Label).Text;
                    }
                    
                    sb.AppendFormat("<td>{0}</td>", html);
                }

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            return sb.ToString();
        }
        #endregion

        #region 分页 排序
        /// <summary>
        /// 改变索引事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            GetPersonStatistic();
        }

        /// <summary>
        /// 分页下拉选择事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.Grid1.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            GetPersonStatistic();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            GetPersonStatistic();
        }

        #endregion
    }
}