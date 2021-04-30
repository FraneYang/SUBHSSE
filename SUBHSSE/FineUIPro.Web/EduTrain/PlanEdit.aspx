<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanEdit.aspx.cs" Inherits="FineUIPro.Web.EduTrain.PlanEdit" %>

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
                    <f:TextBox ID="txtPlanCode" runat="server" Label="编号" LabelAlign="Right" MaxLength="50" FocusOnPageLoad="true">
                    </f:TextBox>
                    <f:TextBox ID="txtPlanName" runat="server" Label="名称" LabelAlign="Right" MaxLength="300">
                    </f:TextBox>
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                    <f:DropDownList ID="drpDesignerId" runat="server" Label="制定人" LabelAlign="Right"  ShowRedStar="true" Required="true">
                    </f:DropDownList>
                     <f:DatePicker ID="txtDesignerDate"  DateFormatString="yyyy-MM-dd HH:mm" runat="server" 
                            Label="制定时间" LabelAlign="Right" EnableEdit="true" ShowTime="true" ShowSecond="false">
                    </f:DatePicker>
                </Items>
            </f:FormRow>  
            <f:FormRow>
                <Items>
                     <f:DropDownList ID="drpTrainType" runat="server" Label="培训类型" LabelAlign="Right"  EnableEdit="true"
                         AutoPostBack="true" OnSelectedIndexChanged="drpTrainType_SelectedIndexChanged" 
                         ShowRedStar="true" Required="true">
                    </f:DropDownList>
                    <f:DropDownList ID="drpTrainLevel" runat="server" Label="培训级别" LabelAlign="Right" >
                    </f:DropDownList>
                      </Items>
            </f:FormRow>
              <f:FormRow>
                <Items>
                      <f:DatePicker ID="txtTrainStartDate" ShowRedStar="true" DateFormatString="yyyy-MM-dd HH:mm"
                          runat="server" Label="培训时间" Required="true" LabelAlign="Right"
                        EnableEdit="true" ShowTime="true" ShowSecond="false">
                    </f:DatePicker>
                    <f:NumberBox ID="txtTeachHour" runat="server" Label="学时" LabelAlign="Right" 
                        NoDecimal="true" NoNegative="true">
                    </f:NumberBox>
                      </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                <f:TextArea ID="txtTrainContent" runat="server" Label="培训内容" LabelAlign="Right" MaxLength="500" Height="64px">
                    </f:TextArea>
                </Items>
            </f:FormRow>
           <f:FormRow ColumnWidths="86% 7% 7%">
                <Items>
                   <f:DropDownList ID="drpUnit" runat="server" Label="培训单位" LabelAlign="Right"  ShowRedStar="true"
                       EnableEdit="true" EnableMultiSelect="true" EnableCheckBoxSelect="true" 
                       AutoPostBack="true" OnSelectedIndexChanged="drpUnit_SelectedIndexChanged">
                    </f:DropDownList>
                       <f:Button ID="SelectALL_U" runat="server" Text="全选" OnClick="SelectALL_U_Click"></f:Button>
                        <f:Button ID="SelectNoALL_U" runat="server" Text="全不选" 
                        OnClick="SelectNoALL_U_Click"></f:Button>
                </Items>
            </f:FormRow>
           <f:FormRow ColumnWidths="86% 7% 7%">
                <Items>
                    <f:DropDownList ID="drpWorkPost" runat="server" Label="培训岗位" LabelAlign="Right"   ShowRedStar="true"
                       EnableEdit="true" EnableMultiSelect="true" EnableCheckBoxSelect="true"
                        AutoPostBack="true" OnSelectedIndexChanged="drpWorkPost_SelectedIndexChanged">
                    </f:DropDownList>
                       <f:Button ID="SelectALL_W" runat="server" Text="全选" OnClick="SelectALL_W_Click"></f:Button>
                        <f:Button ID="SelectNoALL_W" runat="server" Text="全不选" 
                            OnClick="SelectNoALL_W_Click"></f:Button>
                </Items>
            </f:FormRow>
              <f:FormRow>
                <Items>
                     <f:TextBox ID="txtTeachMan" runat="server" Label="授课人" LabelAlign="Right" MaxLength="50" >
                    </f:TextBox>
                       <f:TextBox ID="txtTeachAddress" runat="server" Label="授课地点" LabelAlign="Right"  MaxLength="100">
                    </f:TextBox>
                      </Items>
            </f:FormRow>
             <f:FormRow>
                <Items>
                     <f:DropDownList ID="drpMan" runat="server" Label="培训人员" LabelAlign="Right"   ShowRedStar="true"
                        EnableEdit="true" EnableMultiSelect="true" EnableCheckBoxSelect="true" 
                         AutoPostBack="true" OnSelectedIndexChanged="drpMan_SelectedIndexChanged">
                    </f:DropDownList>
                </Items>
            </f:FormRow>
            <f:FormRow>
                <Items>
                      <f:DropDownList ID="drpTrainingEdu" runat="server" Label="教材类型" LabelAlign="Right"   ShowRedStar="true"
                            EnableEdit="true" EnableMultiSelect="true" EnableCheckBoxSelect="true" 
                          AutoPostBack="true" OnSelectedIndexChanged="drpTrainingEdu_SelectedIndexChanged">
                    </f:DropDownList>
                </Items>
            </f:FormRow>
        </Rows>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                <Items>
                    <f:ToolbarFill ID="ToolbarFill1" runat="server">
                    </f:ToolbarFill>          
                    <f:Button ID="btnSubmit" Icon="SystemSaveNew" runat="server" ToolTip="提交" ValidateForms="SimpleForm1"
                        OnClick="btnSubmit_Click">
                    </f:Button>
                    <f:Button ID="btnSave" Icon="SystemSave" runat="server" ToolTip="保存" ValidateForms="SimpleForm1"
                        OnClick="btnSave_Click">
                    </f:Button>
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
