using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using BLL;
using System.Linq;

namespace FineUIPro.Web.EduTrain
{
    public partial class TestRecord : PageBase
    {
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
                this.GetButtonPower();
                ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
                if (this.CurrUser.UserId == BLL.Const.sysglyId || this.CurrUser.UserId == BLL.Const.hfnbdId)
                {
                    this.btnMenuDelete.Hidden = false;
                }

                ///更新没有结束时间且超时的考试记录
                GetDataService.UpdateTestPlanStates();
                if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
                {
                    UnitService.InitUnitDropDownList(this.drpUnit, this.CurrUser.LoginProjectId, true);
                }
                else
                {
                    UnitService.InitBranchUnitDropDownList(this.drpUnit, CommonService.GetIsThisUnitId(), true);
                    DepartService.InitDepartDropDownList(this.drpDepart, true);
                    this.drpDepart.Hidden = false;
                }
                if (!CommonService.GetIsThisUnit(this.CurrUser.UnitId))
                {
                    this.drpUnit.SelectedValue = this.CurrUser.UnitId;
                    this.drpUnit.Readonly = true;
                }
                // 绑定表格
                BindGrid();
            }
            else
            {
                if (GetRequestEventArgument() == "reloadGrid")
                {
                    BindGrid();
                }
            }
        }
        #endregion

        #region 绑定数据
        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
            string strSql = @"SELECT TestRecord.TestRecordId,TestRecord.TestPlanId, TestRecord.TestManId,TestRecord.TestStartTime,TestRecord.TestEndTime, TestRecord.TestScores,
                            (CASE WHEN TestPlan.PlanName IS NULL THEN Training.TrainingName ELSE TestPlan.PlanName END) AS PlanName, 
                            ISNULL(TestPlan.Duration,90) AS Duration,ISNULL(TestPlan.TotalScore,100) AS TotalScore,TestPlan.TestPalce,ISNULL(TestPlan.QuestionCount,95) AS QuestionCount,TestRecord.TemporaryUser,Person.PersonName AS TestManName
                            ,Unit.UnitName,Depart.DepartId,Depart.DepartName"
                         + @" FROM dbo.Training_TestRecord AS TestRecord"
                         + @" LEFT JOIN dbo.Training_TestPlan AS TestPlan ON TestPlan.TestPlanId=TestRecord.TestPlanId"
                         + @" LEFT JOIN dbo.Training_TestTraining AS Training ON Training.TrainingId = TestRecord.TestType"
                         + @" LEFT JOIN dbo.SitePerson_Person AS Person ON Person.PersonId = TestRecord.TestManId "
                         + @" LEFT JOIN dbo.Base_Unit AS Unit ON Person.UnitId=Unit.UnitId"
                        + @" LEFT JOIN dbo.Base_Depart AS Depart ON Person.DepartId=Depart.DepartId"
                         + @" WHERE (isFiled IS NULL OR isFiled = 0) ";
            List<SqlParameter> listStr = new List<SqlParameter>();
            if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
            {
                strSql += " AND TestRecord.ProjectId =@ProjectId";
                listStr.Add(new SqlParameter("@ProjectId", this.CurrUser.LoginProjectId));
            }
            else
            {
                strSql += " AND TestRecord.ProjectId IS NULL";
            }
            if (!string.IsNullOrEmpty(this.drpUnit.SelectedValue) && this.drpUnit.SelectedValue != Const._Null)
            {
                strSql += " AND Person.UnitId = @UnitId";
                listStr.Add(new SqlParameter("@UnitId", this.drpUnit.SelectedValue));
            }
            if (!string.IsNullOrEmpty(this.drpDepart.SelectedValue) && this.drpDepart.SelectedValue != Const._Null)
            {
                strSql += " AND Person.DepartId = @DepartId";
                listStr.Add(new SqlParameter("@DepartId", this.drpDepart.SelectedValue));
            }
            if (!string.IsNullOrEmpty(this.txtName.Text.Trim()))
            {
                strSql += " AND (Person.PersonName LIKE @name OR TestPlan.PlanName LIKE @name OR Training.TrainingName LIKE @name)";
                listStr.Add(new SqlParameter("@name", "%" + this.txtName.Text.Trim() + "%"));
            }
            if (!string.IsNullOrEmpty(this.txtMinScores.Text.Trim()))
            {
                strSql += " AND TestRecord.TestScores >= @MinScores";
                listStr.Add(new SqlParameter("@MinScores", Funs.GetNewDecimalOrZero(this.txtMinScores.Text.Trim())));
            }
            if (!string.IsNullOrEmpty(this.txtMaxScores.Text.Trim()))
            {
                strSql += " AND TestRecord.TestScores <= @MaxScores";
                listStr.Add(new SqlParameter("@MaxScores", Funs.GetNewDecimalOrZero(this.txtMaxScores.Text.Trim())));
            }
            if (this.ckIsNULL.Checked)
            {
                strSql += " AND (TestRecord.TestStartTime IS NULL OR TestRecord.TestEndTime IS NULL) ";
            }
            if (!string.IsNullOrEmpty(this.txtStartDate.Text))
            {
                strSql += " AND TestRecord.TestStartTime >= @StartDate";
                listStr.Add(new SqlParameter("@StartDate", Funs.GetNewDateTime(this.txtStartDate.Text)));
            }
            if (!string.IsNullOrEmpty(this.txtEndDate.Text))
            {
                strSql += " AND TestRecord.TestEndTime <= @EndDate ";
                listStr.Add(new SqlParameter("@EndDate", Funs.GetNewDateTime(this.txtEndDate.Text)));
            }
            SqlParameter[] parameter = listStr.ToArray();
            DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);

            Grid1.RecordCount = tb.Rows.Count;
            tb = GetFilteredTable(Grid1.FilteredData, tb);
            var table = this.GetPagedDataTable(Grid1, tb);

            Grid1.DataSource = table;
            Grid1.DataBind();
        }
        #endregion

        #region 分页、关闭窗口
        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            Grid1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        /// <summary>
        /// 分页显示条数下拉框
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid1.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            BindGrid();
        }

        /// <summary>
        /// 排序
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_Sort(object sender, FineUIPro.GridSortEventArgs e)
        {
            Grid1.SortDirection = e.SortDirection;
            Grid1.SortField = e.SortField;
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

        /// <summary>
        /// 右键编辑事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuView_Click(object sender, EventArgs e)
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
                Alert.ShowInTop("请选择一条记录！", MessageBoxIcon.Warning);
                return;
            }
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TestRecordItem.aspx?TestRecordId={0}", Grid1.SelectedRowID, "编辑 - ")));
        }
        #endregion

        #region 归档
        /// <summary>
        /// 右键编辑事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuFile_Click(object sender, EventArgs e)
        {
            if (Grid1.SelectedRowIndexArray.Length > 0)
            {
                string values = string.Empty;
                foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                {
                    string rowID = Grid1.DataKeys[rowIndex][0].ToString();
                    values += rowID + "|";
                }

                if (!string.IsNullOrEmpty(values) && values.Length <= 1850)
                {
                    PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("../InformationProject/FileCabinetAChange.aspx?values={0}&menuId={1}", values, BLL.Const.ProjectTestRecordMenuId, "查看 - "), "归档", 600, 540));
                }
                else
                {
                    Alert.ShowInTop("请一次至少一条，最多50条记录归档！", MessageBoxIcon.Warning);
                }

                BindGrid();
            }
        }
        #endregion

        #region 查询事件
        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        protected void IsTemp_CheckedChanged(object sender, CheckedEventArgs e)
        {
            this.BindGrid();
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
                foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                {
                    string rowID = Grid1.DataKeys[rowIndex][0].ToString();
                    var getV = BLL.TestRecordService.GetTestRecordById(rowID);
                    if (getV != null)
                    {
                        BLL.LogService.AddSys_Log(this.CurrUser, "考试记录", rowID, BLL.Const.ProjectTestRecordMenuId, BLL.Const.BtnDelete);
                        BLL.TestRecordService.DeleteTestRecordByTestRecordId(rowID);
                    }
                }
                BindGrid();
                ShowNotify("删除数据成功!");
            }
        }
        #endregion

        #region 导出按钮
        /// <summary>
        /// 导出事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMenuOut_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            string filename = Funs.GetNewFileName();
            Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode("考试记录" + filename, System.Text.Encoding.UTF8) + ".xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Grid1.PageSize = Grid1.RecordCount;
            BindGrid();
            Response.Write(GetGridTableHtml(Grid1));
            Response.End();
        }
        #endregion

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            if (Grid1.SelectedRowIndexArray.Length == 0)
            {
                Alert.ShowInTop("请选择一条记录！", MessageBoxIcon.Warning);
                return;
            }
            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("TestRecordPrint.aspx?TestRecordId={0}", Grid1.SelectedRowID, "编辑 - "), "考试试卷", 900, 650));
        }

        #region 刷新试题分数
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="sender"></param>
        ///// <param name="e"></param>
        //protected void btnReset_Click(object sender, EventArgs e)
        //{
        //    var getTestRecords = from x in Funs.DB.Training_TestRecord
        //                        where x.ProjectId == this.CurrUser.LoginProjectId && x.TestPlanId== "16a3a51f-450f-48ba-a619-f5db8bc96261"
        //                        && x.TestScores > 100
        //                         select x;
        //    foreach (var item in getTestRecords)
        //    {
        //        List<string> getList = new List<string>();
        //        var getTestRecordItems = from x in Funs.DB.Training_TestRecordItem
        //                                 where x.TestRecordId == item.TestRecordId
        //                                 select x;
        //        if (getTestRecordItems.Count() > 100)
        //        {
        //            int haveCount = getTestRecordItems.Count() - 100;
        //            foreach (var itemI in getTestRecordItems)
        //            {
        //                var getDCodes = getTestRecordItems.Where(x => x.TrainingItemCode == itemI.TrainingItemCode);
        //                if (getDCodes.Count() > 1)
        //                {

        //                    if (itemI.SubjectScore.HasValue && itemI.SubjectScore > 0)
        //                    {
        //                        getList.Add(getDCodes.FirstOrDefault(x => x.TestRecordItemId != itemI.TestRecordItemId).TestRecordItemId);
        //                    }
        //                    else
        //                    {
        //                        getList.Add(itemI.TestRecordItemId);
        //                    }
        //                }
        //                if (getDCodes.Count() > haveCount)
        //                {
        //                    getDCodes = getDCodes.Take(haveCount);
        //                }

        //                foreach (var i in getDCodes)
        //                {
        //                    getTestRecordItems = getTestRecordItems.Where(x => x.TestRecordItemId != i.TestRecordItemId);
        //                }
        //            }
        //            if (getList.Count > 0)
        //            {
        //                var getDelItems = from x in Funs.DB.Training_TestRecordItem
        //                                  where getList.Contains(x.TestRecordItemId)
        //                                  select x;
        //                if (getDelItems.Count() > 0)
        //                {
        //                    Funs.DB.Training_TestRecordItem.DeleteAllOnSubmit(getDelItems);
        //                    Funs.DB.SubmitChanges();
        //                }
        //            }                  
        //        }


        //        if (item.TestScores.HasValue && item.TestScores > 0)
        //        {
        //            var getSum = Funs.DB.Training_TestRecordItem.Where(x => x.TestRecordId == item.TestRecordId).Sum(x => x.SubjectScore) ?? 0;
        //            item.TestScores = getSum;
        //            Funs.DB.SubmitChanges();
        //        }
        //    }

        //    Alert.ShowInTop("刷新完成！", MessageBoxIcon.Success);
        //}

        //protected void btnReset1_Click(object sender, EventArgs e)
        //{
        //    var getTestRecords = from x in Funs.DB.Training_TestRecord
        //                         where x.ProjectId == this.CurrUser.LoginProjectId && x.TestPlanId == "16a3a51f-450f-48ba-a619-f5db8bc96261"
        //                         select x;
        //    foreach (var item in getTestRecords)
        //    {
        //        var getTestRecordItems = from x in Funs.DB.Training_TestRecordItem
        //                                 where x.TestRecordId == item.TestRecordId
        //                                 select x;
        //        if (getTestRecordItems.Count() > 100)
        //        {
        //            var getD = getTestRecordItems.Where(x => x.SubjectScore == 0 || !x.SubjectScore.HasValue).Take(getTestRecordItems.Count() - 100);
        //            if (getD.Count() > 0)
        //            {
        //                Funs.DB.Training_TestRecordItem.DeleteAllOnSubmit(getD);
        //                Funs.DB.SubmitChanges();
        //            }
        //        }

        //        if (item.TestScores.HasValue && item.TestScores > 0)
        //        {
        //            var getSum = Funs.DB.Training_TestRecordItem.Where(x => x.TestRecordId == item.TestRecordId).Sum(x => x.SubjectScore) ?? 0;
        //            item.TestScores = getSum;
        //            Funs.DB.SubmitChanges();
        //        }
        //    }

        //    Alert.ShowInTop("刷新完成！", MessageBoxIcon.Success);
        //}
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnReTest_Click(object sender, EventArgs e)
        {
            if (Grid1.SelectedRowIndexArray.Length > 0)
            {
                string info = string.Empty;
                using (Model.SUBHSSEDB db = new Model.SUBHSSEDB(Funs.ConnString))
                {
                    foreach (int rowIndex in Grid1.SelectedRowIndexArray)
                    {
                        string testRecordId = Grid1.DataKeys[rowIndex][0].ToString();
                        var getRecord = db.Training_TestRecord.FirstOrDefault(x => x.TestRecordId == testRecordId);
                        if (getRecord != null)
                        {
                            var getPlan = db.Training_TestPlan.FirstOrDefault(x => x.TestPlanId == getRecord.TestPlanId);
                            if (getPlan != null && getPlan.TestStartTime < DateTime.Now && getPlan.TestEndTime > DateTime.Now)
                            {
                                var getTow = db.Training_TestRecord.FirstOrDefault(x => x.TestPlanId == getPlan.TestPlanId 
                                         && x.TestRecordId != testRecordId && x.TestManId ==getRecord.TestManId);
                                if (getTow != null)
                                {
                                    var getItems = from x in db.Training_TestRecordItem where x.TestRecordId == getTow.TestRecordId select x;
                                    if (getItems.Count() > 0)
                                    {
                                        db.Training_TestRecordItem.DeleteAllOnSubmit(getItems);
                                        db.SubmitChanges();
                                    }

                                    db.Training_TestRecord.DeleteOnSubmit(getTow);
                                    db.SubmitChanges();
                                }

                                var testRecordItem = from x in db.Training_TestRecordItem where x.TestRecordId == testRecordId select x;
                                if (testRecordItem.Count() > 0)
                                {
                                    db.Training_TestRecordItem.DeleteAllOnSubmit(testRecordItem);
                                    db.SubmitChanges();
                                }
                                getRecord.TestStartTime = null;
                                getRecord.TestEndTime = null;
                                getRecord.TestScores = null;
                                db.SubmitChanges();
                            }
                            else
                            {
                                info += getPlan.PlanCode + "考试扫描时间已结束。";
                            }
                        }
                    }
                    BindGrid();
                    if (!string.IsNullOrEmpty(info))
                    {
                        Alert.ShowInTop(info, MessageBoxIcon.Warning);
                        return;
                    }
                }
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
            string menuId = BLL.Const.ServerTestRecordMenuId;
            if (!string.IsNullOrEmpty(this.CurrUser.LoginProjectId))
            {
                menuId = BLL.Const.ProjectTestRecordMenuId;
            }
            var buttonList = BLL.CommonService.GetAllButtonList(this.CurrUser.LoginProjectId, this.CurrUser.UserId, menuId);

            if (buttonList.Count() > 0)
            {
                if (buttonList.Contains(BLL.Const.BtnSave))
                {
                    this.btnReTest.Hidden = false;
                }
            }
        }
        #endregion
    }
}