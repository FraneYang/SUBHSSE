using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace FineUIPro.Web.EduTrain
{
    public partial class TestTraining : PageBase
    {
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
                this.GetButtonPower();
                this.InitTreeMenu();
            }
        }

        /// <summary>
        /// 初始化树
        /// </summary>
        private void InitTreeMenu()
        {
            tvTestTraining.Nodes.Clear();
            tvTestTraining.ShowBorder = false;
            tvTestTraining.ShowHeader = false;
            tvTestTraining.EnableIcons = true;
            tvTestTraining.AutoScroll = true;
            tvTestTraining.EnableSingleClickExpand = true;
            TreeNode rootNode = new TreeNode
            {
                Text = "考试试题库",
                NodeID = "0",
                Expanded = true
            };
            this.tvTestTraining.Nodes.Add(rootNode);
            BoundTree(rootNode.Nodes, rootNode.NodeID);
        }

        /// <summary>
        /// 绑定树
        /// </summary>
        /// <param name="nodes"></param>
        /// <param name="parentId"></param>
        private void BoundTree(TreeNodeCollection nodes, string parentId)
        {          
            List<Model.Training_TestTraining> getTests = new List<Model.Training_TestTraining>();
            if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
            {
                getTests = TestTrainingService.GetTestTrainingListBySupTrainingIdProjectId(parentId, this.CurrUser.LoginProjectId);
            }
            else
            {
                if (CommonService.GetIsThisUnit(this.CurrUser.UnitId) || this.CurrUser.UserId == Const.sysglyId || this.CurrUser.UserId == Const.hfnbdId)
                {
                    getTests = TestTrainingService.GetTestTrainingListBySupTrainingId(parentId);
                }
                else
                {
                    getTests = TestTrainingService.GetTestTrainingListBySupTrainingIdUnitId(parentId, this.CurrUser.UnitId);
                }
            }

            if (getTests.Count() > 0)
            {
                TreeNode tn = null;
                foreach (var dr in getTests)
                {
                    string pname = "适用于：";
                    if (!string.IsNullOrEmpty(dr.CompanyId))
                    {
                        pname += UnitService.GetUnitNameByUnitId(dr.CompanyId) +"</br>";
                    }
                    if (!string.IsNullOrEmpty(dr.UnitIds))
                    {
                        pname += UnitService.getUnitNamesUnitIds(dr.UnitIds) + "</br>";
                    }
                    if (!string.IsNullOrEmpty(dr.ProjectId))
                    {
                        pname += ProjectService.GetProjectNames2ByProjectIds(dr.ProjectId);
                    }
                    string name = dr.TrainingName;
                    if (!string.IsNullOrEmpty(dr.TrainingCode))
                    {
                        name = "[" + dr.TrainingCode + "]" + dr.TrainingName;
                    }
                    tn = new TreeNode
                    {
                        Text = name,
                        NodeID = dr.TrainingId,
                        EnableClickEvent = true,
                        ToolTip = pname,
                    };
                    nodes.Add(tn);
                    ///是否存在下级节点
                    var sup = Funs.DB.Training_TestTraining.FirstOrDefault(x => x.SupTrainingId == tn.NodeID);
                    if (sup != null)
                    {
                        BoundTree(tn.Nodes, tn.NodeID);
                    }
                }
            }

        }

        protected void btnMenuADD_Click(object sender, EventArgs e)
        {
            if (this.tvTestTraining.SelectedNode != null)
            {
                string id = this.tvTestTraining.SelectedNode.NodeID;
                var getT = TestTrainingService.GetTestTrainingById(this.tvTestTraining.SelectedNode.NodeID);
                if (id != "0" && (getT == null || getT.IsEndLever == true))
                {
                    ShowNotify("末节点不能再新增子节点！", MessageBoxIcon.Warning);
                    return;
                }
                else
                {
                    PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TestTrainingSave.aspx?SupTrainingId={0}", this.tvTestTraining.SelectedNode.NodeID, "新增 - ")));
                }
            }
            else
            {
                ShowNotify("请选择树节点！", MessageBoxIcon.Warning);
                return;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTreeMenuEdit_Click(object sender, EventArgs e)
        {
            if (this.tvTestTraining.SelectedNode != null)
            {
                string trainingId = this.tvTestTraining.SelectedNode.NodeID;
                if (trainingId != "0")   //非根节点可以编辑
                {
                    if (getPower(trainingId))
                    {
                        PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TestTrainingSave.aspx?TrainingId={0}", trainingId, "编辑 - ")));
                    }
                    else
                    {
                        PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TestTrainingView.aspx?TrainingId={0}", trainingId, "查看 - ")));
                    }
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

        protected void btnFind_Click(object sender, EventArgs e)
        {
            string trainingId = this.tvTestTraining.SelectedNode.NodeID;
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TestTrainingView.aspx?TrainingId={0}", trainingId, "查看 - ")));
        }

        /// <summary>
        /// 树节点删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTreeMenuDelete_Click(object sender, EventArgs e)
        {
            if (this.tvTestTraining.SelectedNode != null && this.tvTestTraining.SelectedNodeID != "0")
            {
                string trainingId = this.tvTestTraining.SelectedNode.NodeID;
                if (getPower(trainingId))
                {
                    var edu = Funs.DB.Training_TestTraining.FirstOrDefault(x => x.SupTrainingId == trainingId);
                    if (edu == null)
                    {
                        var getModelTestRecord = Funs.DB.Training_ModelTestRecordTraining.FirstOrDefault(x => x.TrainingId == trainingId);
                        if (getModelTestRecord != null)
                        {
                            var getModes = (from x in Funs.DB.Training_ModelTestRecordTraining
                                            join y in Funs.DB.Training_ModelTestRecord on x.ModelTestRecordId equals y.ModelTestRecordId
                                            where x.TrainingId == trainingId
                                            select y).Distinct();
                            string info = "模拟考试：";
                            foreach (var item in getModes)
                            {
                                if (!string.IsNullOrEmpty(item.ProjectId))
                                {
                                    info += ProjectService.GetProjectNameByProjectId(item.ProjectId) ?? "公司";
                                }
                                if (!string.IsNullOrEmpty(item.TestManId))
                                {
                                    info += "  姓名：" + PersonService.GetPersonNameById(item.TestManId);
                                }
                                if (item.TestStartTime.HasValue)
                                {
                                    info += "  时间：" + string.Format("{0:yyyy-MM-dd HH:mm}", item.TestStartTime);
                                }
                                info += "</br>";
                            }
                            Alert.ShowInTop(info + "已使用该类型！", MessageBoxIcon.Warning);
                            return;
                        }
                        var getTestPlanTraining = Funs.DB.Training_TestPlanTraining.FirstOrDefault(x => x.TrainingId == trainingId);
                        if (getTestPlanTraining != null)
                        {
                            var getTestPlans = (from x in Funs.DB.Training_TestPlanTraining
                                                join y in Funs.DB.Training_TestPlan on x.TestPlanId equals y.TestPlanId
                                                where x.TrainingId == trainingId
                                                select y).Distinct();
                            string info = "考试计划：";
                            foreach (var item in getTestPlans)
                            {
                                if (!string.IsNullOrEmpty(item.ProjectId))
                                {
                                    info += ProjectService.GetProjectNameByProjectId(item.ProjectId) ?? "公司";
                                }
                                if (!string.IsNullOrEmpty(item.PlanCode))
                                {
                                    info += "  编号：" + item.PlanCode;
                                }
                                if (item.PlanDate.HasValue)
                                {
                                    info += "  计划时间：" + string.Format("{0:yyyy-MM-dd HH:mm}", item.PlanDate);
                                }
                                info += "</br>";
                            }
                            Alert.ShowInTop(info + "已使用该类型！", MessageBoxIcon.Warning);
                            return;
                        }
                        else
                        {
                            BLL.TestTrainingService.DeleteTestTrainingById(trainingId);
                            InitTreeMenu();
                            Grid1.DataSource = null;
                            Grid1.DataBind();
                        }
                    }
                    else
                    {
                        ShowNotify("存在子目录，不能删除！", MessageBoxIcon.Warning);
                    }
                }
                else
                {
                    ShowNotify("您没有权限删除！", MessageBoxIcon.Warning);
                }
            }
            else
            {
                ShowNotify("请选择删除项！", MessageBoxIcon.Warning);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private bool getPower(string trainingId)
        {
            bool isOk = false;
            if (CommonService.IsMainUnitOrAdmin(this.CurrUser.UserId))
            {
                isOk = true;
            }
            else
            {
                var edu = Funs.DB.Training_TestTraining.FirstOrDefault(x => x.TrainingId == trainingId);
                if (string.IsNullOrEmpty(edu.CompanyId) && edu.UnitIds == this.CurrUser.UnitId)
                {
                    isOk = true;
                }
                else
                {
                    if (string.IsNullOrEmpty(edu.CompanyId) && string.IsNullOrEmpty(edu.UnitIds) && !string.IsNullOrEmpty(edu.ProjectId))
                    {
                        if (edu.ProjectId == this.CurrUser.LoginProjectId)
                        {
                            isOk = true;
                        }
                        else
                        {
                            var sp = Funs.GetStrListByStr(edu.ProjectId, ',');
                            var getpp = Funs.DB.Base_Project.FirstOrDefault(x => x.UnitId == this.CurrUser.UnitId && sp.Contains(x.ProjectId));
                            if (getpp != null)
                            {
                                isOk = true;
                            }
                        }
                    }
                }
            }

            return isOk;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void tvTestTraining_NodeCommand(object sender, FineUIPro.TreeCommandEventArgs e)
        {
            BindGrid();
        }

        #region BindGrid

        private void BindGrid()
        {
            if (this.tvTestTraining.SelectedNode != null && !string.IsNullOrEmpty(this.tvTestTraining.SelectedNode.NodeID))
            {
                string strSql = @"SELECT TrainingItemId,TrainingId,TrainingItemCode,TrainingItemName,Abstracts,AttachUrl,VersionNum,TestType "
                                + @" ,(CASE WHEN TestType = '1' THEN '单选题' WHEN TestType = '2' THEN '多选题' ELSE '判断题' END) AS TestTypeName "
                                + @" ,(CASE WHEN WorkPostNames IS NULL THEN '通用' ELSE WorkPostNames END) AS WorkPostNames,AItem,BItem,CItem,DItem,EItem,AnswerItems "
                                + @" FROM dbo.Training_TestTrainingItem"
                                + @" WHERE TrainingId=@TrainingId ";
                List<SqlParameter> listStr = new List<SqlParameter>
                {
                    new SqlParameter("@TrainingId", this.tvTestTraining.SelectedNode.NodeID)
                };
                if (!string.IsNullOrEmpty(this.txtName.Text.Trim()))
                {
                    strSql += " AND (TrainingItemCode LIKE @Name OR TrainingItemName LIKE @Name OR Abstracts LIKE @Name OR WorkPostNames LIKE @Name)";
                    listStr.Add(new SqlParameter("@Name", "%" + this.txtName.Text.Trim() + "%"));
                }
                if (this.drptype.SelectedValue != "0")
                {
                    strSql += " AND TestType=@TestType";
                    listStr.Add(new SqlParameter("@TestType", this.drptype.SelectedValue));
                }
                if (this.ckIsItem.Checked)
                {
                    strSql += " AND (AItem IS NULL OR BItem IS NULL OR AItem ='' OR BItem ='')";
                }

                SqlParameter[] parameter = listStr.ToArray();
                DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);
                Grid1.RecordCount = tb.Rows.Count;
                tb = GetFilteredTable(Grid1.FilteredData, tb);
                var table = this.GetPagedDataTable(Grid1, tb);
                Grid1.DataSource = table;
                Grid1.DataBind();
            }
        }
        #endregion

        #region Events
        protected void Window1_Close(object sender, EventArgs e)
        {
            this.InitTreeMenu();
        }

        protected void Window2_Close(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        protected void Window3_Close(object sender, EventArgs e)
        {
            this.InitTreeMenu();
            this.BindGrid();
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
                    var getD = BLL.TestTrainingItemService.GetTestTrainingItemById(rowID);
                    if (getD != null)
                    {
                        BLL.LogService.AddSys_Log(this.CurrUser, getD.TrainingItemCode, getD.TrainingItemId, BLL.Const.TestTrainingMenuId, BLL.Const.BtnDelete);
                        BLL.TestTrainingItemService.DeleteTestTrainingItemById(rowID);                      
                    }
                }

                BindGrid();
                ShowNotify("删除数据成功!");
            }
        }
        #endregion

        #region GV排序页面
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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

        /// <summary>
        /// 编辑试题
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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

            string trainingItemId = Grid1.SelectedRowID;

            PageContext.RegisterStartupScript(Window2.GetShowReference(String.Format("TestTrainingItemSave.aspx?TrainingItemId={0}", trainingItemId, "编辑 - ")));
        }

        /// <summary>
        ///  增加
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNewDetail_Click(object sender, EventArgs e)
        {            
            if (this.tvTestTraining.SelectedNode != null)
            {
                string id = this.tvTestTraining.SelectedNodeID;
                var testTrain = BLL.TestTrainingService.GetTestTrainingById(id);
                if (testTrain != null && testTrain.IsEndLever == true)
                {
                    PageContext.RegisterStartupScript(Window2.GetShowReference(String.Format("TestTrainingItemSave.aspx?TrainingId={0}", this.tvTestTraining.SelectedNode.NodeID, "编辑 - ")));
                }
                else
                {
                    ShowNotify("请选择末级树节点！", MessageBoxIcon.Warning);
                }
            }
            else
            {
                ShowNotify("请选择树节点！", MessageBoxIcon.Warning);
            }
        }

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
            string menuId = !string.IsNullOrEmpty(this.CurrUser.LoginProjectId) ? Const.ProjectTestTrainingMenuId : Const.TestTrainingMenuId;
            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, menuId);
            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnAdd))
                {
                    this.btnMenuADD.Hidden = false;
                    this.btnImport.Hidden = false;
                    this.btnNewDetail.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnModify))
                {
                    this.btnTreeMenuEdit.Hidden = false;
                    this.btnMenuEdit.Hidden = false;
                }
                if (buttonList.Contains(BLL.Const.BtnDelete))
                {
                    this.btnTreeMenuDelete.Hidden = false;
                    this.btnMenuDelete.Hidden = false;
                }
            }

            //if (this.CurrUser.UserId == BLL.Const.sysglyId)
            //{
            //    this.btnRefresh.Hidden = false;
            //    this.btnRefresh1.Hidden = false;
            //}
        }
        #endregion

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        #region 导入
        /// <summary>
        /// 导入按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnImport_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window3.GetShowReference(String.Format("TestTrainingItemIn.aspx", "导入 - ")));
        }
        #endregion

        #region 导出
        /// <summary>
        /// 导出按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuOut_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window3.GetShowReference(String.Format("TestTrainingOut.aspx", "导出 - ")));
        }
        /// <summary>
        /// 导出按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuOut1_Click(object sender, EventArgs e)
        {
            if (this.tvTestTraining.SelectedNode != null && this.tvTestTraining.SelectedNodeID != "0")
            {
                Response.ClearContent();
                string filename = Funs.GetNewFileName();
                Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("考试试题" + filename, System.Text.Encoding.UTF8) + ".xls");
                Response.ContentType = "application/excel";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                this.Grid1.PageSize = Grid1.RecordCount;
                BindGrid();
                Response.Write(GetGridTableHtml(Grid1));
                Response.End();
            }
            else
            {
                ShowNotify("请选择树节点！", MessageBoxIcon.Warning);
            }
        }

        #endregion

        #region 刷新装置
        /// <summary>
        /// 刷新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Refresh_Click(object sender, EventArgs e)
        {
            var trainingItems = from x in Funs.DB.Training_TestTrainingItem select x;
            if (trainingItems.Count() > 0)
            {
                foreach (var trainingItem in trainingItems)
                {
                    if (trainingItem.TestType == "3" && string.IsNullOrEmpty(trainingItem.AItem))
                    {
                        trainingItem.AItem = "对";
                        trainingItem.BItem = "错";
                    }

                    if (!string.IsNullOrEmpty(trainingItem.WorkPostIds))
                    {
                        string name = string.Empty;
                        var workPostList = Funs.GetStrListByStr(trainingItem.WorkPostIds, ',');
                        if (workPostList.Count() > 0)
                        {
                            foreach (var workPostId in workPostList)
                            {
                                var workPost = BLL.WorkPostService.GetWorkPostById(workPostId).WorkPostName;
                                if (!string.IsNullOrEmpty(workPost))
                                {
                                    name += workPost + ",";
                                }
                            }
                        }

                        if (!string.IsNullOrEmpty(name))
                        {
                            trainingItem.WorkPostNames = name.Substring(0, name.LastIndexOf(","));
                        }
                    }

                    BLL.TestTrainingItemService.UpdateTestTrainingItem(trainingItem);
                }
            }

            Alert.ShowInTop("操作完成！", MessageBoxIcon.Success);
        }

        /// <summary>
        /// 刷新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Refresh1_Click(object sender, EventArgs e)
        {
            var trainingItems = from x in Funs.DB.Training_TestTrainingItem select x;
            if (trainingItems.Count() > 0)
            {
                foreach (var trainingItem in trainingItems)
                {
                    if (trainingItem.TestType == "3" && string.IsNullOrEmpty(trainingItem.AItem))
                    {
                        trainingItem.AItem = "对";
                        trainingItem.BItem = "错";
                    }

                    if (!string.IsNullOrEmpty(trainingItem.WorkPostNames))
                    {
                        string getInstallationId = string.Empty;
                        var installList = Funs.GetStrListByStr(trainingItem.WorkPostNames, ',');
                        if (installList.Count() > 0)
                        {
                            foreach (var installItem in installList)
                            {
                                var install = Funs.DB.Base_WorkPost.FirstOrDefault(x => x.WorkPostName == installItem);
                                if (install != null && !string.IsNullOrEmpty(install.WorkPostId))
                                {
                                    getInstallationId += install.WorkPostId + ",";
                                }
                            }
                        }

                        if (!string.IsNullOrEmpty(getInstallationId))
                        {
                            trainingItem.WorkPostIds = getInstallationId.Substring(0, getInstallationId.LastIndexOf(","));
                        }
                    }

                    BLL.TestTrainingItemService.UpdateTestTrainingItem(trainingItem);
                }
            }

            Alert.ShowInTop("操作完成！", MessageBoxIcon.Success);
        }
        #endregion

        /// <summary>
        /// 显示选项不全的题目
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ckIsItem_CheckedChanged(object sender, CheckedEventArgs e)
        {
            this.BindGrid();
        }      
    }
}