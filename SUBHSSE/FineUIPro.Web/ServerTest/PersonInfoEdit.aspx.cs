using BLL;
using Newtonsoft.Json.Linq;
using System;
using System.Linq;

namespace FineUIPro.Web.ServerTest
{
    public partial class PersonInfoEdit : PageBase
    {
        #region 定义项
        /// <summary>
        /// 主键
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
        /// <summary>
        /// 二维码路径id
        /// </summary>
        public string QRCodeAttachUrl
        {
            get
            {
                return (string)ViewState["QRCodeAttachUrl"];
            }
            set
            {
                ViewState["QRCodeAttachUrl"] = value;
            }
        }
        /// <summary>
        /// 单位ID
        /// </summary>
        public string UnitId
        {
            get
            {
                return (string)ViewState["UnitId"];
            }
            set
            {
                ViewState["UnitId"] = value;
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
                btnClose.OnClientClick = ActiveWindow.GetHideReference();
                ////权限按钮方法
                this.GetButtonPower();
                this.UnitId = Request.Params["UnitId"];
                this.PersonId = Request.Params["PersonId"];
                this.InitDropDownList();

                if (!string.IsNullOrEmpty(this.PersonId))
                {
                    var person = BLL.PersonService.GetPersonById(this.PersonId);
                    if (person != null)
                    {                    
                        if (!string.IsNullOrEmpty(person.Sex))
                        {
                            this.rblSex.SelectedValue = person.Sex;
                        }
                        if (!string.IsNullOrEmpty(person.UnitId))
                        {
                            var unit = BLL.UnitService.GetUnitByUnitId(person.UnitId);
                            if (unit != null)
                            {
                                this.txtUnitName.Text = unit.UnitName;
                                this.UnitId = person.UnitId;
                            }
                        }
                        if (!string.IsNullOrEmpty(person.WorkPostId))
                        {
                            this.drpPost.SelectedValue = person.WorkPostId;
                        }
                        if (!string.IsNullOrEmpty(person.DepartId))
                        {
                            this.drpDepart.SelectedValue = person.DepartId;
                        }
                        if (!string.IsNullOrEmpty(person.PostTitleId))
                        {
                            this.drpTitle.SelectedValue = person.PostTitleId;
                        }
                        if (!string.IsNullOrEmpty(person.AuditorId))
                        {
                            this.drpAuditor.SelectedValue = person.AuditorId;
                        }                    
                        this.txtCardNo.Text = person.CardNo;
                        this.txtPersonName.Text = person.PersonName;
                        this.txtIdentityCard.Text = person.IdentityCard;
                        this.txtAddress.Text = person.Address;
                        this.txtTelephone.Text = person.Telephone;
                        if (person.IsForeign.HasValue)
                        {
                            this.ckIsForeign.Checked = person.IsForeign.Value;
                        }
                        if (person.IsOutside.HasValue)
                        {
                            this.ckIsOutside.Checked = person.IsOutside.Value;
                        }
                       
                        if (person.AuditorDate.HasValue)
                        {
                            this.txtAuditorDate.Text = string.Format("{0:yyyy-MM-dd}", person.AuditorDate);
                            this.drpAuditor.Readonly = true;
                            this.txtAuditorDate.Readonly = true;
                        }
                        imgPhoto.ImageUrl =  person.PhotoUrl;
                        if (!string.IsNullOrEmpty(person.Languages))
                        {
                            this.drpLanguages.SelectedValue = person.Languages;
                        }
                    }

                    var personQuality = BLL.PersonQualityService.GetPersonQualityByPersonId(this.PersonId);
                    if (personQuality != null)
                    {
                        this.drpCertificate.SelectedValue = personQuality.CertificateId;
                        this.txtCertificateCode.Text = personQuality.CertificateNo;
                        this.txtCertificateLimitTime.Text = string.Format("{0:yyyy-MM-dd}", personQuality.LimitDate);
                    }
                }
                else
                {
                    var unit = BLL.UnitService.GetUnitByUnitId(this.UnitId);
                    if (unit != null)
                    {
                        this.txtUnitName.Text = unit.UnitName;
                        this.txtCardNo.Text = string.Empty;
                    }
                }
            }
        }
        #endregion

