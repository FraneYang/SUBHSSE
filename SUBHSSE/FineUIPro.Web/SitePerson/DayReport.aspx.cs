﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using BLL;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.SitePerson
{
    public partial class DayReport : PageBase
    {
        #region 定义项
        /// <summary>
        /// 清单主键
        /// </summary>
        public string DayReportId
        {
            get
            {
                return (string)ViewState["DayReportId"];
            }
            set
            {
                ViewState["DayReportId"] = value;
            }
        }
        #endregion

        #region 加载页面
        /// <summary>
        /// 加载页面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ////权限按钮方法
                this.GetButtonPower();
                ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
                // 绑定表格
                BindGrid();
                this.txtCompileDate.Text = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
            }
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            string strSql = string.Empty;
            if (!this.ckRecord.Checked)
            {
                strSql = "select DayReport.DayReportId,Users.UserName,DayReport.CompileDate,CodeRecords.Code AS DayReportCode "
                              + @" ,(CASE WHEN DayReport.States = " + BLL.Const.State_0 + " OR DayReport.States IS NULL THEN '待['+OperateUser.UserName+']提交' WHEN DayReport.States =  " + BLL.Const.State_2 + " THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName"
                              + @" from SitePerson_DayReport AS DayReport "
                              + @" LEFT JOIN Sys_FlowOperate AS FlowOperate ON DayReport.DayReportId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1"
                              + @" LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId "
                              + @" LEFT JOIN Sys_User AS Users ON DayReport.CompileMan=Users.UserId "
                              + @" LEFT JOIN Sys_CodeRecords AS CodeRecords ON DayReport.DayReportId=CodeRecords.DataId WHERE 1=1 ";
            }
            else
            {
                strSql = "select DayReport.DayReportId,Users.UserName,DayReport.CompileDate,CodeRecords.Code AS DayReportCode "
                               + @" ,(CASE WHEN DayReport.States = " + BLL.Const.State_0 + " OR DayReport.States IS NULL THEN '待['+OperateUser.UserName+']提交' WHEN DayReport.States =  " + BLL.Const.State_2 + " THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName"
                               + @" from SitePerson_DayReport_Bak AS DayReport "
                               + @" LEFT JOIN Sys_FlowOperate AS FlowOperate ON DayReport.DayReportId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1"
                               + @" LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId "
                               + @" LEFT JOIN Sys_User AS Users ON DayReport.CompileMan=Users.UserId "
                               + @" LEFT JOIN Sys_CodeRecords AS CodeRecords ON DayReport.DayReportId=CodeRecords.DataId WHERE 1=1 ";
            }

            List<SqlParameter> listStr = new List<SqlParameter>();
            strSql += " AND DayReport.ProjectId = @ProjectId";
            if (!string.IsNullOrEmpty(Request.Params["projectId"]))  ///是否文件柜查看页面传项目值
            {
                listStr.Add(new SqlParameter("@ProjectId", Request.Params["projectId"]));
                strSql += " AND DayReport.States = @States";  ///状态为已完成
                listStr.Add(new SqlParameter("@States", BLL.Const.State_2));
            }
            else
            {
                listStr.Add(new SqlParameter("@ProjectId", this.CurrUser.LoginProjectId));
            }        
            if (!string.IsNullOrEmpty(this.txtDate.Text.Trim()))
            {
                strSql += " AND DayReport.CompileDate = @DayReportDate";
                listStr.Add(new SqlParameter("@DayReportDate", this.txtDate.Text.Trim()));
            }
            strSql += " order by DayReport.CompileDate desc";
            SqlParameter[] parameter = listStr.ToArray();
            DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);
            Grid1.RecordCount = tb.Rows.Count;
         //   tb = GetFilteredTable(Grid1.FilteredData, tb);
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

        #region 页索引改变事件
        /// <summary>
        /// 页索引改变事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            Grid1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        #endregion

        #region 排序
        /// <summary>
        /// 排序
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            Grid1.SortDirection = e.SortDirection;
            Grid1.SortField = e.SortField;
            BindGrid();
        }
        #endregion

        #region 分页选择下拉改变事件
        /// <summary>
        /// 分页选择下拉改变事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid1.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            BindGrid();
        }
        #endregion

        #region 弹出编辑窗口关闭事件
        /// <summary>
        /// 弹出编辑窗体关闭事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            BindGrid();
        }
        #endregion

        #region 编制
        /// <summary>
        /// 编制
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtCompileDate.Text.Trim()))
            {
                Alert.ShowInTop("请选择日期！", MessageBoxIcon.Warning);
                return;
            }
            DateTime? compileDate = BLL.Funs.GetNewDateTime(this.txtCompileDate.Text);
            if (compileDate.HasValue && !BLL.SitePerson_DayReportService.IsExistDayReport(compileDate.Value, this.CurrUser.LoginProjectId))
            {
                this.DayReportId = SQLHelper.GetNewID(typeof(Model.SitePerson_DayReport));
                Model.SitePerson_DayReport newDayReport = new Model.SitePerson_DayReport
                {
                    DayReportId = this.DayReportId,
                    ProjectId = this.CurrUser.LoginProjectId,
                    CompileMan = this.CurrUser.UserId,
                    CompileDate = compileDate,
                    States = BLL.Const.State_0  //待提交                 
                };
                BLL.SitePerson_DayReportService.AddDayReport(newDayReport);

                var units = from x in Funs.DB.Project_ProjectUnit
                            where x.ProjectId == this.CurrUser.LoginProjectId && (x.UnitType == BLL.Const.ProjectUnitType_1 || x.UnitType == BLL.Const.ProjectUnitType_2)
                            select x;     //1为总包，2为施工分包
                if (units.Count() > 0)
                {
                    foreach (var item in units)
                    {
                        if (item.OutTime == null || item.OutTime >= DateTime.Now.Date)
                        {
                            Model.SitePerson_DayReportDetail newDayReportDetail = new Model.SitePerson_DayReportDetail();
                            string newKeyID = SQLHelper.GetNewID(typeof(Model.SitePerson_DayReportDetail));
                            newDayReportDetail.DayReportDetailId = newKeyID;
                            newDayReportDetail.DayReportId = this.DayReportId;
                            newDayReportDetail.UnitId = item.UnitId;
                            newDayReportDetail.WorkTime = 8;
                            //newDayReportDetail.StaffData = this.GetStaffData(item.UnitId, item.UnitType, compileDate.Value);
                            BLL.SitePerson_DayReportDetailService.AddDayReportDetail(newDayReportDetail);
                            var posts = (from x in Funs.DB.Base_WorkPost
                                         join y in Funs.DB.SitePerson_Person
                                         on x.WorkPostId equals y.WorkPostId
                                         where y.UnitId == item.UnitId && y.ProjectId == this.CurrUser.LoginProjectId
                                         orderby x.WorkPostCode
                                         select x).Distinct().ToList();
                            foreach (var postItem in posts)
                            {
                                Model.SitePerson_DayReportUnitDetail newDayReportUnitDetail = new Model.SitePerson_DayReportUnitDetail
                                {
                                    DayReportDetailId = newKeyID,
                                    PostId = postItem.WorkPostId,
                                    CheckPersonNum = this.GetCheckingCout(postItem.WorkPostId)
                                };
                                newDayReportUnitDetail.RealPersonNum = newDayReportUnitDetail.CheckPersonNum;
                                newDayReportUnitDetail.PersonWorkTime = newDayReportUnitDetail.RealPersonNum * newDayReportDetail.WorkTime;
                                BLL.SitePerson_DayReportUnitDetailService.AddDayReportUnitDetail(newDayReportUnitDetail);
                            }
                        }
                    }
                }
                PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("DayReportEdit.aspx?DayReportId={0}", this.DayReportId, "编辑 - ")));
            }
            else
            {
                Alert.ShowInTop("当日日报已存在，请到列表点击日报日期查看！", MessageBoxIcon.Warning);
                return;
            }
        }
        #endregion

        #region 得到当前单位人员情况
        /// <summary>
        /// 得到当前单位人员情况
        /// </summary>
        /// <param name="unitId"></param>
        /// <returns></returns>
        private string GetStaffData(string unitId, string unitType, DateTime compileDate)
        {
            string allStaffData = string.Empty;

            var allSum = from x in Funs.DB.SitePerson_Person
                         where x.ProjectId == this.CurrUser.LoginProjectId && x.UnitId == unitId && x.IsUsed == true
                         && (x.InTime < compileDate.AddMonths(1) || !x.InTime.HasValue)
                         select x;

            ///管理人员集合
            var glAllPerson = from x in allSum
                              join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                              where (y.PostType == "1" || y.PostType == "4")    //一般管理岗位和特种管理人员
                              select x;

            ///安全专职人员集合
            var hsseAllPerson = from x in allSum
                                join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                                where y.IsHsse == true       //HSSE管理人员
                                select x;

            ///单位作业人员集合
            var zyAllPerson = from x in allSum
                              join y in Funs.DB.Base_WorkPost on x.WorkPostId equals y.WorkPostId
                              where (y.PostType == "2" || y.PostType == "3")      //特种作业人员和一般作业岗位
                              select x;


            if (unitType == "1")
            {
                allStaffData += "总人数：" + allSum.Count().ToString() + "，管理人员总数" + glAllPerson.Count().ToString() + "人，专职安全人员共" + hsseAllPerson.Count().ToString() + " 人。";
            }
            else
            {
                allStaffData += "总人数：" + allSum.Count().ToString() + "，管理人员总数" + glAllPerson.Count().ToString() + "人，专职安全人员共" + hsseAllPerson.Count().ToString() + " 人，施工单位作业人员总数" + zyAllPerson.Count().ToString() + "人。";
            }
            return allStaffData;
        }
        #endregion

        #region 得到当前岗位考勤人数
        /// <summary>
        /// 得到当前岗位考勤人数
        /// </summary>
        /// <param name="postId"></param>
        /// <returns></returns>
        private int GetCheckingCout(string workPostId)
        {
            int count = 0;
            DateTime? nowMont = BLL.Funs.GetNewDateTime(this.txtCompileDate.Text);
            if (nowMont.HasValue)
            {
                var checks = from x in Funs.DB.SitePerson_Checking
                             join y in Funs.DB.SitePerson_Person on x.PersonId equals y.PersonId
                             join z in Funs.DB.Base_WorkPost on y.WorkPostId equals z.WorkPostId
                             where x.IntoOutTime > nowMont.Value.AddDays(-1) && x.IntoOutTime < nowMont.Value.AddDays(1) && y.ProjectId == this.CurrUser.LoginProjectId
                             && z.WorkPostId == workPostId
                             select x;
                count = checks.Count();               
            }

            return count;
        }
        #endregion

        #region 删除
        /// <summary>
        /// 右键删除事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuDel_Click(object sender, EventArgs e)
        {
            this.DeleteData();
        }

        /// <summary>
        /// 删除方法
        /// </summary>
        private void DeleteData()
        {
            if (Grid1.SelectedRowIndexArray.Length > 0)
            {
                bool isShow = false;
                if (Grid1.SelectedRowIndexArray.Length == 1)
                {
                    isShow = true;
                }
                foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                {
                    string rowID = Grid1.DataKeys[rowIndex][0].ToString();
                    if (this.judgementDelete(rowID, isShow))
                    {
                        var getV = BLL.SitePerson_DayReportService.GetDayReportByDayReportId(rowID);
                        if (getV != null)
                        {
                            BLL.LogService.AddSys_Log(this.CurrUser, null, getV.DayReportId, BLL.Const.DayReportMenuId, BLL.Const.BtnDelete);
                            BLL.SitePerson_DayReportDetailService.DeleteDayReportDetailsByDayReportId(rowID);                            
                            BLL.SitePerson_DayReportService.DeleteDayReportByDayReportId(rowID);
                        }
                    }
                }

                BindGrid();
                ShowNotify("删除数据成功!（表格数据已重新绑定）", MessageBoxIcon.Success);
            }
        }

        /// <summary>
        /// 判断是否可删除
        /// </summary>
        /// <param name="rowID"></param>
        /// <param name="isShow"></param>
        /// <returns></returns>
        private bool judgementDelete(string rowID, bool isShow)
        {
            string content = string.Empty;
            if (string.IsNullOrEmpty(content))
            {
                return true;
            }
            else
            {
                if (isShow)
                {
                    Alert.ShowInTop(content);
                }
                return false;
            }
        }
        #endregion

        #region Grid双击事件
        /// <summary>
        /// Grid行双击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            btnMenuModify_Click(null, null);
        }
        #endregion

        #region 编辑
        /// <summary>
        /// 编辑按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuModify_Click(object sender, EventArgs e)
        {
            if (Grid1.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请至少选择一条记录！", MessageBoxIcon.Warning);
                return;
            }
            string DayReportId = Grid1.SelectedRowID;
            if (!this.ckRecord.Checked)
            {
                var dayReport = BLL.SitePerson_DayReportService.GetDayReportByDayReportId(DayReportId);
                if (dayReport != null)
                {
                    if (this.btnMenuModify.Hidden || dayReport.States == BLL.Const.State_2)   ////双击事件 编辑权限有：编辑页面，无：查看页面 或者状态是完成时查看页面
                    {
                        PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("DayReportView.aspx?DayReportId={0}", DayReportId, "查看 - ")));
                    }
                    else
                    {
                        PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("DayReportEdit.aspx?DayReportId={0}", DayReportId, "编辑 - ")));
                    }
                }
            }
            else
            {
                PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("DayReportView.aspx?DayReportId={0}&nowData=-1", DayReportId, "查看 - ")));
            }
        }
        #endregion

        #region 转换字符串
        /// <summary>
        /// 转换当日人工时
        /// </summary>
        /// <param name="workStage"></param>
        /// <returns></returns>
        protected string ConvertPersonWorkTimeSum(object dayReportId)
        {
            if (dayReportId != null)
            {
                if (!this.ckRecord.Checked)
                {
                    return (Funs.DB.SitePerson_DayReportDetail.Where(x => x.DayReportId == dayReportId.ToString()).Sum(x => x.PersonWorkTime) ?? 0).ToString();
                }
                else
                {
                    return (Funs.DB.SitePerson_DayReportDetail_Bak.Where(x => x.DayReportId == dayReportId.ToString()).Sum(x => x.PersonWorkTime) ?? 0).ToString();
                }

            }
            return "";
        }

        /// <summary>
        /// 转换当年累计人工时
        /// </summary>
        /// <param name="workStage"></param>
        /// <returns></returns>
        protected string ConvertYearPersonWorkTime(object compileDate)
        {
            if (compileDate != null)
            {
                Model.SUBHSSEDB db = Funs.DB;
                DateTime date = Convert.ToDateTime(compileDate);
                var q = from y in db.SitePerson_DayReportDetail
                        where
                            (from z in db.SitePerson_DayReport
                             where z.CompileDate <= date && z.CompileDate.Value.Year == date.Year
                             && z.ProjectId == this.CurrUser.LoginProjectId
                             select z.DayReportId).Contains(y.DayReportId)
                        select y;
                if (q.Count() > 0)
                {
                    return q.Sum(x => x.PersonWorkTime ?? 0).ToString();
                }
            }
            return "";
        }

        /// <summary>
        /// 转换累计人工时
        /// </summary>
        /// <param name="workStage"></param>
        /// <returns></returns>
        protected string ConvertTotalPersonWorkTimeSum(object compileDate)
        {
            if (compileDate != null)
            {
                Model.SUBHSSEDB db = Funs.DB;
                DateTime date = Convert.ToDateTime(compileDate);
                var q = from y in db.SitePerson_DayReportDetail where (from z in db.SitePerson_DayReport where z.CompileDate <= date && z.ProjectId == this.CurrUser.LoginProjectId select z.DayReportId).Contains(y.DayReportId) select y;
                if (q.Count() > 0)
                {
                    return q.Sum(x => x.PersonWorkTime ?? 0).ToString();
                }
            }
            return "";
        }
        #endregion

        #region 获取按钮权限
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
            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, BLL.Const.DayReportMenuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnAdd))
                {
                    this.btnNew.Hidden = false;
                    this.btnImport.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnModify))
                {
                    this.btnMenuModify.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnDelete))
                {
                    this.btnMenuDel.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnIn))
                {
                    this.btnImport.Hidden = false;
                    this.btnImport2.Hidden = false;
                }
            }
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
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("人工时日报" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Grid1.PageSize = 500;
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
                    if (column.ColumnID == "tfWorkTime")
                    {
                        html = (row.FindControl("lblWorkTime") as AspNet.Label).Text;
                    }
                    if (column.ColumnID == "tfWorkTimeYear")
                    {
                        html = (row.FindControl("lblWorkTimeYear") as AspNet.Label).Text;
                    }
                    if (column.ColumnID == "tfTotal")
                    {
                        html = (row.FindControl("lblTotal") as AspNet.Label).Text;
                    }
                    sb.AppendFormat("<td>{0}</td>", html);
                }

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            return sb.ToString();
        }
        #endregion

        #region 导入
        /// <summary>
        /// 导入按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnImport_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("DayReportIn.aspx", "导入 - ")));
        }
        #endregion

        #region 导入
        /// <summary>
        /// 导入按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnImport2_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("DayReportImport.aspx", "导入 - ")));
        }
        #endregion

        protected void ckRecord_CheckedChanged(object sender, CheckedEventArgs e)
        {
            this.BindGrid();
        }
    }
}