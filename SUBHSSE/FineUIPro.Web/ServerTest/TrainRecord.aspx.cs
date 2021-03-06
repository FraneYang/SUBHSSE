﻿using BLL;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.ServerTest
{
    public partial class TrainRecord : PageBase
    {
        #region 定义项
        /// <summary>
        /// 培训记录主键
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
                this.btnMenuDelete.OnClientClick = Grid1.GetNoSelectionAlertReference("请至少选择一项！");
                this.btnMenuDelete.ConfirmText = String.Format("你确定要删除选中的&nbsp;<b><script>{0}</script></b>&nbsp;行数据吗？", Grid1.GetSelectedCountReference());
                //单位
                BLL.UnitService.InitUnitDropDownList(this.drpUnitId, this.CurrUser.LoginProjectId, true);
                if (!CommonService.GetIsThisUnit(this.CurrUser.UnitId))
                {
                    this.drpUnitId.SelectedValue = this.CurrUser.UnitId;
                    this.drpUnitId.Readonly = true;
                }
                //培训类型
                BLL.TrainTypeService.InitTrainTypeDropDownList(this.drpTrainType, true);
             
                ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
                // 绑定表格
                BindGrid();

            }
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            string strSql = "select TrainRecord.TrainingId"
                      + @",TrainRecord.TrainTitle"
                      + @",TrainType.TrainTypeName"
                      + @",TrainRecord.TrainStartDate"
                      + @",TrainRecord.TrainEndDate"
                      + @",TrainRecord.TeachHour"
                      + @",TrainRecord.TeachMan"
                      + @",TrainRecord.TrainPersonNum"
                       + @",TrainingCode"
                      + @",TrainRecord.UnitIds"
                      + @" from EduTrain_TrainRecord AS TrainRecord "          
                      + @" LEFT JOIN Base_TrainType AS TrainType ON TrainRecord.TrainTypeId=TrainType.TrainTypeId "                      
                      + @" WHERE 1=1 ";
            List<SqlParameter> listStr = new List<SqlParameter>();
            strSql += " AND TrainRecord.ProjectId IS NULL";
            if (!string.IsNullOrEmpty(Request.Params["projectId"]))  ///是否文件柜查看页面传项目值
            {
                strSql += " AND TrainRecord.States = @States";  ///状态为已完成
                listStr.Add(new SqlParameter("@States", BLL.Const.State_2));
            }
            if (this.drpTrainType.SelectedValue != BLL.Const._Null)
            {
                strSql += " AND TrainRecord.TrainTypeId = @TrainType";
                listStr.Add(new SqlParameter("@TrainType", this.drpTrainType.SelectedValue));
            }
            if (!string.IsNullOrEmpty(this.txtStartDate.Text.Trim()))
            {
                strSql += " AND TrainRecord.TrainStartDate >= @StartDate ";
                listStr.Add(new SqlParameter("@StartDate", this.txtStartDate.Text.Trim()));
            }
            if (!string.IsNullOrEmpty(this.txtEndDate.Text.Trim()))
            {
                strSql += " AND TrainRecord.TrainStartDate <= @EndDate ";
                listStr.Add(new SqlParameter("@EndDate", this.txtEndDate.Text.Trim()));
            }
            if (BLL.ProjectUnitService.GetProjectUnitTypeByProjectIdUnitId(this.CurrUser.LoginProjectId, this.CurrUser.UnitId))
            {
                strSql += " AND TrainRecord.UnitIds LIKE @UnitId1";
                listStr.Add(new SqlParameter("@UnitId1", "%" + this.CurrUser.UnitId + "%"));
            }
            if (this.drpUnitId.SelectedValue != BLL.Const._Null)
            {
                strSql += " AND TrainRecord.UnitIds LIKE @UnitId";
                listStr.Add(new SqlParameter("@UnitId", "%" + this.drpUnitId.SelectedValue.Trim() + "%"));
            }
            SqlParameter[] parameter = listStr.ToArray();
            DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);
            Grid1.RecordCount = tb.Rows.Count;
            var table = this.GetPagedDataTable(Grid1, tb);
            Grid1.DataSource = table;
            Grid1.DataBind();
            int totalPersonNum = 0;
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                totalPersonNum += Funs.GetNewIntOrZero(tb.Rows[i][7].ToString());
            }

            JObject summary = new JObject
            {
                { "TeachMan", "合计：" },
                { "TrainPersonNum", totalPersonNum }
            };

            Grid1.SummaryData = summary;
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
            BindGrid();
        }
        #endregion
        
        #region 编辑
        /// <summary>
        /// Grid行双击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            this.EditData();
        }
        protected void btnMenuView_Click(object sender, EventArgs e)
        {
            EditData();
        }

        /// <summary>
        /// 编辑
        /// </summary>
        private void EditData()
        {
            if (Grid1.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请至少选择一条记录！", MessageBoxIcon.Warning);
                return;
            }            
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TrainRecordView.aspx?TrainingId={0}", Grid1.SelectedRowID, "查看 - ")));
        }
        #endregion

        #region 删除
        /// <summary>
        /// 右键删除事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuDelete_Click(object sender, EventArgs e)
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
                        var TrainRecord = EduTrain_TrainRecordService.GetTrainRecordByTrainRecordId(rowID);
                        if (TrainRecord != null)
                        {
                            LogService.AddSys_Log(this.CurrUser, TrainRecord.TrainingCode, TrainRecord.TrainingId, BLL.Const.ProjectTrainRecordMenuId, BLL.Const.BtnDelete);
                            EduTrain_TrainRecordService.DeleteTrainingByTrainingId(rowID);
                            BindGrid();
                            ShowNotify("删除数据成功!（表格数据已重新绑定）", MessageBoxIcon.Success);
                        }
                    }
                }
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

        #region 关闭弹出窗
        /// <summary>
        /// 关闭弹出窗
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            BindGrid();
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
            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, BLL.Const.ServerTrainRecordMenuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnDelete))
                {
                    this.btnMenuDelete.Hidden = false;
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
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("培训记录" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Grid1.PageSize = this.Grid1.Rows.Count();
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
                    if (column.ColumnID == "tfNumber")
                    {
                        html = (row.FindControl("lblNumber") as AspNet.Label).Text;
                    }
                    if (column.ColumnID == "tfTeachAddress")
                    {
                        html = (row.FindControl("lblTeachAddress") as AspNet.Label).Text;
                    }
                    if (column.ColumnID == "tfUnitIds")
                    {
                        html = (row.FindControl("lblUnitId") as AspNet.Label).Text;
                    }
                    if (column.ColumnID == "tfTrainingCode")
                    {
                        html = (row.FindControl("lblTrainingCode") as AspNet.Label).Text;
                    }
                    //sb.AppendFormat("<td>{0}</td>", html);
                    sb.AppendFormat("<td style='vnd.ms-excel.numberformat:@;width:140px;'>{0}</td>", html);
                }

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            return sb.ToString();
        }
        #endregion

        #region 格式化字符串
        /// <summary>
        /// 获取单位名称
        /// </summary>
        /// <param name="unitIds"></param>
        /// <returns></returns>
        protected string ConvertUnitName(object unitIds)
        {            
            string unitName = string.Empty;
            if (unitIds != null)
            {
                List<string> infos = unitIds.ToString().Split(',').ToList();
                if (infos.Count() > 0)
                {
                    foreach (var item in infos)
                    {
                        Model.Base_Unit unit = BLL.UnitService.GetUnitByUnitId(item);
                        if (unit != null)
                        {
                            unitName += unit.UnitName + ",";
                        }
                    }
                    if (!string.IsNullOrEmpty(unitName))
                    {
                        unitName = unitName.Substring(0, unitName.LastIndexOf(","));
                    }
                }
            }
            return unitName;
        }
        #endregion

        #region 查询事件
        /// <summary>
        /// 查询事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Text_TextChanged(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        #endregion

        #region 打印
        /// <summary>
        /// 打印
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Grid1.SelectedRowID))
            {
                PageContext.RegisterStartupScript(Window2.GetShowReference(String.Format("../ReportPrint/ExReportPrint.aspx?reportId={0}&&replaceParameter={1}&&varValue={2}", Const.TrainRecordReportId, Grid1.SelectedRowID, "", "打印 - ")));
            }
        }
        #endregion                
    }
}