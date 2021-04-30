<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingTaskStatistics.aspx.cs"
    Inherits="FineUIPro.Web.DataStatistics.TrainingTaskStatistics" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../Controls/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <title>考试统计</title>
    <style type="text/css">
        .labcenter
        {
            text-align: center;
        }
        
        .f-grid-row .f-grid-cell-inner
        {
            white-space: normal;
            word-break: break-all;
        }
          .LabelColor
        {
            color: Red;
            font-size:small;
        } 
         .f-grid-row.Yellow
        {
            background-color: Yellow;
        } 
        .f-grid-row.Green
        {
            background-color: LightGreen;
        }
         .f-grid-row.Red
        {
            background-color: Red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
    <f:Panel ID="Panel1" runat="server" Margin="5px" BodyPadding="5px" ShowBorder="false"
        ShowHeader="false" Layout="VBox" BoxConfigAlign="Stretch">
        <Items>
            <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="考试统计" EnableCollapse="true"
                runat="server" BoxFlex="1" DataKeyNames="ID" DataIDField="ID" AllowSorting="true" SortField="CompanyName,ProjectName,UnitName,TeamGroupName,PersonName"
                SortDirection="ASC" OnSort="Grid1_Sort" EnableColumnLines="true" AllowPaging="true"
                IsDatabasePaging="true" PageSize="15" OnPageIndexChange="Grid1_PageIndexChange" EnableTextSelection="True">
                <Toolbars>
                    <f:Toolbar ID="Toolbar2" Position="Top" runat="server" ToolbarAlign="Left">
                        <Items>
                            <f:DropDownList runat="server" ID="drpCompany" Label="公司" AutoPostBack="true"  LabelWidth="50px" Width="250px"
                                OnSelectedIndexChanged="drpCompany_SelectedIndexChanged" EnableEdit="true">
                            </f:DropDownList>
                            <f:DropDownList runat="server" ID="drpProject" Label="项目" AutoPostBack="true"  LabelWidth="50px" Width="220px"
                                OnSelectedIndexChanged="drpProject_SelectedIndexChanged" EnableEdit="true">
                            </f:DropDownList>
                            <f:DropDownList runat="server" ID="drpUnit" Label="施工单位" AutoPostBack="true"  LabelWidth="80px" Width="220px"
                                OnSelectedIndexChanged="drpUnit_SelectedIndexChanged" EnableEdit="true">
                            </f:DropDownList>
                             <f:DropDownList runat="server" ID="drpTeamGroup" Label="班组" EnableEdit="true" LabelWidth="50px" Width="180px">
                            </f:DropDownList> 
                            <f:TextBox runat="server" Label="姓名" ID="txtPersonName" LabelWidth="50px" Width="180px"></f:TextBox>
                        </Items>
                        </f:Toolbar>
                <f:Toolbar ID="Toolbar1" Position="Top" runat="server" ToolbarAlign="Left">
                        <Items>
                             <f:DropDownList runat="server" ID="drpTrainType" Label="培训类型" EnableEdit="true" LabelWidth="80px" Width="250px">
                            </f:DropDownList> 
                            <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="开始日期" ID="txtStartTime"
                                AutoPostBack="true" OnTextChanged="TextBox_TextChanged" LabelAlign="right" Width="210px" LabelWidth="80px">
                            </f:DatePicker>
                            <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="结束日期" ID="txtEndTime"
                                AutoPostBack="true" OnTextChanged="TextBox_TextChanged" LabelAlign="right" Width="210px" LabelWidth="80px">
                            </f:DatePicker>
                              <f:DropDownList runat="server" ID="drpStates" Label="状态" LabelWidth="50px" Width="150px">                                
                                    <f:ListItem Value="-1" Text="全部" Selected="true"/>
                                    <f:ListItem Value="0" Text="未响应"/>
                                   <f:ListItem Value="1" Text="已响应"/>
                                   <f:ListItem Value="2" Text="已完成"/>
                            </f:DropDownList>
                            
                            <f:ToolbarFill ID="ToolbarFill1" runat="server">
                            </f:ToolbarFill>
                            <f:Button ID="btnSearch" ToolTip="统计" Icon="SystemSearch" OnClick="TextBox_TextChanged"  runat="server" >
                            </f:Button>
                            <f:Button ID="btnOut" OnClick="btnOut_Click" runat="server" ToolTip="导出" Icon="FolderUp"
                                EnableAjax="false" DisableControlBeforePostBack="false">
                            </f:Button>
                        </Items>
                    </f:Toolbar>
                </Toolbars>
                <Columns>
                    <f:TemplateField ColumnID="tfPageIndex" Width="50px" HeaderText="序号" HeaderTextAlign="Center" TextAlign="Center"
                        EnableLock="true" Locked="False">
                        <ItemTemplate>
                            <asp:Label ID="lblPageIndex" runat="server" Text='<%# Grid1.PageIndex * Grid1.PageSize + Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>
                    <f:RenderField Width="220px" ColumnID="CompanyName" DataField="CompanyName"  FieldType="String" 
                        HeaderText="公司" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="220px" ColumnID="ProjectName" DataField="ProjectName"  FieldType="String" 
                        HeaderText="项目" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="220px" ColumnID="UnitName" DataField="UnitName"  FieldType="String" 
                        HeaderText="施工单位" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                     <f:RenderField Width="120px" ColumnID="TeamGroupName" DataField="TeamGroupName"  FieldType="String" 
                        HeaderText="班组" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                     <f:RenderField Width="150px" ColumnID="PersonName" DataField="PersonName"  FieldType="String" 
                        HeaderText="姓名" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="140px" ColumnID="TrainTypeName" DataField="TrainTypeName"  FieldType="String" 
                        HeaderText="培训类型" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                      <f:RenderField Width="140px" ColumnID="PlanName" DataField="PlanName"  FieldType="String" 
                        HeaderText="培训名称" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>  
                       <f:RenderField Width="150px" ColumnID="TaskDate" DataField="TaskDate"
                        SortField="AttendMeetingDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                        HeaderText="时间" HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                     <f:RenderField Width="140px" ColumnID="StatesName" DataField="StatesName"  FieldType="String" 
                        HeaderText="任务状态" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>  
                     <f:RenderField Width="140px" ColumnID="ScheduleTime" DataField="ScheduleTime"  FieldType="String" 
                        HeaderText="学习时长" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>  
                </Columns>
                <PageItems>
                    <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                    </f:ToolbarSeparator>
                    <f:ToolbarText ID="ToolbarText1" runat="server" Text="每页记录数：">
                    </f:ToolbarText>
                    <f:DropDownList runat="server" ID="ddlPageSize" Width="80px" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                    </f:DropDownList>
                     <f:ToolbarFill runat="server">
                    </f:ToolbarFill>
                     <%--<f:Label ID="Label2" runat="server" Text="说明：绿色-未审核完成；黄色-未闭环；白色-已闭环。"  CssClass="LabelColor"></f:Label>--%>
                </PageItems>
            </f:Grid>
        </Items>
    </f:Panel>
    </form>    
</body>
</html>