        /// <summary>
        /// 初始化下拉框
        /// </summary>
        private void InitDropDownList()
        {
            WorkPostService.InitWorkPostDropDownList(this.drpPost, true);
            DepartService.InitDepartDropDownList(this.drpDepart, true);
            PostTitleService.InitPostTitleDropDownList(this.drpTitle, true);
            CertificateService.InitCertificateDropDownList(this.drpCertificate, true);

            string tunitId = CommonService.GetIsThisUnitId();
            UserService.InitFlowOperateControlUserDropDownList(this.drpAuditor,null, tunitId, true);
        }

        #region 保存
        /// <summary>
        /// 保存按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtPersonName.Text))
            {
                ShowNotify("人员姓名不能为空！", MessageBoxIcon.Warning);
                return;
            }
            if (string.IsNullOrEmpty(this.txtIdentityCard.Text))
            {
                ShowNotify("身份证/证件号不能为空！", MessageBoxIcon.Warning);
                return;
            }
     
            SaveData();
            PageContext.RegisterStartupScript(ActiveWindow.GetHidePostBackReference());
        }

        protected void SaveData()
       {
            Model.SitePerson_Person person = new Model.SitePerson_Person
            {
                Sex = this.rblSex.SelectedValue,
                Languages = this.drpLanguages.SelectedValue,
            };
            if (!string.IsNullOrEmpty(this.UnitId))
            {
                person.UnitId = this.UnitId;
            }
           
            if (this.drpPost.SelectedValue != BLL.Const._Null)
            {
                person.WorkPostId = this.drpPost.SelectedValue;
            }
            if (this.drpDepart.SelectedValue != BLL.Const._Null)
            {
                person.DepartId = this.drpDepart.SelectedValue;
            }
            if (this.drpTitle.SelectedValue != BLL.Const._Null)
            {
                person.PostTitleId = this.drpTitle.SelectedValue;
            }
            person.IsUsed = true;
            person.IsCardUsed = false;
            if (!string.IsNullOrEmpty(this.txtCardNo.Text.Trim()))
            {
                person.CardNo = this.txtCardNo.Text.Trim();
            }
            person.PersonName = this.txtPersonName.Text.Trim();

            if (!string.IsNullOrEmpty(this.txtIdentityCard.Text))
            {
                person.IdentityCard = this.txtIdentityCard.Text.Trim();
            }
            person.Address = this.txtAddress.Text.Trim();
            person.Telephone = this.txtTelephone.Text.Trim();
        
            if (!string.IsNullOrEmpty(imgPhoto.ImageUrl) && imgPhoto.ImageUrl != "~/res/images/blank_150.png")
            {
                person.PhotoUrl = imgPhoto.ImageUrl.Replace("../", "");
            }
            else
            {
                person.PhotoUrl = null;
            }

            if (!string.IsNullOrEmpty(this.txtAuditorDate.Text))
            {
                person.AuditorDate = Convert.ToDateTime(this.txtAuditorDate.Text);
            }
            if (this.drpAuditor.SelectedValue != BLL.Const._Null)
            {
                person.AuditorId = this.drpAuditor.SelectedValue;
            }
            person.IsForeign = this.ckIsForeign.Checked;
            person.IsOutside = this.ckIsOutside.Checked;
            if (string.IsNullOrEmpty(PersonId))
            {
                if (!string.IsNullOrEmpty(this.txtCardNo.Text.Trim()))
                {
                    int cardNoCount = BLL.PersonService.GetPersonCountByCardNo(null, this.txtCardNo.Text.Trim());

                    if (cardNoCount > 0)
                    {
                        ShowNotify("此卡号已存在，不能重复！", MessageBoxIcon.Warning);
                        return;
                    }
                }

                if (!string.IsNullOrEmpty(this.txtIdentityCard.Text))
                {
                    person.IdentityCard = this.txtIdentityCard.Text.Trim();
                    var identityCardCount = PersonService.GetPersonCountByIdentityCard(this.txtIdentityCard.Text.Trim(), this.CurrUser.LoginProjectId);
                    if (identityCardCount != null)
                    {
                        ShowNotify("此身份证号已存在，不能重复！", MessageBoxIcon.Warning);
                        return;
                    }
                }
                
                if (!BLL.PersonService.IsExistPersonByUnit(this.UnitId, this.txtPersonName.Text.Trim(), null))
                {
                    this.PersonId = SQLHelper.GetNewID(typeof(Model.SitePerson_Person));
                    person.PersonId = this.PersonId;
                    BLL.PersonService.AddPerson(person);
                }

                BLL.LogService.AddSys_Log(this.CurrUser, person.PersonName, person.PersonId, BLL.Const.PersonListMenuId, BLL.Const.BtnAdd);
            }
            else
            {
                var getPerson = BLL.PersonService.GetPersonById(PersonId);
                if (getPerson != null)
                { person.FromPersonId = getPerson.FromPersonId; }

                person.PersonId = PersonId;
                BLL.PersonService.UpdatePerson(person);
                BLL.LogService.AddSys_Log(this.CurrUser, person.PersonName, person.PersonId, BLL.Const.PersonListMenuId, BLL.Const.BtnModify);
            }

            if (!string.IsNullOrEmpty(person.PersonId))
            {
                ////更新特岗人员资质
                var personQuality = BLL.PersonQualityService.GetPersonQualityByPersonId(person.PersonId);
                if (personQuality != null)
                {
                    if (this.drpCertificate.SelectedValue != BLL.Const._Null)
                    {
                        personQuality.CertificateId = this.drpCertificate.SelectedValue;
                        personQuality.CertificateName = this.drpCertificate.SelectedItem.Text;
                    }
                    personQuality.CertificateNo = this.txtCertificateCode.Text.Trim();
                    personQuality.LimitDate = Funs.GetNewDateTime(this.txtCertificateLimitTime.Text);
                    personQuality.CompileMan = this.CurrUser.UserId;
                    personQuality.CompileDate = DateTime.Now;
                    BLL.PersonQualityService.UpdatePersonQuality(personQuality);
                }
                else
                {
                    Model.QualityAudit_PersonQuality newPersonQuality = new Model.QualityAudit_PersonQuality
                    {
                        PersonQualityId = SQLHelper.GetNewID(typeof(Model.QualityAudit_PersonQuality)),
                        PersonId = person.PersonId,
                        CompileMan = this.CurrUser.UserId,
                        CompileDate = DateTime.Now
                    };
                    if (this.drpCertificate.SelectedValue != BLL.Const._Null)
                    {
                        newPersonQuality.CertificateId = this.drpCertificate.SelectedValue;
                        newPersonQuality.CertificateName = this.drpCertificate.SelectedItem.Text;
                    }
                    newPersonQuality.CertificateNo = this.txtCertificateCode.Text.Trim();
                    newPersonQuality.LimitDate = Funs.GetNewDateTime(this.txtCertificateLimitTime.Text);
                    BLL.PersonQualityService.AddPersonQuality(newPersonQuality);
                }
            }
        }
        #endregion

