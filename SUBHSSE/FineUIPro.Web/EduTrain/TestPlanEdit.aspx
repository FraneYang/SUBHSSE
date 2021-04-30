<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPlanEdit.aspx.cs" Inherits="FineUIPro.Web.EduTrain.TestPlanEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>考试计划</title>
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
                         <f:DropDownList ID="drpTrainType" runat="server" Label="考试类型" LabelAlign="Right" EnableEdit="true"
                            AutoPostBack="true" OnSelectedIndexChanged="drpTrainType_SelectedIndexChanged"
                            ShowRedStar="true" Required="true" FocusOnPageLoad="true">
                        </f:DropDownList>
                        <f:TextBox ID="txtPlanName" runat="server" Label="名称" LabelAlign="Right"  Required="true" ShowRedStar="true"
                            MaxLength="300" >
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DatePicker ID="txtTestStartTime" DateFormatString="yyyy-MM-dd HH:mm" runat="server" Required="true" ShowRedStar="true"
                            Label="扫码时间" LabelAlign="Right" EnableEdit="true" ShowTime="true" ShowSecond="false">
                        </f:DatePicker>
                        <f:DatePicker ID="txtTestEndTime" DateFormatString="yyyy-MM-dd HH:mm" runat="server" Required="true" ShowRedStar="true"
                            Label="至" LabelAlign="Right" EnableEdit="true" ShowTime="true" ShowSecond="false">
                        </f:DatePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="95% 5%">
                    <Items>
                        <f:TextBox ID="txtTestPalce" runat="server" Label="考试地点" LabelAlign="Right" MaxLength="500">
                        </f:TextBox>
                        <f:TextBox Hidden="true" ID="txtTestPlanCode" runat="server" Width="1px"></f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="txtSValue" runat="server" Label="单选题分值" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true" Required="true" ShowRedStar="true"
                            OnBlur="getTotalScore_Blur" EnableBlurEvent="true">
                        </f:NumberBox>
                        <f:NumberBox ID="txtMValue" runat="server" Label="多选题分值" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true" Required="true" ShowRedStar="true"
                            OnBlur="getTotalScore_Blur" EnableBlurEvent="true">
                        </f:NumberBox>
                        <f:NumberBox ID="txtJValue" runat="server" Label="判断题分值" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true" Required="true" ShowRedStar="true"
                            OnBlur="getTotalScore_Blur" EnableBlurEvent="true">
                        </f:NumberBox>
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server" ID="tr0" Hidden="true">
                    <Items>
                        <f:DropDownBox runat="server" ID="drpTestTraining" ShowRedStar="true"
                            EnableMultiSelect="false" Label="试题类型" AutoPostBack="true" OnTextChanged="drpTestTraining_TextChanged">
                            <PopPanel>
                                <f:Tree ID="tvTestTraining" EnableCollapse="true" ShowHeader="false" Title="考试试题库"
                                    AutoScroll="true" Hidden="true" Width="400px"
                                    AutoLeafIdentification="true" runat="server" EnableTextSelection="True"
                                    ShowBorder="true" EnableSingleClickExpand="true">
                                </f:Tree>
                            </PopPanel>
                        </f:DropDownBox>
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server" ID="tr1" Hidden="true">
                    <Items>
                        <f:NumberBox runat="server" ID="txtSCount" Label="单选题数量" LabelWidth="120px"
                           NoDecimal="true" NoNegative="true" ShowRedStar="true">
                        </f:NumberBox>
                        <f:NumberBox runat="server" ID="txtMCount" Label="多选题数量" LabelWidth="120px"
                           NoDecimal="true" NoNegative="true" ShowRedStar="true">
                        </f:NumberBox>
                        <f:NumberBox runat="server" ID="txtJCount" Label="判断题数量" LabelWidth="120px"
                            NoDecimal="true" NoNegative="true" ShowRedStar="true">
                        </f:NumberBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Grid ID="Grid1" ShowBorder="true" EnableCollapse="true" ShowHeader="false" runat="server" BoxFlex="1"
                            DataKeyNames="TestPlanTrainingId" EnableColumnLines="true" DataIDField="TestPlanTrainingId"
                            AllowSorting="true" SortField="TrainingTypeCode" SortDirection="ASC" PageSize="500"
                            ForceFit="true" EnableTextSelection="True" EnableRowDoubleClickEvent="true"
                            OnRowDoubleClick="Grid1_RowDoubleClick">
                            <Toolbars>
                                <f:Toolbar ID="Toolbar2" Position="Top" runat="server" ToolbarAlign="Right">
                                    <Items>
                                        <f:Label runat="server" ID="lbTypeToop"></f:Label>
                                        <f:ToolbarFill ID="ToolbarFill2" runat="server">
                                        </f:ToolbarFill>
                                        <f:Button ID="btnGVAdd" ToolTip="新增" Icon="Add" ValidateForms="SimpleForm1" runat="server"
                                            OnClick="btnGVAdd_Click">
                                        </f:Button>
                                        <f:Button ID="btnGVSave" ToolTip="确定" Icon="Accept" runat="server" 
                                            OnClick="btnGVSave_Click">
                                        </f:Button>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
                            <Columns>
                                <f:RowNumberField EnablePagingNumber="true" HeaderText="序号" Width="50px" HeaderTextAlign="Center"
                                    TextAlign="Center" />
                                <f:RenderField Width="150px" ColumnID="TrainingTypeName" DataField="TrainingTypeName" TextAlign="Left"
                                    FieldType="String" HeaderText="试题类型" HeaderTextAlign="Center">
                                </f:RenderField>
                                <f:RenderField Width="100px" ColumnID="TestType1Count" DataField="TestType1Count" TextAlign="Left"
                                    FieldType="String" HeaderText="单选题" HeaderTextAlign="Center">
                                </f:RenderField>
                                <f:RenderField Width="100px" ColumnID="TestType2Count" DataField="TestType2Count" TextAlign="Left"
                                    FieldType="String" HeaderText="多选题" HeaderTextAlign="Center">
                                </f:RenderField>
                                <f:RenderField Width="100px" ColumnID="TestType3Count" DataField="TestType3Count"
                                    FieldType="String" HeaderText="判断题" HeaderTextAlign="Center" TextAlign="Left">
                                </f:RenderField>
                                <f:RenderField Width="1px" Hidden="true" ColumnID="TrainingTypeId" DataField="TrainingTypeId" TextAlign="Left"
                                    FieldType="String" HeaderText="试题类型ID" HeaderTextAlign="Center">
                                </f:RenderField>
                            </Columns>
                            <Listeners>
                                <f:Listener Event="beforerowcontextmenu" Handler="onRowContextMenu" />
                            </Listeners>
                        </f:Grid>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="txtTotalScore" runat="server" Label="总分值" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true" Readonly="true">
                        </f:NumberBox>
                        <f:NumberBox ID="txtQuestionCount" runat="server" Label="题目数量" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true" Readonly="true">
                        </f:NumberBox>
                        <f:NumberBox ID="txtPassingScore" runat="server" Label="及格分" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true">
                        </f:NumberBox>
                        <f:NumberBox ID="txtDuration" runat="server" Label="时长" LabelAlign="Right"
                            NoDecimal="true" NoNegative="true">
                        </f:NumberBox>
                    </Items>
                </f:FormRow>
             <f:FormRow ColumnWidths="86% 7% 7%">
                    <Items>
                        <f:DropDownList ID="drpUnit" runat="server" Label="单位" LabelAlign="Right" ShowRedStar="true"
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
                        <f:DropDownList ID="drpWorkPost" runat="server" Label="岗位" LabelAlign="Right" ShowRedStar="true"
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
                        <f:DropDownList ID="drpMan" runat="server" Label="培训人员" LabelAlign="Right" ShowRedStar="true"
                            EnableEdit="true" EnableMultiSelect="true" EnableCheckBoxSelect="true">
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
        <f:Menu ID="Menu1" runat="server">
            <f:MenuButton ID="btnMenuEdit" OnClick="btnMenuEdit_Click" EnablePostBack="true"
                runat="server" Text="编辑" Icon="TableEdit">
            </f:MenuButton>
            <f:MenuButton ID="btnMenuDelete" OnClick="btnMenuDelete_Click" EnablePostBack="true"
                ConfirmText="删除选中行？" ConfirmTarget="Top" runat="server" Text="删除"
                Icon="Delete">
            </f:MenuButton>
        </f:Menu>
    </form>
    <script type="text/jscript">
        var menuID = '<%= Menu1.ClientID %>';
        // 返回false，来阻止浏览器右键菜单
        function onRowContextMenu(event, rowId) {
            F(menuID).show();  //showAt(event.pageX, event.pageY);
            return false;
        }

        function reloadGrid() {
            __doPostBack(null, 'reloadGrid');
        }
    </script>
</body>
</html>
