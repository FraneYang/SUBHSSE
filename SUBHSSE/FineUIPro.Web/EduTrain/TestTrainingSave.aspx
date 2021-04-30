﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTrainingSave.aspx.cs" Inherits="FineUIPro.Web.EduTrain.TestTrainingSave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
    <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false" AutoScroll="true"
        BodyPadding="10px" runat="server" RedStarPosition="BeforeText" LabelAlign="Right">
        <Rows>
            <f:FormRow>
                <Items>
                   <f:TextBox ID="txtSupTraining" runat="server" Label="上级" Required="true" ShowRedStar="true" MaxLength="50" AutoPostBack="true" OnTextChanged="TextBox_TextChanged"></f:TextBox>
                </Items>
            </f:FormRow>  
            <f:FormRow>
                <Items>
                   <f:TextBox ID="txtTrainingCode" runat="server" Label="编号" 
                       Required="true" ShowRedStar="true" FocusOnPageLoad="true" MaxLength="50"></f:TextBox>                    
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                   <f:TextBox ID="txtTrainingName" runat="server" Label="名称" Required="true" ShowRedStar="true" 
                       MaxLength="100" AutoPostBack="true" OnTextChanged="TextBox_TextChanged"></f:TextBox>
                </Items>
            </f:FormRow> 
             <f:FormRow>
                <Items>
                   <f:CheckBox ID="ckIsEndLever" runat="server" Label="末级" Checked="true"></f:CheckBox>
                </Items>
            </f:FormRow> 
            <f:FormRow ColumnWidths="86% 7% 7%">
                <Items>
                    <f:DropDownList ID="drpProject" Label="项目" runat="server" EnableEdit="true" EnableMultiSelect="true"
                        AutoPostBack="true" OnSelectedIndexChanged="drpProject_SelectedIndexChanged" EnableCheckBoxSelect="true">
                    </f:DropDownList>
                     <f:Button ID="SelectALL" runat="server" Text="全选" OnClick="SelectALL_Click"></f:Button>
                    <f:Button ID="SelectNoALL" runat="server" Text="全不选" 
                        OnClick="SelectNoALL_Click"></f:Button>
                </Items>
            </f:FormRow>
        </Rows>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                <Items>
                    <f:Button ID="btnSave" Icon="SystemSave" runat="server"  ValidateForms="SimpleForm1"
                        OnClick="btnSave_Click" Hidden="true">
                    </f:Button>
                    <f:Button ID="btnClose" EnablePostBack="false" runat="server" Icon="SystemClose" MarginRight="10px">
                    </f:Button>
                </Items>
            </f:Toolbar>
        </Toolbars>
    </f:Form>
    </form>
</body>
</html>