        #region  上传照片
        /// <summary>
        /// 上传照片
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void filePhoto_FileSelected(object sender, EventArgs e)
        {
            if (filePhoto.HasFile)
            {
                string fileName = filePhoto.ShortFileName;
                if (!ValidateFileType(fileName))
                {
                    ShowNotify("无效的文件类型！");
                    return;
                }
                fileName = fileName.Replace(":", "_").Replace(" ", "_").Replace("\\", "_").Replace("/", "_");
                fileName = DateTime.Now.Ticks.ToString() + "_" + fileName;
                string url = "FileUpload/PersonBaseInfo/" + DateTime.Now.Year + "-" + DateTime.Now.Month + "/"
;                filePhoto.SaveAs(Server.MapPath(url + fileName));
                imgPhoto.ImageUrl = url + fileName;
                // 清空文件上传组件
                filePhoto.Reset();
            }
        }
        #endregion

        #region 验证身份证 卡号是否存在
        /// <summary>
        /// 验证身份证 卡号是否存在
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.txtCardNo.Text))
            {
                var q = Funs.DB.SitePerson_Person.FirstOrDefault(x => x.ProjectId == this.CurrUser.LoginProjectId && x.CardNo == this.txtCardNo.Text.Trim() && (x.PersonId != this.PersonId || (this.PersonId == null && x.PersonId != null)));
                if (q != null)
                {
                    ShowNotify("输入的卡号已存在！", MessageBoxIcon.Warning);
                }
            }

            if (!string.IsNullOrEmpty(this.txtIdentityCard.Text))
            {
                var q2 = Funs.DB.SitePerson_Person.FirstOrDefault(x => x.ProjectId == this.CurrUser.LoginProjectId && x.IdentityCard == this.txtIdentityCard.Text.Trim() && (x.PersonId != this.PersonId || (this.PersonId == null && x.PersonId != null)));
                if (q2 != null)
                {
                    ShowNotify("输入的身份证号码已存在！", MessageBoxIcon.Warning);
                }
            }
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
                if (buttonList.Contains(BLL.Const.BtnSave))
                {
                    this.btnSave.Hidden = false;
                    this.filePhoto.Hidden = false;
                    this.btnReadIdentityCard.Hidden = false;
                }                
            }
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnQR_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.txtIdentityCard.Text.Trim()))
            {
                Alert.ShowInTop("身份证号码不能为空！", MessageBoxIcon.Warning);
                return;
            }
            if (string.IsNullOrEmpty(this.txtPersonName.Text))
            {
                ShowNotify("人员姓名不能为空！", MessageBoxIcon.Warning);
                return;
            }            
          
            if (string.IsNullOrEmpty(this.PersonId))
            {
                this.SaveData();
            }
            string strCode = string.Empty;
            var unit = CommonService.GetIsThisUnit();
            if (unit != null && unit.UnitId == BLL.Const.UnitId_TCC_)
            {
                if (string.IsNullOrEmpty(this.txtCardNo.Text))
                {
                    ShowNotify("人员卡号不能为空！", MessageBoxIcon.Warning);
                    return;
                }
                strCode= "person$" + this.txtCardNo.Text.Trim();
            }
            else
            {
                strCode = "person$" + this.txtIdentityCard.Text.Trim();
            }

            PageContext.RegisterStartupScript(Window1.GetShowReference(String.Format("../Controls/SeeQRImage.aspx?PersonId={0}&strCode={1}", this.PersonId, strCode), "二维码查看", 400, 400));
        }

        #region 附件上传
        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAttachUrl1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.PersonId))
            {
                SaveData();
            }
            
            PageContext.RegisterStartupScript(WindowAtt.GetShowReference(String.Format("../AttachFile/webuploader.aspx?toKeyId={0}&path=FileUpload/IdCardAttachUrl&menuId={1}&strParam=1", this.PersonId, BLL.Const.ProjectPersonChangeMenuId)));
        }
        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAttachUrl2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.PersonId))
            {
                SaveData();
            }
            PageContext.RegisterStartupScript(WindowAtt.GetShowReference(String.Format("../AttachFile/webuploader.aspx?toKeyId={0}&path=FileUpload/PersonBaseInfo&menuId={1}&strParam=2", this.PersonId, BLL.Const.ProjectPersonChangeMenuId)));
        }
        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAttachUrl3_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.PersonId))
            {
                SaveData();
            }
            PageContext.RegisterStartupScript(WindowAtt.GetShowReference(String.Format("../AttachFile/webuploader.aspx?toKeyId={0}&path=FileUpload/PersonBaseInfo&menuId={1}&strParam=3", this.PersonId, BLL.Const.ProjectPersonChangeMenuId)));
        }
        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAttachUrl4_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.PersonId))
            {
                SaveData();
            }
            PageContext.RegisterStartupScript(WindowAtt.GetShowReference(String.Format("../AttachFile/webuploader.aspx?toKeyId={0}&path=FileUpload/PersonBaseInfo&menuId={1}&strParam=4", this.PersonId, BLL.Const.ProjectPersonChangeMenuId)));
        }
        #endregion

        protected void btnReadIdentityCard_Click(object sender, EventArgs e)
        {
            var getatt = Funs.DB.AttachFile.FirstOrDefault(x => x.ToKeyId == this.PersonId + "#1");
            if (getatt != null && !string.IsNullOrEmpty(getatt.AttachUrl))
            {             
                string url = Request.Url.Scheme + "://" + Request.Url.Host + ":" + Request.Url.Port+"/"+getatt.AttachUrl;
                string idInfo = APIIDCardInfoService.ReadIDCardInfo(url);
                if (!string.IsNullOrEmpty(idInfo))
                {
                    JObject obj = JObject.Parse(idInfo);
                    string errcode = obj["errcode"].ToString();
                    if (errcode == "0")
                    {
                        string name = obj["name"].ToString();
                        if (!string.IsNullOrEmpty(name))
                        {
                            this.txtPersonName.Text = name;
                        }
                        string id = obj["id"].ToString();
                        if (!string.IsNullOrEmpty(id))
                        {
                            this.txtIdentityCard.Text = id;
                        }
                        string addr = obj["addr"].ToString();
                        if (!string.IsNullOrEmpty(addr))
                        {
                            this.txtAddress.Text = addr;
                        }
                        string gender = obj["gender"].ToString();
                        if (!string.IsNullOrEmpty(gender))
                        {
                            this.rblSex.SelectedValue = gender == "女" ? "2" : "1";
                        }
                       // string nationality = obj["nationality"].ToString();
                    }
                }
            }
        }
    }
}