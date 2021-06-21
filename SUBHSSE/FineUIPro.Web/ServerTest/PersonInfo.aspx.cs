using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using AspNet = System.Web.UI.WebControls;

namespace FineUIPro.Web.ServerTest
{
    public partial class PersonInfo : PageBase
    {
        #region 定义项
        /// <summary>
        /// 人员主键
        /// </summary>
        public string PersonId
        {
            get
            {
                return (string)ViewState["PersonId"];
            }
            set
            {
                ViewState["PersonId"] = value;
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
                Funs.DropDownPageSize(this.ddlPageSize);
                ////权限按钮方法
                this.GetButtonPower();
                this.btnMenuDelete.OnClientClick = Grid1.GetNoSelectionAlertReference("请至少选择一项！");
                this.btnMenuDelete.ConfirmText = String.Format("你确定要删除选中的&nbsp;<b><script>{0}</script></b>&nbsp;行数据吗？", Grid1.GetSelectedCountReference());
                this.ddlPageSize.SelectedValue = this.Grid1.PageSize.ToString();
                BLL.WorkPostService.InitWorkPostDropDownList(this.drpPost, true);
                this.InitTreeMenu();//加载树
            }
        }

        /// <summary>
        /// 加载树
        /// </summary>
        private void InitTreeMenu()
        {
            this.tvProjectAndUnit.Nodes.Clear();
            var thisUnit = CommonService.GetIsThisUnit();
            if (thisUnit != null)
            {
                var personLists = BLL.PersonService.GetPersonLitsByprojectIdUnitId(null, thisUnit.UnitId);
                TreeNode rootNode = new TreeNode();
                rootNode = new TreeNode
                {
                    Text = thisUnit.UnitName,
                    NodeID = thisUnit.UnitId,
                    ToolTip = thisUnit.UnitName + "人员数量：" + personLists.Count(),
                };
                rootNode.EnableClickEvent = true;
                this.tvProjectAndUnit.Nodes.Add(rootNode);
                var getDeparts = DepartService.GetDepartList();
                foreach (var item in getDeparts)
                {
                    var depLists = personLists.Where(x => x.DepartId == item.DepartId);
                    TreeNode drootNode = new TreeNode();
                   drootNode = new TreeNode
                    {
                        Text = item.DepartName,
                        NodeID = thisUnit.UnitId+"#"+item.DepartId,
                        ToolTip = item.DepartName + "人员数量：" + depLists.Count(),
                    };
                    drootNode.EnableClickEvent = true;
                    rootNode.Nodes.Add(drootNode);
                }

                var getSubUnit = from x in Funs.DB.Base_Unit where x.SupUnitId == thisUnit.UnitId select x;
                foreach (var item in getSubUnit)
                {
                    var spersonLists = BLL.PersonService.GetPersonLitsByprojectIdUnitId(null, item.UnitId);
                    TreeNode crootNode = new TreeNode();
                    crootNode = new TreeNode
                    {
                        Text = item.UnitName,
                        NodeID = item.UnitId,
                        ToolTip = item.UnitName + "人员数量：" + spersonLists.Count(),
                    };
                    crootNode.EnableClickEvent = true;
                    this.tvProjectAndUnit.Nodes.Add(crootNode);
                }
            }
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            if (this.tvProjectAndUnit != null && !string.IsNullOrEmpty(this.tvProjectAndUnit.SelectedNodeID))
            {
                string unitId = this.tvProjectAndUnit.SelectedNodeID;
                string departId = string.Empty;
                List<string> strId = Funs.GetStrListByStr(this.tvProjectAndUnit.SelectedNodeID, '#');
                if (strId.Count() > 1)
                {
                    unitId = strId[0];
                    departId = strId[1];
                }
                string strSql = "select * from View_SitePerson_Person Where ProjectId IS NULL  AND UnitId =@UnitId";
                List<SqlParameter> listStr = new List<SqlParameter>
                {
                    new SqlParameter("@UnitId", unitId)
                };
                if (!string.IsNullOrEmpty(departId))
                {
                    strSql += " AND DepartId = @DepartId";
                    listStr.Add(new SqlParameter("@DepartId", departId));
                }
                if (!string.IsNullOrEmpty(this.txtPersonName.Text.Trim()))
                {
                    strSql += " AND PersonName LIKE @PersonName";
                    listStr.Add(new SqlParameter("@PersonName", "%" + this.txtPersonName.Text.Trim() + "%"));
                }
                if (!string.IsNullOrEmpty(this.txtIdentityCard.Text.Trim()))
                {
                    strSql += " AND IdentityCard LIKE @IdentityCard";
                    listStr.Add(new SqlParameter("@IdentityCard", "%" + this.txtIdentityCard.Text.Trim() + "%"));
                }
                if (this.drpPost.SelectedItemArray.Count() > 1 || (this.drpPost.SelectedValue != BLL.Const._Null && this.drpPost.SelectedItemArray.Count() == 1))
                {
                    strSql += " AND (1=2 ";
                    int i = 0;
                    foreach (var item in this.drpPost.SelectedValueArray)
                    {                            
                        if (!string.IsNullOrEmpty(item) && item != BLL.Const._Null)
                        {
                            strSql += " OR WorkPostId = @WorkPostId" + i.ToString();
                            listStr.Add(new SqlParameter("@WorkPostId" + i.ToString(), item));
                        }
                        i++;
                    }
                    strSql += ")";
                }
                if (this.ckTrain.Checked)
                {
                    strSql += " AND TrainCount =0";
                }

                SqlParameter[] parameter = listStr.ToArray();
                DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);

                Grid1.RecordCount = tb.Rows.Count;
                //tb = GetFilteredTable(Grid1.FilteredData, tb);
                var table = this.GetPagedDataTable(Grid1, tb);
                Grid1.DataSource = table;
                Grid1.DataBind();             
            }
        }
        #endregion

