﻿using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.EduTrain
{
    public partial class CompanyTraining : PageBase
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
                this.GetButtonPower();
                btnDeleteDetail.OnClientClick = Grid1.GetNoSelectionAlertReference("请至少选择一项！");
                btnDeleteDetail.ConfirmText = String.Format("你确定要删除选中的&nbsp;<b><script>{0}</script></b>&nbsp;行数据吗？", Grid1.GetSelectedCountReference());
                if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
                {
                    this.rblType.Hidden = true;
                    this.rblType.SelectedValue = "1";
                }
                InitTreeMenu();
            }
        }
        #endregion

        #region 加载树
        /// <summary>
        /// 初始化树
        /// </summary>
        private void InitTreeMenu()
        {
            trCompanyTraining.Nodes.Clear();
            trCompanyTraining.ShowBorder = false;
            trCompanyTraining.ShowHeader = false;
            trCompanyTraining.EnableIcons = true;
            trCompanyTraining.AutoScroll = true;
            trCompanyTraining.EnableSingleClickExpand = true;
            TreeNode rootNode = new TreeNode
            {
                Text = "培训教材库",
                NodeID = "0",
                Expanded = true
            };
            this.trCompanyTraining.Nodes.Add(rootNode);
            BoundTree(rootNode.Nodes, "0");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nodes"></param>
        /// <param name="supCompanyTrainingId"></param>
        private void BoundTree(TreeNodeCollection nodes, string supCompanyTrainingId)
        {
            string projectName = "公司";
            List<Model.Training_CompanyTraining> getTrainings = new List<Model.Training_CompanyTraining>();
            if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
            {
                getTrainings = CompanyTrainingService.GetCompanyTrainingBySupItem(supCompanyTrainingId, this.CurrUser.LoginProjectId);
                
            }
            else
            {
                getTrainings = CompanyTrainingService.GetCompanyTrainingBySupItem(supCompanyTrainingId);
                if (this.rblType.SelectedValue == "0")
                {
                    getTrainings = getTrainings.Where(x => x.ProjectId == null).ToList();
                }
                else
                {
                    getTrainings = getTrainings.Where(x => x.ProjectId != null).ToList();
                }               
            }
                
            if (getTrainings.Count() > 0)
            {
                TreeNode tn = null;
                foreach (var dr in getTrainings)
                {
                    if (!string.IsNullOrEmpty(dr.ProjectId))
                    {
                        projectName = ProjectService.GetProjectNamesByProjectIds(dr.ProjectId);
                    }
                    tn = new TreeNode
                    {
                        Text = dr.CompanyTrainingName,
                        NodeID = dr.CompanyTrainingId,
                        EnableClickEvent = true,
                        ToolTip = projectName+"："+ dr.CompanyTrainingName,
                    };
                    nodes.Add(tn);
                    BoundTree(tn.Nodes, dr.CompanyTrainingId);
                }
            }
        }       
        #endregion

        #region 增加、修改、删除公司教材库类别
        /// <summary>
        /// 增加公司教材库类别
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (this.trCompanyTraining.SelectedNode != null)
            {
                Model.Training_CompanyTraining training = BLL.CompanyTrainingService.GetCompanyTrainingById(this.trCompanyTraining.SelectedNode.NodeID);
                if ((training != null && training.IsEndLever == false) || this.trCompanyTraining.SelectedNode.NodeID == "0")   //根节点或者非末级节点，可以增加
                {
                    PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("CompanyTrainingSave.aspx?SupCompanyTrainingId={0}", this.trCompanyTraining.SelectedNode.NodeID, "编辑 - ")));
                }
                else
                {
                    ShowNotify("选择的项已是末级！", MessageBoxIcon.Warning);
                }
            }
            else
            {
                ShowNotify("请选择树节点！", MessageBoxIcon.Warning);
            }
        }

        /// <summary>
        /// 修改公司教材库类别
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (this.trCompanyTraining.SelectedNode != null)
            {
                if (this.trCompanyTraining.SelectedNode.NodeID != "0")   //非根节点可以编辑
                {
                    PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("CompanyTrainingSave.aspx?CompanyTrainingId={0}", this.trCompanyTraining.SelectedNode.NodeID, "编辑 - ")));
                }
                else
                {
                    ShowNotify("根节点无法编辑！", MessageBoxIcon.Warning);
                }
            }
            else
            {
                ShowNotify("请选择树节点！", MessageBoxIcon.Warning);
            }
        }

        /// <summary>
        /// 删除公司教材库类别
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (this.trCompanyTraining.SelectedNode != null)
            {
                var q = BLL.CompanyTrainingService.GetCompanyTrainingById(this.trCompanyTraining.SelectedNode.NodeID);

                if (q != null && BLL.CompanyTrainingService.IsDeleteCompanyTraining(this.trCompanyTraining.SelectedNode.NodeID))
                {
                    BLL.CompanyTrainingService.DeleteCompanyTraining(this.trCompanyTraining.SelectedNode.NodeID);
                    InitTreeMenu();
                }
                else
                {
                    ShowNotify("存在下级菜单或已增加资源数据或者为内置项，不允许删除！", MessageBoxIcon.Warning);
                }
            }
            else
            {
                ShowNotify("请选择删除项！", MessageBoxIcon.Warning);
            }
        }
        #endregion

        #region 树点击事件
        /// <summary>
        /// 树点击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void trCompanyTraining_NodeCommand(object sender, FineUIPro.TreeCommandEventArgs e)
        {
            BindGrid();
        }
        #endregion

        #region 绑定数据
        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            if (this.trCompanyTraining.SelectedNode != null && !string.IsNullOrEmpty(this.trCompanyTraining.SelectedNode.NodeID))
            {
                string strSql = @"SELECT item.CompanyTrainingItemId,
                                         item.CompanyTrainingId,
                                         item.CompanyTrainingItemCode,
                                         item.CompanyTrainingItemName,
                                         item.AttachUrl,
                                         item.CompileMan,
                                         item.CompileDate "
                                + @" FROM dbo.Training_CompanyTrainingItem AS item "
                                + @" WHERE item.CompanyTrainingId=@CompanyTrainingId";

                List<SqlParameter> listStr = new List<SqlParameter>
                {
                    new SqlParameter("@CompanyTrainingId", this.trCompanyTraining.SelectedNode.NodeID)
                };
                if (!string.IsNullOrEmpty(this.txtCompanyTrainingItemCode.Text.Trim()))
                {
                    strSql += " AND CompanyTrainingItemCode LIKE @CompanyTrainingItemCode";
                    listStr.Add(new SqlParameter("@CompanyTrainingItemCode", "%" + this.txtCompanyTrainingItemCode.Text.Trim() + "%"));
                }
                if (!string.IsNullOrEmpty(this.txtCompanyTrainingItemName.Text.Trim()))
                {
                    strSql += " AND CompanyTrainingItemName LIKE @CompanyTrainingItemName";
                    listStr.Add(new SqlParameter("@CompanyTrainingItemName", "%" + this.txtCompanyTrainingItemName.Text.Trim() + "%"));
                }
                SqlParameter[] parameter = listStr.ToArray();
                DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);

                Grid1.RecordCount = tb.Rows.Count;
                tb = GetFilteredTable(Grid1.FilteredData, tb);
                var table = this.GetPagedDataTable(Grid1, tb);

                Grid1.DataSource = table;
                Grid1.DataBind();
            }
            else
            {
                Grid1.DataSource = null;
                Grid1.DataBind();
            }
        }
        #endregion

        #region 弹出窗关闭事件
        protected void Window1_Close(object sender, EventArgs e)
        {
            InitTreeMenu();
        }

        protected void Window2_Close(object sender, EventArgs e)
        {
            BindGrid();
        }
        #endregion        

        #region 排序、分页
        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            Grid1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid1.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            BindGrid();
        }

        protected void Grid1_Sort(object sender, FineUIPro.GridSortEventArgs e)
        {
            Grid1.SortDirection = e.SortDirection;
            Grid1.SortField = e.SortField;
            BindGrid();
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

        #region 增加、修改、删除明细信息
        #region 新增明细
        /// <summary>
        /// 新增明细
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewDetail_Click(object sender, EventArgs e)
        {
            if (this.trCompanyTraining.SelectedNode != null)
            {
                if (this.trCompanyTraining.SelectedNode.Nodes.Count == 0)
                {
                    PageContext.RegisterStartupScript(Window2.GetShowReference(String.Format("CompanyTrainingItemSave.aspx?CompanyTrainingId={0}", this.trCompanyTraining.SelectedNode.NodeID, "编辑 - ")));
                }
                else
                {
                    ShowNotify("请选择末级节点！", MessageBoxIcon.Warning);
                }
            }
            else
            {
                ShowNotify("请选择树节点！", MessageBoxIcon.Warning);
            }
        }
        #endregion

        #region 编辑明细
        protected void btnEditDetail_Click(object sender, EventArgs e)
        {
            this.EditData();
        }

        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            this.EditData();
        }

        /// <summary>
        /// 右键编辑事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuEdit_Click(object sender, EventArgs e)
        {
            this.EditData();
        }

        /// <summary>
        /// 编辑数据方法
        /// </summary>
        private void EditData()
        {
            if (Grid1.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请至少选择一条记录！", MessageBoxIcon.Warning);
                return;
            }

            string companyTrainingItemId = Grid1.SelectedRowID;

            PageContext.RegisterStartupScript(Window2.GetShowReference(String.Format("CompanyTrainingItemSave.aspx?CompanyTrainingItemId={0}", companyTrainingItemId, "编辑 - ")));
        }
        #endregion

        #region 删除明细
        // 删除数据
        protected void btnDeleteDetail_Click(object sender, EventArgs e)
        {
            this.DeleteData();
        }

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
                foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                {
                    string rowID = Grid1.DataKeys[rowIndex][0].ToString();
                    var getD = BLL.CompanyTrainingItemService.GetCompanyTrainingItemById(rowID);
                    if (getD != null)
                    {
                        BLL.LogService.AddSys_Log(this.CurrUser, getD.CompanyTrainingItemCode, getD.CompanyTrainingItemId, BLL.Const.CompanyTrainingMenuId, BLL.Const.BtnDelete);
                        BLL.CompanyTrainingItemService.DeleteCompanyTrainingItemById(rowID);
                        
                    }
                }

                BindGrid();
                ShowNotify("删除数据成功!");
            }
        }
        #endregion
        #endregion
                
        #region 按钮权限
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
            string menuId = BLL.Const.CompanyTrainingMenuId;
            if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
            {
                menuId = BLL.Const.ProjectCompanyTrainingMenuId;
            }

            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, menuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnAdd))
                {
                    this.btnNew.Hidden = false;
                    this.btnNewDetail.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnModify))
                {
                    this.btnEdit.Hidden = false;
                    this.btnEditDetail.Hidden = false;
                    this.btnMenuEdit.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnDelete))
                {
                    this.btnDelete.Hidden = false;
                    this.btnDeleteDetail.Hidden = false;
                    this.btnMenuDelete.Hidden = false;
                }         
            }
        }
        #endregion

        /// <summary>
        /// 导出
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnOut_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            string filename = Funs.GetNewFileName();
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("公司教材库" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Grid1.PageSize = Grid1.RecordCount;
            BindGrid();
            Response.Write(GetGridTableHtml(Grid1, 5));
            Response.End();
        }

        #region 导出方法
        /// <summary>
        /// 导出方法
        /// </summary>
        /// <param name="grid"></param>
        /// <returns></returns>
        public static string GetGridTableHtml(Grid grid, int count)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<meta http-equiv=\"content-type\" content=\"application/excel; charset=UTF-8\"/>");
            sb.Append("<table cellspacing=\"0\" rules=\"all\" border=\"1\" style=\"border-collapse:collapse;\">");
            sb.Append("<tr>");
            foreach (GridColumn column in grid.Columns)
            {
                if (column.ColumnIndex < count)
                {
                    sb.AppendFormat("<td>{0}</td>", column.HeaderText);
                }
            }
            sb.Append("</tr>");
            foreach (GridRow row in grid.Rows)
            {
                sb.Append("<tr>");
                foreach (GridColumn column in grid.Columns)
                {
                    if (column.ColumnIndex < count)
                    {
                        string html = row.Values[column.ColumnIndex].ToString();
                        if (column.ColumnID == "tfNumber" && (row.FindControl("lbNumber") as AspNet.Label) != null)
                        {
                            html = (row.FindControl("lbNumber") as AspNet.Label).Text;
                        }
                        if (column.ColumnID == "tfCompanyTrainingItemCode" && (row.FindControl("lbCompanyTrainingItemCode") as AspNet.Label) != null)
                        {
                            html = (row.FindControl("lbCompanyTrainingItemCode") as AspNet.Label).Text;
                        }
                        if (column.ColumnID == "tfCompanyTrainingItemName" && (row.FindControl("lbCompanyTrainingItemName") as AspNet.Label) != null)
                        {
                            html = (row.FindControl("lbCompanyTrainingItemName") as AspNet.Label).Text;
                        }
                        if (column.ColumnID == "tfCompileMan" && (row.FindControl("lbCompileMan") as AspNet.Label) != null)
                        {
                            html = (row.FindControl("lbCompileMan") as AspNet.Label).Text;
                        }
                        if (column.ColumnID == "tfCompileDate" && (row.FindControl("lbCompileDate") as AspNet.Label) != null)
                        {
                            html = (row.FindControl("lbCompileDate") as AspNet.Label).Text;
                        }
                        sb.AppendFormat("<td>{0}</td>", html);
                    }
                }

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            return sb.ToString();
        }
        #endregion

        protected void rblType_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitTreeMenu();
            BindGrid();
        }
    }
}