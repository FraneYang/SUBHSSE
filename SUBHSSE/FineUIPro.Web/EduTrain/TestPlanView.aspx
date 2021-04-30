<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPlanView.aspx.cs" Inherits="FineUIPro.Web.EduTrain.TestPlanView" %>

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
                        <f:TextBox ID="txtPlanCode" runat="server" Label="编号" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                        <f:TextBox ID="txtPlanName" runat="server" Label="名称" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtTestStartTime" runat="server" Label="扫码时间" LabelAlign="Right" Readonly="true">
                        </f:TextBox>
                        <f:TextBox ID="txtTestEndTime" runat="server" Label="至" LabelAlign="Right" Readonly="true">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtTestPalce" runat="server" Label="考试地点" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtSValue" runat="server" Label="单选题分值" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                        <f:TextBox ID="txtMValue" runat="server" Label="多选题分值" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                        <f:TextBox ID="txtJValue" runat="server" Label="判断题分值" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Grid ID="Grid4" ShowBorder="true" EnableCollapse="true" ShowHeader="false" runat="server" BoxFlex="1"
                            DataKeyNames="TestPlanTrainingId" EnableColumnLines="true" DataIDField="TestPlanTrainingId" 
                            AllowSorting="true" SortField="TrainingTypeCode"  SortDirection="ASC" PageSize="500" ForceFit="true" EnableTextSelection="True">
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
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtTotalScore" runat="server" Label="总分值" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                        <f:TextBox ID="txtPassingScore" runat="server" Label="及格分" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                        <f:TextBox ID="txtQuestionCount" runat="server" Label="题目数量" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                        <f:TextBox ID="txtDuration" runat="server" Label="时长" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtUnits" runat="server" Label="参加单位" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextBox ID="txtWorkPostNames" runat="server" Label="考生岗位" Readonly="true" LabelAlign="Right">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                 <f:FormRow>
                    <Items>
                        <f:Grid ID="Grid1" ShowBorder="true" EnableCollapse="true" ShowHeader="false" runat="server" BoxFlex="1"
                            DataKeyNames="TestRecordId" EnableColumnLines="true" DataIDField="TestRecordId" 
                            AllowSorting="true" SortField="TestManName"  SortDirection="ASC" PageSize="5000" 
                            ForceFit="true" EnableTextSelection="True">
                            <Columns>
                                <f:RowNumberField EnablePagingNumber="true" HeaderText="序号" Width="50px" HeaderTextAlign="Center"
                                    TextAlign="Center" />
                                  <f:RenderField Width="100px" ColumnID="TestManName" DataField="TestManName" TextAlign="Left"
                                    FieldType="String" HeaderText="考生" HeaderTextAlign="Center">
                                </f:RenderField>
                                <f:RenderField Width="150px" ColumnID="TestStartTime" DataField="TestStartTime" TextAlign="Left"
                                    FieldType="String" HeaderText="开始时间" HeaderTextAlign="Center">
                                </f:RenderField>
                                <f:RenderField Width="150px" ColumnID="TestEndTime" DataField="TestEndTime" TextAlign="Left"
                                    FieldType="String" HeaderText="结束时间" HeaderTextAlign="Center">
                                </f:RenderField>
                                    <f:RenderField Width="100px" ColumnID="TestScores" DataField="TestScores" TextAlign="Left"
                                    FieldType="String" HeaderText="成绩" HeaderTextAlign="Center">
                                </f:RenderField>
                            </Columns>
                        </f:Grid>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
</body>
</html>
