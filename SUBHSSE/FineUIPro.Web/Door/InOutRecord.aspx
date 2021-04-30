<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InOutRecord.aspx.cs"
    Inherits="FineUIPro.Web.Door.InOutRecord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>现场考勤记录</title>
    <style type="text/css">
        .f-grid-row .f-grid-cell-inner
        {
            white-space: normal;
            word-break: break-all;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
    <f:Panel ID="Panel1" runat="server" Margin="5px" BodyPadding="5px" ShowBorder="false"
        ShowHeader="false" Layout="VBox" BoxConfigAlign="Stretch">
        <Items>            
            <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="现场考勤记录" EnableCollapse="true"
                runat="server" BoxFlex="1" DataKeyNames="EmployInOutRecordId"  AllowPaging="true"
                IsDatabasePaging="true" PageSize="20" OnPageIndexChange="Grid1_PageIndexChange"
                DataIDField="EmployInOutRecordId" AllowSorting="true" SortField="RecordDate" 
                SortDirection="DESC"  EnableColumnLines="true" OnSort="Grid1_Sort"
                EnableTextSelection="True">
                <Toolbars>
                    <f:Toolbar ID="Toolbar2" Position="Top" runat="server" ToolbarAlign="Left">
                        <Items>
                            <f:DropDownList runat="server" ID="drpUnit" Label="单位" EnableEdit="true"
                                    Width="300px" LabelAlign="Right" LabelWidth="50px"></f:DropDownList>
                              <f:DropDownList runat="server" ID="drpWorkPost" Label="工种" EnableEdit="true"
                                    Width="220px" LabelAlign="Right" LabelWidth="50px"></f:DropDownList>
                            <f:DatePicker ID="txtStartDate" runat="server" Label="开始日期" LabelWidth="80px" Width="220px">
                            </f:DatePicker>
                            <f:DatePicker ID="txtEndDate" runat="server" Label="结束日期"  LabelWidth="80px" Width="220px">
                            </f:DatePicker>                            
                               </Items>
                       </f:Toolbar>
                    <f:Toolbar ID="Toolbar1" Position="Top" runat="server" ToolbarAlign="Left">
                        <Items>    
                            <f:TextBox ID="txtName" runat="server" Label="姓名" LabelWidth="50px" Width="220px" ></f:TextBox>
                            <f:ToolbarFill runat="server"></f:ToolbarFill>
                            <f:Button ID="btnSearch" runat="server" Icon="BrickMagnify" ToolTip="查询" OnClick="btnSearch_Click">
                            </f:Button>
                            <f:Button ID="btnOut" OnClick="btnOut_Click" runat="server" ToolTip="导出" Icon="FolderUp"
                                EnableAjax="false" DisableControlBeforePostBack="false">
                            </f:Button>
                        </Items>
                       </f:Toolbar>
                </Toolbars>
                <Columns>
                    <f:TemplateField ColumnID="tfNumber" Width="50px" HeaderText="序号" HeaderTextAlign="Center"
                        TextAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="labNumber" runat="server" Text='<%# Grid1.PageIndex * Grid1.PageSize + Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>
                          <f:RenderField Width="100px" ColumnID="InstallationName" DataField="InstallationName"
                        SortField="InstallationName" FieldType="String" HeaderText="装置" HeaderTextAlign="Center"
                        TextAlign="Left">
                    </f:RenderField>
                    <f:RenderField Width="160px" ColumnID="UnitName" DataField="UnitName" 
                        SortField="UnitName" FieldType="String" HeaderText="单位名称" HeaderTextAlign="Center"
                        TextAlign="Left">
                    </f:RenderField>
                       <f:RenderField Width="100px" ColumnID="EmployName" DataField="EmployName"
                        SortField="EmployName" FieldType="String" HeaderText="姓名" HeaderTextAlign="Center"
                        TextAlign="Left">
                    </f:RenderField>
                      <f:RenderField Width="100px" ColumnID="PostName" DataField="PostName"
                        SortField="PostName" FieldType="String" HeaderText="工种" HeaderTextAlign="Center"
                        TextAlign="Left">
                    </f:RenderField>
                      <f:RenderField Width="80px" ColumnID="Nation" DataField="Nation"
                        SortField="Nation" FieldType="String" HeaderText="民族" HeaderTextAlign="Center"
                        TextAlign="Left">
                    </f:RenderField>
                    <f:RenderField Width="150px" ColumnID="WorkIn1" DataField="WorkIn1" SortField="WorkIn1"
                        HeaderText="上午上班" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                     <f:RenderField Width="150px" ColumnID="OffDuty1" DataField="OffDuty1" SortField="OffDuty1"
                        HeaderText="上午下班" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                       <f:RenderField Width="150px" ColumnID="WorkIn2" DataField="WorkIn2" SortField="WorkIn2"
                        HeaderText="下午上班" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                     <f:RenderField Width="150px" ColumnID="OffDuty2" DataField="OffDuty2" SortField="OffDuty2"
                        HeaderText="下午下班" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                          <f:RenderField Width="150px" ColumnID="WorkIn3" DataField="WorkIn3" SortField="WorkIn3"
                        HeaderText="晚间上班" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                     <f:RenderField Width="150px" ColumnID="OffDuty3" DataField="OffDuty3" SortField="OffDuty3"
                        HeaderText="晚间下班" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                </Columns>
                 <PageItems>
                    <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                    </f:ToolbarSeparator>
                    <f:ToolbarText ID="ToolbarText1" runat="server" Text="每页记录数：">
                    </f:ToolbarText>
                    <f:DropDownList runat="server" ID="ddlPageSize" Width="80px" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                        <f:ListItem Text="10" Value="10" />
                        <f:ListItem Text="15" Value="15" />
                        <f:ListItem Text="20" Value="20" />
                        <f:ListItem Text="25" Value="25" />
                        <f:ListItem Text="所有行" Value="100000" />
                    </f:DropDownList>
                </PageItems>
            </f:Grid>
        </Items>
    </f:Panel>
    </form>
</body>
</html>
