<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanView.aspx.cs" Inherits="FineUIPro.Web.EduTrain.PlanView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑培训计划</title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
    <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false" AutoScroll="true"
        Layout="VBox" BodyPadding="10px" runat="server" RedStarPosition="BeforeText"
        LabelAlign="Right">
        <Rows>
            <f:FormRow>
                <Items>
                    <f:TextBox ID="txtPlanCode" runat="server" Label="编号" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                    <f:TextBox ID="txtPlanName" runat="server" Label="名称" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                    <f:TextBox ID="txtDesignerName" runat="server" Label="制定人" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                    <f:TextBox ID="txtDesignerDate" runat="server" Label="制定时间" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                </Items>
            </f:FormRow>  
            <f:FormRow>
                <Items>
                     <f:TextBox ID="txtTrainType" runat="server" Label="培训类型" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                    <f:TextBox ID="txtTrainLevel" runat="server" Label="培训级别" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                      </Items>
            </f:FormRow>
              <f:FormRow>
                <Items>
                     <f:TextBox ID="txtTrainStartDate" runat="server" Label="培训时间" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                    <f:TextBox ID="txtTeachHour" runat="server" Label="学时" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                      </Items>
            </f:FormRow>
             <f:FormRow>
                <Items>
                <f:TextArea ID="txtTrainContent" runat="server" Label="培训内容" LabelAlign="Right" 
                    MaxLength="500" Height="64px" Readonly="true">
                    </f:TextArea>
                </Items>
            </f:FormRow>
              <f:FormRow>
                <Items>
                   <f:TextArea ID="txtUnitName" runat="server" Label="培训单位" LabelAlign="Right" Readonly="true" Height="64px">
                    </f:TextArea>
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                   <f:TextBox ID="txtWorkPostNames" runat="server" Label="培训岗位" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                </Items>
            </f:FormRow>
              <f:FormRow>
                <Items>
                     <f:TextBox ID="txtTeachMan" runat="server" Label="授课人" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                       <f:TextBox ID="txtTeachAddress" runat="server" Label="授课地点" LabelAlign="Right" Readonly="true">
                    </f:TextBox>
                      </Items>
            </f:FormRow>
             <f:FormRow>
                <Items>
                    <f:TextArea runat="server" ID="txtMans" Label="培训人员" Readonly="true" Height="64px"></f:TextArea>
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                    <f:TextArea runat="server" ID="txtTrainingEdu" Label="教材类型" Readonly="true" Height="64px"></f:TextArea>
                </Items>
            </f:FormRow>
        </Rows>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                <Items>
                    <f:ToolbarFill ID="ToolbarFill1" runat="server">
                    </f:ToolbarFill>                   
                    <f:Button ID="btnClose" EnablePostBack="false" ToolTip="关闭" runat="server" Icon="SystemClose">
                    </f:Button>
                </Items>
            </f:Toolbar>
        </Toolbars>
    </f:Form>  
    </form>
    <script type="text/javascript">
        // 返回false，来阻止浏览器右键菜单
        function onRowContextMenu(event, rowId) {
            //  F(menuID).show();  //showAt(event.pageX, event.pageY);
            return false;
        }
    </script>
</body>
</html>
