using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using BLL;
using Newtonsoft.Json.Linq;

namespace FineUIPro.Web.EduTrain
{
    public partial class TestPlanEdit : PageBase
    {
        #region 定义项
        /// <summary>
        /// 主键
        /// </summary>
        public string TestPlanId
        {
            get
            {
                return (string)ViewState["TestPlanId"];
            }
            set
            {
                ViewState["TestPlanId"] = value;
            }
        }
        /// <summary>
        /// 项目主键
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
        #endregion

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
                this.TestPlanId = Request.Params["TestPlanId"];
                this.ProjectId = this.CurrUser.LoginProjectId;

                TrainTypeService.InitTrainTypeDropDownList(this.drpTrainType, true);
                UnitService.InitUnitDropDownList(this.drpUnit, this.ProjectId, true);
                WorkPostService.InitWorkPostDropDownList(this.drpWorkPost, this.ProjectId, null, true);

                Model.Training_TestPlan getPlan = BLL.TestPlanService.GetTestPlanById(this.TestPlanId);
                if (getPlan != null)
                {
                    this.txtTestPlanCode.Text = getPlan.PlanCode;
                    this.txtPlanName.Text = getPlan.PlanName;
                    this.txtTestStartTime.Text = string.Format("{0:yyyy-MM-dd hh:mm:ss}", getPlan.TestStartTime);
                    this.txtTestEndTime.Text = string.Format("{0:yyyy-MM-dd hh:mm:ss}", getPlan.TestEndTime);
                    this.txtDuration.Text = getPlan.Duration.ToString();
                    this.txtTestPalce.Text = getPlan.TestPalce;
                    this.txtTotalScore.Text = getPlan.TotalScore.ToString();
                    this.txtQuestionCount.Text = getPlan.QuestionCount.ToString();
                    this.txtJValue.Text = getPlan.JValue.ToString();
                    this.txtMValue.Text = getPlan.MValue.ToString();
                    this.txtSValue.Text = getPlan.SValue.ToString();
                    this.txtPassingScore.Text = getPlan.PassingScore.ToString();
                    if (!string.IsNullOrEmpty(getPlan.TrainTypeId))
                    {
                        this.drpTrainType.SelectedValue = getPlan.TrainTypeId;
                    }
                    if (!string.IsNullOrEmpty(getPlan.UnitIds))
                    {
                        this.drpUnit.SelectedValueArray = getPlan.UnitIds.Split(',');
                    }
                    if (!string.IsNullOrEmpty(getPlan.WorkPostIds))
                    {
                        this.drpWorkPost.SelectedValueArray = getPlan.WorkPostIds.Split(',');
                    }
                    SetDrpMan();
                    var getTasks = Funs.DB.Training_TestRecord.Where(x => x.TestPlanId == getPlan.TestPlanId).Select(x => x.TestManId).ToArray();
                    if (getTasks.Count() > 0)
                    {
                        this.drpMan.SelectedValueArray = getTasks;
                    }
                }
                else
                {
                    this.TestPlanId = SQLHelper.GetNewID();
                    this.txtTestStartTime.Text = string.Format("{0:yyyy-MM-dd hh:mm:ss}", DateTime.Now);
                    this.txtTestEndTime.Text = string.Format("{0:yyyy-MM-dd hh:mm:ss}", DateTime.Now.AddDays(1));
                    this.txtDuration.Text = "90";
                    this.txtJValue.Text = "1";
                    this.txtMValue.Text = "2";
                    this.txtSValue.Text = "1";
                    this.txtPassingScore.Text = "60";
                    this.txtQuestionCount.Text = "0";
                    this.txtTotalScore.Text = "0";
                }

