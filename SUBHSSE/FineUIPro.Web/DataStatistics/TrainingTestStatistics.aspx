<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingTestStatistics.aspx.cs"
    Inherits="FineUIPro.Web.DataStatistics.TrainingTestStatistics" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../Controls/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <title>培训考试统计</title>
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
            <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="培训考试统计" EnableCollapse="true"
                runat="server" BoxFlex="1" DataKeyNames="ID" DataIDField="ID" AllowSorting="true" 
                SortField="CompanyName,ProjectName,UnitName,TrainTypeName"
                SortDirection="ASC" OnSort="Grid1_Sort" EnableColumnLines="true" AllowPaging="true" ForceFit="true"
                IsDatabasePaging="true" PageSize="15" OnPageIndexChange="Grid1_PageIndexChange" 
                EnableTextSelection="True">
                <Toolbars>
                    <f:Toolbar ID="Toolbar2" Position="Top" runat="server" ToolbarAlign="Left">
                        <Items>
                            <f:RadioButtonList runat="server" AutoPostBack="true"  Width="200px"
                                ID="rbType" OnSelectedIndexChanged="rbType_SelectedIndexChanged">
                                <f:RadioItem Value="0" Text="全部" Selected="true"/>
                                <f:RadioItem Value="1" Text="公司"/>
                                <f:RadioItem  Value="2" Text="分公司"/>
                            </f:RadioButtonList>
                            <f:DropDownList runat="server" ID="drpCompany" AutoPostBack="true" 
                                    LabelWidth="50px" Width="300px"
                                OnSelectedIndexChanged="drpCompany_SelectedIndexChanged" EnableEdit="true">
                            </f:DropDownList>                            
                               <f:DropDownList runat="server" ID="drpType"  LabelWidth="100px" Width="220px" Label="总部/项目部">                                
                                <f:ListItem Value="1" Text="项目部"/>
                                <f:ListItem Value="0" Text="总部"/>
                            </f:DropDownList>
                              
                        </Items>
                        </f:Toolbar>
                <f:Toolbar ID="Toolbar1" Position="Top" runat="server" ToolbarAlign="Left">
                        <Items>
                              <f:DropDownList runat="server" ID="drpProject" Label="项目" AutoPostBack="true"  
                                LabelWidth="50px" Width="300px"
                                OnSelectedIndexChanged="drpProject_SelectedIndexChanged" EnableEdit="true">
                            </f:DropDownList>
                            <f:DropDownList runat="server" ID="drpUnit" Label="施工单位" LabelWidth="80px" Width="220px" EnableEdit="true">
                            </f:DropDownList> 
                            <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="开始日期" ID="txtStartTime"
                                AutoPostBack="true" OnTextChanged="TextBox_TextChanged" LabelAlign="right" Width="210px" LabelWidth="80px">
                            </f:DatePicker>
                            <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="结束日期" ID="txtEndTime"
                                AutoPostBack="true" OnTextChanged="TextBox_TextChanged" LabelAlign="right" Width="210px" LabelWidth="80px">
                            </f:DatePicker>
                       
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
                    <f:RenderField Width="240px" ColumnID="ProjectName" DataField="ProjectName"  FieldType="String" 
                        HeaderText="项目" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="220px" ColumnID="UnitName" DataField="UnitName"  FieldType="String" 
                        HeaderText="施工单位" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="180px" ColumnID="TrainTypeName" DataField="TrainTypeName"  FieldType="String" 
                        HeaderText="培训类型" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="80px" ColumnID="PersonCount" DataField="PersonCount"  FieldType="String" 
                        HeaderText="人数" TextAlign="Left" HeaderTextAlign="Center">
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
