using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BLL;

namespace FineUIPro.Web.ServerTest
{
    public partial class PersonUnitRefresh : PageBase
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
                //单位 -原
                BLL.UnitService.InitUnitDropDownList(this.drpUnitId, this.CurrUser.LoginProjectId, false);
               
                //单位 -目标
                BLL.UnitService.InitUnitDropDownList(this.drpToUnit, this.CurrUser.LoginProjectId, false);
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
            strSql = @"SELECT PersonId,CardNo,PersonName,IdentityCard FROM SitePerson_Person"
                   + @" WHERE  ProjectId is null ";
            List<SqlParameter> listStr = new List<SqlParameter>();
            if (!string.IsNullOrEmpty(this.drpUnitId.SelectedValue) && this.drpUnitId.SelectedValue != "0")
            {
                strSql += " AND UnitId = @UnitId";
                listStr.Add(new SqlParameter("@UnitId", this.drpUnitId.SelectedValue));
            }
            else
            {
                strSql += " AND UnitId IS NULL ";
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
            if (!string.IsNullOrEmpty(this.drpToUnit.SelectedValue))
            {
                foreach (var item in this.drpPerson.Values)
                {
                    var person = BLL.PersonService.GetPersonById(item);
                    if (person != null)
                    {
                        if (this.drpToUnit.SelectedValue == "0")//如果新单位选择其他，则置空该人员单位
                        {
                            person.UnitId = null;
                        }
                        else
                        {
                            person.UnitId = this.drpToUnit.SelectedValue;
                        }                    
                        BLL.PersonService.UpdatePerson(person);
                    }
                }

                BLL.LogService.AddSys_Log(this.CurrUser, "人员批量调整单位！", null, BLL.Const.PersonListMenuId, BLL.Const.BtnModify);
                PageContext.RegisterStartupScript(ActiveWindow.GetHideRefreshReference());
            }
            else
            {
                ShowNotify("请选择人员新单位！", MessageBoxIcon.Warning);
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
            this.drpPerson.Values = null;
            this.BindGrid();
        }
        #endregion
    }
}