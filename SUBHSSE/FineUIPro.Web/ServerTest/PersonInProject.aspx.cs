using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace FineUIPro.Web.ServerTest
{
    public partial class PersonInProject : PageBase
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.btnClose.OnClientClick = ActiveWindow.GetHideReference();
                //项目
                ProjectService.InitProjectDropDownList(this.drpProject, false);
          
                this.txtChangeTime.Text = string.Format("{0:yyyy-MM-dd}", System.DateTime.Now);
                this.BindGrid();
            }
        }

        #region 人员下拉框绑定数据
        /// <summary>
        /// 绑定数据
        /// </summary>
        private void BindGrid()
        {
                string strSql = string.Empty;
                ///在场人员出场
                strSql = @"SELECT PersonId,CardNo,PersonName,IdentityCard"
                          + @" FROM SitePerson_Person WHERE ProjectId is null";
                List<SqlParameter> listStr = new List<SqlParameter>();               
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
                SqlParameter[] parameter = listStr.ToArray();
                DataTable tb = SQLHelper.GetDataTableRunText(strSql, parameter);
                Grid1.RecordCount = tb.Rows.Count;
                var table = this.GetPagedDataTable(Grid1, tb);
                Grid1.DataSource = table;
                Grid1.DataBind();
        }
        #endregion

        /// <summary>
        /// 保存按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string projectId = this.drpProject.SelectedValue;
            if (projectId != Const._Null)
            {
                foreach (var item in this.drpPerson.Values)
                {
                    var person = BLL.PersonService.GetPersonById(item);
                    if (person != null)
                    {
                        var getpUnit = Funs.DB.Project_ProjectUnit.FirstOrDefault(x => x.ProjectId == projectId && x.UnitId == person.UnitId);
                        if (getpUnit == null)
                        {
                            Model.Project_ProjectUnit newPUnit = new Model.Project_ProjectUnit
                            {
                                ProjectUnitId = BLL.SQLHelper.GetNewID(),
                                ProjectId = projectId,
                                UnitId = person.UnitId,
                            };
                            Funs.DB.Project_ProjectUnit.InsertOnSubmit(newPUnit);
                            Funs.DB.SubmitChanges();
                        }

                        person.InTime = Funs.GetNewDateTime(this.txtChangeTime.Text);
                        person.IsUsed = true;
                        person.ProjectId = projectId;
                        BLL.PersonService.UpdatePerson(person);
                    }
                }

                BLL.LogService.AddSys_Log(this.CurrUser, "人员批量进入项目", null, BLL.Const.PersonListMenuId, BLL.Const.BtnModify);
                PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
            }
            else
            {
                Alert.ShowInParent("请选择人员要进入的项目!", MessageBoxIcon.Warning);
            }
        }

        #region 查询
        /// <summary>
        /// 下拉框查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        #endregion
    }
}