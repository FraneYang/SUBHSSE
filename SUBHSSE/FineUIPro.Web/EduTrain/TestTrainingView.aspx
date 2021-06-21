<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTrainingView.aspx.cs" Inherits="FineUIPro.Web.EduTrain.TestTrainingView" %>

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
                        <f:TextBox ID="txtSupTraining" runat="server" Label="上级类型" Readonly="true"></f:TextBox>
                    </Items>
                </f:FormRow>
                  <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtTrainingName" runat="server" Label="名称" Readonly="true" >
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtTrainingCode" runat="server" Label="编号" Readonly="true">
                        </f:TextBox>
                         <f:CheckBox ID="ckIsEndLever" runat="server" Label="是否末级" Checked="true" Readonly="true"></f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:GroupPanel ID="GroupPanel1" Layout="Anchor" Title="适用于" runat="server">
                            <Items>                               
                                <f:Form ID="Form2" ShowHeader="false" ShowBorder="false" runat="server">
                                    <Rows>
                                        <f:FormRow>
                                            <Items>
                                                <f:TextBox ID="txtCompany" runat="server" Label="公司" Readonly="true"></f:TextBox>
                                            </Items>
                                        </f:FormRow>
                                         <f:FormRow >
                                            <Items>
                                                <f:TextArea ID="txtUnit" runat="server" Label="单位" Readonly="true" Height="50px"></f:TextArea>
                                            </Items>
                                        </f:FormRow>
                                        <f:FormRow>
                                            <Items>
                                                <f:TextArea ID="txtProject" runat="server" Label="项目" Readonly="true" Height="120px"></f:TextArea>
                                            </Items>
                                        </f:FormRow>
                                    </Rows>
                                </f:Form>
                            </Items>
                        </f:GroupPanel>
                    </Items>
                </f:FormRow>
            </Rows>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:Button ID="btnClose" EnablePostBack="false" runat="server" Icon="SystemClose" MarginRight="10px">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>
    </form>
</body>
</html>
