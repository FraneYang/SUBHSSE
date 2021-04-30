﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactListView.aspx.cs"
    Inherits="FineUIPro.Web.Check.ContactListView" ValidateRequest="false" %>

<%@ Register Src="~/Controls/FlowOperateControl.ascx" TagName="FlowOperateControl"
    TagPrefix="uc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>编辑联系单</title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="SimpleForm1"/>
    <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false" Title="联系单" AutoScroll="true"
        BodyPadding="10px" runat="server" RedStarPosition="BeforeText" LabelAlign="Right">
        <Rows>
            <f:FormRow>
                <Items>
                    <f:TextBox ID="txtCode" runat="server" Label="编号" Required="true" ShowRedStar="true"
                        MaxLength="50">
                    </f:TextBox>
                    <f:TextBox ID="drpSponsorUnit" runat="server" Label="发起单位" LabelAlign="Right"
                        Readonly="true">
                    </f:TextBox>
                </Items>
            </f:FormRow>
             <f:FormRow>
                <Items>  
                    <f:TextBox ID="drpReceivingUnits" runat="server" Label="接收单位" LabelAlign="Right"
                        Readonly="true">
                    </f:TextBox>   
                </Items>
            </f:FormRow>   
            <f:FormRow>
                <Items>                   
                    <f:TextBox ID="txtCompileMan" runat="server" Label="整理人" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                     <f:TextBox ID="txtCompileDate" runat="server" Label="整理时间" LabelAlign="Right"
                        Readonly="true">
                    </f:TextBox>
                    
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                    <f:TextBox ID="txtRemark" runat="server" Label="摘要" LabelAlign="Right" Readonly="true">
                    </f:TextBox>   
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                    <f:HtmlEditor runat="server" Label="内容" ID="txtSeeFile" ShowLabel="false"
                        Editor="UMEditor" BasePath="~/res/umeditor/" ToolbarSet="Full" Height="260" LabelAlign="Right">
                    </f:HtmlEditor>
                </Items>
            </f:FormRow>          
        </Rows>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                <Items>
                    <f:Button ID="btnAttachUrl" Text="附件" ToolTip="附件查看" Icon="TableCell" runat="server"
                        OnClick="btnAttachUrl_Click" ValidateForms="SimpleForm1" MarginLeft="5px">
                    </f:Button>
                    <f:ToolbarFill runat="server">
                    </f:ToolbarFill>
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