                this.BindGrid(APITestPlanService.getTestPlanTrainingListByTestPlanId(this.TestPlanId));
                this.InitTreeMenu();
            }
        }
        #endregion

        #region 绑定试题类型树
        /// <summary>
        /// 初始化树
        /// </summary>
        private void InitTreeMenu()
        {
            this.tvTestTraining.Nodes.Clear();
            List<Model.Training_TestTraining> getTestTrainings = new List<Model.Training_TestTraining>();
            if (!string.IsNullOrEmpty(this.ProjectId))
            {
                getTestTrainings = (from x in Funs.DB.Training_TestTraining where x.ProjectId.Contains(this.ProjectId) select x).ToList();
            }
            else
            {
                getTestTrainings = (from x in Funs.DB.Training_TestTraining where x.ProjectId == null || x.ProjectId ==""  select x).ToList();
            }
            if (getTestTrainings.Count() > 0)
            {
                var rootT = getTestTrainings.Where(x => x.SupTrainingId == "0").OrderBy(x => x.TrainingCode);
                foreach (var item in rootT)
                {
                    TreeNode rootNode = new TreeNode
                    {
                        Text = item.TrainingName,
                        NodeID = item.TrainingId,
                        Expanded = true
                    };

                    this.tvTestTraining.Nodes.Add(rootNode);
                    BoundTree(rootNode.Nodes, rootNode.NodeID, getTestTrainings.ToList());
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="nodes"></param>
        /// <param name="parentId"></param>
        private void BoundTree(TreeNodeCollection nodes, string parentId, List<Model.Training_TestTraining> getTestTrainings)
        {
            var dt = getTestTrainings.Where(x => x.SupTrainingId == parentId).OrderBy(x => x.TrainingCode);
            if (dt.Count() > 0)
            {
                TreeNode tn = null;
                foreach (var dr in dt)
                {
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
                        ToolTip = dr.TrainingName
                    };
                    nodes.Add(tn);
                    ///是否存在下级节点
                    var sup = Funs.DB.Training_TestTraining.FirstOrDefault(x => x.SupTrainingId == tn.NodeID);
                    if (sup != null)
                    {
                        BoundTree(tn.Nodes, tn.NodeID, getTestTrainings.ToList());
                    }
                }
            }
        }
        #endregion

        #region 绑定数据
        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid(List<Model.TestPlanTrainingItem> getTestPlanTrainingItem)
        {
            if (getTestPlanTrainingItem.Count() > 0)
            {
                DataTable tb = this.LINQToDataTable(getTestPlanTrainingItem);
                Grid1.RecordCount = tb.Rows.Count;
                Grid1.DataSource = this.GetPagedDataTable(Grid1, tb);
                Grid1.DataBind();
            }
            else
            {
                Grid1.DataSource = null;
                Grid1.DataBind();
            }
        }
        #endregion

        #region 数据保存
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SaveData(Const.BtnSubmit);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveData(Const.BtnSave);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="saveType"></param>
        protected void SaveData(string saveType)
        {
            if (this.drpTrainType.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择考试类型！");
                return;
            }
            if (this.drpUnit.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择培训单位！");
                return;
            }
            if (this.drpWorkPost.SelectedValue == Const._Null)
            {
                Alert.ShowInParent("请选择培训岗位！");
                return;
            }
            if (this.Grid1.RecordCount == 0)
            {
                Alert.ShowInParent("请选择试题类型！");
                return;
            }
            getTotalScore();
            Model.TestPlanItem newTestPlan = new Model.TestPlanItem
            {
                TestPlanId = this.TestPlanId,
                TestPlanCode = this.txtTestPlanCode.Text,
                TestPlanName = this.txtPlanName.Text.Trim(),
                TestPlanManId = this.CurrUser.UserId,
                TestStartTime = this.txtTestStartTime.Text,
                TestEndTime = this.txtTestEndTime.Text,
                Duration = Funs.GetNewIntOrZero(this.txtDuration.Text),
                SValue = Funs.GetNewIntOrZero(this.txtSValue.Text),
                MValue = Funs.GetNewIntOrZero(this.txtMValue.Text),
                JValue = Funs.GetNewIntOrZero(this.txtJValue.Text),
                TotalScore = Funs.GetNewIntOrZero(this.txtTotalScore.Text),
                QuestionCount = Funs.GetNewIntOrZero(this.txtQuestionCount.Text),
                TestPalce = this.txtTestPalce.Text,
                States = Const.State_0,
                PassingScore = Funs.GetNewIntOrZero(this.txtPassingScore.Text),
            };
            if (!string.IsNullOrEmpty(this.ProjectId))
            {
                newTestPlan.ProjectId = this.ProjectId;
            }
            if (saveType == Const.BtnSubmit)
            {
                newTestPlan.States = Const.State_1;
            }
            if (this.drpTrainType.SelectedValue != null)
            {
                newTestPlan.TrainTypeId = this.drpTrainType.SelectedValue;
                newTestPlan.TrainTypeName = this.drpTrainType.SelectedText;
            }
            if (this.drpUnit.SelectedValue != BLL.Const._Null)
            {
                newTestPlan.UnitIds = Funs.GetStringByArray(this.drpUnit.SelectedValueArray);
            }
            if (this.drpWorkPost.SelectedValue != BLL.Const._Null)
            {
                newTestPlan.WorkPostIds = Funs.GetStringByArray(this.drpWorkPost.SelectedValueArray);
                newTestPlan.WorkPostNames = this.drpWorkPost.SelectedText;
            }

            List<Model.TestRecordItem> TestRecordItems = new List<Model.TestRecordItem>();
            foreach (var item in this.drpMan.SelectedItemArray)
            {
                if (item.Value != Const._Null)
                {
                    Model.TestRecordItem newTestRecord = new Model.TestRecordItem()
                    {
                        ProjectId = this.ProjectId,
                        TestPlanId = this.TestPlanId,
                        TestManId = item.Value,
                        TestType = newTestPlan.TrainTypeName,
                        Duration = newTestPlan.Duration,
                    };
                    TestRecordItems.Add(newTestRecord);
                }
            }
            if (TestRecordItems.Count() > 0)
            {
                newTestPlan.TestRecordItems = TestRecordItems;
            }

            List<Model.TestPlanTrainingItem> TestPlanTrainingItems = new List<Model.TestPlanTrainingItem>();
            TestPlanTrainingItems = GetGridData();
            if (TestPlanTrainingItems.Count() > 0)
            {
                newTestPlan.TestPlanTrainingItems = TestPlanTrainingItems;
            }

            APITestPlanService.SaveTestPlan(newTestPlan);

            ShowNotify(saveType + "成功！", MessageBoxIcon.Success);
            PageContext.RegisterStartupScript(ActiveWindow.GetHideRefreshReference());
        }
        #endregion

        #region 下拉框事件
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpUnit.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpUnit.SelectedValueArray);
            SetDrpMan();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpWorkPost_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpWorkPost.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpWorkPost.SelectedValueArray);
            SetDrpMan();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpMan_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.drpMan.SelectedValueArray = Funs.RemoveDropDownListNull(this.drpMan.SelectedValueArray);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void drpTrainType_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetDrpMan();
            if (string.IsNullOrEmpty(this.txtPlanName.Text))
            {
                this.txtPlanName.Text = this.drpTrainType.SelectedText;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetDrpMan()
        {
            this.drpMan.Items.Clear();
            string unitId = Funs.GetStringByArray(this.drpUnit.SelectedValueArray);
            string workPostId = Funs.GetStringByArray(this.drpWorkPost.SelectedValueArray);
            if (!string.IsNullOrEmpty(unitId) && unitId != Const._Null && !string.IsNullOrEmpty(workPostId) && workPostId != Const._Null && this.drpTrainType.SelectedValue != Const._Null)
            {
                PersonService.InitTrainingPersonDropDownList(this.drpMan, this.ProjectId, unitId, workPostId, this.drpTrainType.SelectedValue, true);
            }
        }
        #endregion

        /// <summary>
        /// 收集Grid数据
        /// </summary>
        private List<Model.TestPlanTrainingItem> GetGridData()
        {
            List<Model.TestPlanTrainingItem> getTestPlanTrainingItem = new List<Model.TestPlanTrainingItem>();
            for (int i = 0; i < Grid1.Rows.Count; i++)
            {
                Model.TestPlanTrainingItem newItem = new Model.TestPlanTrainingItem
                {
                    TestPlanTrainingId = Grid1.Rows[i].DataKeys[0].ToString(),
                    TestPlanId = this.TestPlanId,
                    TrainingTypeId = Grid1.Rows[i].Values[5].ToString(),
                    TrainingTypeName = Grid1.Rows[i].Values[1].ToString(),
                    TestType1Count = Funs.GetNewIntOrZero(Grid1.Rows[i].Values[2].ToString()),
                    TestType2Count = Funs.GetNewIntOrZero(Grid1.Rows[i].Values[3].ToString()),
                    TestType3Count = Funs.GetNewIntOrZero(Grid1.Rows[i].Values[4].ToString())
                };
                getTestPlanTrainingItem.Add(newItem);
            }

            return getTestPlanTrainingItem;
        }

        #region GV事件
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGVAdd_Click(object sender, EventArgs e)
        {
            this.reSetTable();
            this.tr0.Hidden = false;
            this.tr1.Hidden = false;
        }

        /// <summary>
        /// 重置
        /// </summary>
        private void reSetTable()
        {
            this.drpTestTraining.Value = string.Empty;
            this.txtSCount.Text = string.Empty;
            this.txtMCount.Text = string.Empty;
            this.txtJCount.Text = string.Empty;
            this.lbTypeToop.Text = string.Empty;
            getTotalScore();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGVSave_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.drpTestTraining.Value) && !string.IsNullOrEmpty(this.txtSCount.Text)
                 && !string.IsNullOrEmpty(this.txtMCount.Text) && !string.IsNullOrEmpty(this.txtJCount.Text))
            {
                Model.TestPlanTrainingItem newItem = new Model.TestPlanTrainingItem
                {
                    TestPlanTrainingId = SQLHelper.GetNewID(),
                    TestPlanId = this.TestPlanId,
                    TrainingTypeId = this.drpTestTraining.Value,
                    TrainingTypeName = this.drpTestTraining.Text,
                    TestType1Count = Funs.GetNewIntOrZero(this.txtSCount.Text),
                    TestType2Count = Funs.GetNewIntOrZero(this.txtMCount.Text),
                    TestType3Count = Funs.GetNewIntOrZero(this.txtJCount.Text)
                };

                var getTestPlanTrainingItem = GetGridData();
                if (getTestPlanTrainingItem.FirstOrDefault(x => x.TrainingTypeId == newItem.TrainingTypeId) == null)
                {
                    getTestPlanTrainingItem.Add(newItem);
                    this.BindGrid(getTestPlanTrainingItem);
                    reSetTable();
                    this.tr0.Hidden = true;
                    this.tr1.Hidden = true;
                }
                else
                {
                    Alert.ShowInParent("此试题类型已勾选！", MessageBoxIcon.Warning);
                    return;
                }
            }
            else
            {
                Alert.ShowInParent("请勾选试题类型并填写题型数量！", MessageBoxIcon.Warning);
                return;
            }
        }       

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_RowDoubleClick(object sender, GridRowClickEventArgs e)
        {
            this.EditData();
        }
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
                Alert.ShowInParent("请至少选择一条记录！", MessageBoxIcon.Warning);
                return;
            }
            this.tr0.Hidden = false;
            this.tr1.Hidden = false;
            var getTrain = TestPlanTrainingService.GetTestPlanTrainingById(Grid1.SelectedRowID);
            if (getTrain != null)
            {
                this.drpTestTraining.Value = getTrain.TrainingId;
                this.txtSCount.Text = getTrain.TestType1Count.ToString();
                this.txtMCount.Text = getTrain.TestType2Count.ToString();
                this.txtJCount.Text = getTrain.TestType3Count.ToString();
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuDelete_Click(object sender, EventArgs e)
        {
            var getTestPlanTrainingItem = GetGridData();
            if (Grid1.SelectedRowIndexArray.Length > 0)
            {
                foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                {
                    string rowID = Grid1.DataKeys[rowIndex][0].ToString();
                    var getItem = getTestPlanTrainingItem.FirstOrDefault(x => x.TestPlanTrainingId == rowID);
                    if (getItem != null)
                    {
                        getTestPlanTrainingItem.Remove(getItem);
                    }
                }
            }
            this.BindGrid(getTestPlanTrainingItem);
            this.reSetTable();
            this.ShowNotify("删除数据成功!", MessageBoxIcon.Success);
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void getTotalScore_Blur(object sender, EventArgs e)
        {
            getTotalScore();
        }

        /// <summary>
        /// 
        /// </summary>
        private void getTotalScore()
        {
            int TotalScore = 0;
            int value1 = Funs.GetNewIntOrZero(this.txtSValue.Text);
            int value2 = Funs.GetNewIntOrZero(this.txtMValue.Text);
            int value3 = Funs.GetNewIntOrZero(this.txtJValue.Text);
            var getItem = GetGridData();
            if (getItem.Count() > 0)
            {
                int count1 = getItem.Sum(x => x.TestType1Count);
                int count2 = getItem.Sum(x => x.TestType2Count);
                int count3 = getItem.Sum(x => x.TestType3Count);
                this.txtQuestionCount.Text = (count1 + count2 + count3).ToString();
                TotalScore = count1 * value1 + count2 * value2 + count3 * value3;
            }
            this.txtTotalScore.Text = TotalScore.ToString();
            int passScore = Funs.GetNewIntOrZero(this.txtPassingScore.Text);
            if (passScore > TotalScore || passScore == 0)
            {
                this.txtPassingScore.Text = (Convert.ToUInt32(TotalScore * 1.0 * 0.6)).ToString();
            }
        }

        protected void drpTestTraining_TextChanged(object sender, EventArgs e)
        {
            this.lbTypeToop.Text = APIResourcesService.getTestTrainingCountByTrainingId(this.drpTestTraining.Value);
        }

        protected void SelectALL_U_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            foreach (var item in this.drpUnit.Items)
            {
                if (!string.IsNullOrEmpty(item.Value) && item.Value != Const._Null)
                {
                    if (string.IsNullOrEmpty(value))
                    {
                        value = item.Value;
                    }
                    else
                    {
                        value += "," + item.Value; ;
                    }
                }
            }
            if (!string.IsNullOrEmpty(value))
            {
                this.drpUnit.SelectedValueArray = value.Split(',');
            }
            SetDrpMan();
        }

        protected void SelectNoALL_U_Click(object sender, EventArgs e)
        {
            this.drpUnit.SelectedValueArray = null;
            SetDrpMan();
        }

        protected void SelectALL_W_Click(object sender, EventArgs e)
        {
            string value = string.Empty;
            foreach (var item in this.drpWorkPost.Items)
            {
                if (!string.IsNullOrEmpty(item.Value) && item.Value != Const._Null)
                {
                    if (string.IsNullOrEmpty(value))
                    {
                        value = item.Value;
                    }
                    else
                    {
                        value += "," + item.Value; ;
                    }
                }
            }
            if (!string.IsNullOrEmpty(value))
            {
                this.drpWorkPost.SelectedValueArray = value.Split(',');
            }
            SetDrpMan();
        }

        protected void SelectNoALL_W_Click(object sender, EventArgs e)
        {
            this.drpWorkPost.SelectedValueArray = null;
            SetDrpMan();
        }
    }
}