        #region 点击TreeView
        /// <summary>
        /// 点击TreeView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void tvProjectAndUnit_NodeCommand(object sender, TreeCommandEventArgs e)
        {
            BindGrid();
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
            Grid1.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            BindGrid();
        }
        #endregion

        #region 增加按钮
        /// <summary>
        /// 增加按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.tvProjectAndUnit.SelectedNodeID))
            {
                string unitId = this.tvProjectAndUnit.SelectedNodeID;
                string departId = string.Empty;
                List<string> strId = Funs.GetStrListByStr(this.tvProjectAndUnit.SelectedNodeID, '#');
                if (strId.Count() > 1)
                {
                    unitId = strId[0];
                    departId = strId[1];
                }
                PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("PersonInfoEdit.aspx?UnitId={0}", this.tvProjectAndUnit.SelectedNodeID, "编辑 - ")));
            }
            else
            {
                Alert.ShowInParent("请选择单位！", MessageBoxIcon.Warning);
                return;
            }
        }
        #endregion

        #region 编辑
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
        /// 编辑
        /// </summary>
        private void EditData()
        {
            if (Grid1.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请至少选择一条记录！", MessageBoxIcon.Warning);
                return;
            }
            
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("PersonInfoEdit.aspx?PersonId={0}", Grid1.SelectedRowID, "编辑 - ")));
        }

        /// <summary>
        /// Grid双击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            this.EditData();
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
                int i = 0;
                foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                {
                    string rowID = Grid1.DataKeys[rowIndex][0].ToString();
                    if (this.judgementDelete(rowID, isShow))
                    {
                        i++;
                        var getV = BLL.PersonService.GetPersonById(rowID);
                        if (getV != null)
                        {
                            BLL.LogService.AddSys_Log(this.CurrUser, getV.PersonName, getV.PersonId, BLL.Const.PersonListMenuId, BLL.Const.BtnDelete);
                            BLL.PersonService.DeletePerson(rowID);
                        }
                    }
                }
                BindGrid();
                if (i > 0)
                {
                    ShowNotify("删除数据成功!（表格数据已重新绑定）", MessageBoxIcon.Success);
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
            var q = from x in Funs.DB.Check_ViolationPerson where x.PersonId == rowID select x;
            if (q.Count() > 0)
            {
                content += "违规人员记录中已存在该人员，无法删除！";
            }
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

        #region 关闭弹出窗口
        /// <summary>
        /// 关闭弹出窗口
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            BindGrid();
        }
        #endregion

        #region 判断按钮权限
        /// <summary>
        /// 判断按钮权限
        /// </summary>
        private void GetButtonPower()
        {
            if (Request.Params["value"] == "0")
            {
                return;
            }
            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, BLL.Const.ServerPersonInfoMenuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnAdd))
                {
                    this.btnNew.Hidden = false;
                    this.btnImport.Hidden = false;
                    this.btnPersonOut.Hidden = false;
                    this.btnPersonUnit.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnModify))
                {
                    this.btnMenuEdit.Hidden = false;
                    this.btnPersonUnit.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnDelete))
                {
                    this.btnMenuDelete.Hidden = false;
                }
            }
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
            PageContext.RegisterStartupScript(Window2.GetShowReference(String.Format("PersonIn.aspx", "导入 - ")));
        }

        /// <summary>
        /// 关闭导入弹出窗口
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Window2_Close(object sender, WindowCloseEventArgs e)
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
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("人员信息" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            //this.Grid1.PageSize = this.;
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
                        html = (row.FindControl("labNumber") as AspNet.Label).Text;
                    }
                    if (column.ColumnID == "tfI")
                    {
                        html = (row.FindControl("lbI") as AspNet.Label).Text;                        
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

        #region 批量出场
        /// <summary>
        /// 批量出场按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPersonOut_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window3.GetShowReference(String.Format("PersonInProject.aspx",  "批量进入项目 - ")));
        }    
        
        /// <summary>
        /// 关闭导入弹出窗口
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Window3_Close(object sender, WindowCloseEventArgs e)
        {
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
                    
        /// <summary>
        /// 批量生成二维码
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnQR_Click(object sender, EventArgs e)
        {
            var getPersons = from x in Funs.DB.SitePerson_Person
                             where x.ProjectId == null && x.IdentityCard != null && x.QRCodeAttachUrl == null
                             select x;
            int num = 0;
            if (getPersons.Count() > 0)
            {
                foreach (var item in getPersons)
                {
                    string url =  CreateQRCodeService.CreateCode_Simple("person$" + item.IdentityCard);
                    if (!string.IsNullOrEmpty(url))
                    {
                        item.QRCodeAttachUrl = url;
                        Funs.DB.SubmitChanges();
                        num++;
                    }
                }
            }
            ShowNotify("操作完成，新生成二维码"+ num.ToString()+"条", MessageBoxIcon.Success);
        }

        /// <summary>
        /// 批量单位转换
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPersonUnit_Click(object sender, EventArgs e)
        {
            if (BLL.CommonService.IsMainUnitOrAdmin(this.CurrUser.UserId))
            {
                PageContext.RegisterStartupScript(Window3.GetShowReference(String.Format("PersonUnitRefresh.aspx", "批量单位转换 - ")));
            }
            else
            {
                ShowNotify("非软件管理单位用户，不能调整人员单位!", MessageBoxIcon.Warning);
            }
        }
    }
}