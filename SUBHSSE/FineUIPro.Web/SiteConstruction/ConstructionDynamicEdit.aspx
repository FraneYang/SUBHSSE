﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConstructionDynamicEdit.aspx.cs"
    Inherits="FineUIPro.Web.SiteConstruction.ConstructionDynamicEdit" ValidateRequest="false" %>

<%@ Register Src="~/Controls/FlowOperateControl.ascx" TagName="FlowOperateControl"
    TagPrefix="uc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑现场动态</title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="SimpleForm1"/>
    <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false" Title="现场动态" AutoScroll="true"
        BodyPadding="10px" runat="server" RedStarPosition="BeforeText" LabelAlign="Right">
        <Rows>
            <f:FormRow>
                <Items>                    
                   <f:DropDownList ID="drpUnit" runat="server" Label="单位" EmptyText="请选择单位"
                            EnableEdit="true" AutoPostBack="true" OnSelectedIndexChanged="TextBox_TextChanged">
                    </f:DropDownList>
                    <f:DatePicker ID="txtCompileDate" runat="server" Label="发布日期" LabelAlign="Right"  ShowRedStar="true" Required="true"
                        EnableEdit="true" AutoPostBack="true" OnTextChanged="TextBox_TextChanged">
                    </f:DatePicker>
                </Items>
            </f:FormRow>           
            <f:FormRow>
                <Items>
                    <f:TextArea ID="txtJobContent" runat="server" Label="工作内容" LabelAlign="Right" MaxLength="4000" Height="200px">
                    </f:TextArea>               
                </Items>
            </f:FormRow>
            <%--<f:FormRow>
                <Items>
                    <f:HtmlEditor runat="server" Label="制度内容" ID="txtSeeFile" ShowLabel="false"
                        Editor="UMEditor" BasePath="~/res/umeditor/" ToolbarSet="Full" Height="260" LabelAlign="Right">
                    </f:HtmlEditor>
                </Items>
            </f:FormRow>  --%>          
        </Rows>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                <Items>
                    <f:Button ID="btnAttachUrl" Text="附件" ToolTip="附件上传及查看" Icon="TableCell" runat="server"
                        OnClick="btnAttachUrl_Click" ValidateForms="SimpleForm1" MarginLeft="5px">
                    </f:Button>
                    <f:ToolbarFill runat="server">
                    </f:ToolbarFill>
                    <f:Button ID="btnSave" Icon="SystemSave" runat="server" ToolTip="保存" ValidateForms="SimpleForm1"
                        OnClick="btnSave_Click">
                    </f:Button>                    
                    <f:Button ID="btnClose" EnablePostBack="false" ToolTip="关闭" runat="server" Icon="SystemClose">
                    </f:Button>
                </Items>
            </f:Toolbar>
        </Toolbars>
    </f:Form>
    <f:Window ID="WindowAtt" Title="弹出窗体" Hidden="true" EnableIFrame="true" EnableMaximize="true"
        Target="Parent" EnableResize="true" runat="server" IsModal="true" Width="700px"
        Height="500px">
    </f:Window>
    </form>
</body>
</html>