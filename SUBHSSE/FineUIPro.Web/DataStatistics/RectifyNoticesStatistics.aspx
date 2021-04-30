<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RectifyNoticesStatistics.aspx.cs"
    Inherits="FineUIPro.Web.DataStatistics.RectifyNoticesStatistics" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../Controls/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <title>隐患整改单统计</title>
    <style type="text/css">
        .labcenter {
            text-align: center;
        }

        .f-grid-row .f-grid-cell-inner {
            white-space: normal;
            word-break: break-all;
        }

        .LabelColor {
            color: Red;
            font-size: small;
        }

        .f-grid-row.Yellow {
            background-color: Yellow;
        }

        .f-grid-row.Green {
            background-color: LightGreen;
        }

        .f-grid-row.Red {
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
                <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="隐患整改单统计" EnableCollapse="true"
                    runat="server" BoxFlex="1" DataKeyNames="DataId" DataIDField="DataId" AllowSorting="true" SortField="DataColName,DataAllName,DataName"
                    SortDirection="ASC" OnSort="Grid1_Sort" EnableColumnLines="true" AllowPaging="true" ForceFit="true"
                    IsDatabasePaging="true" PageSize="15" OnPageIndexChange="Grid1_PageIndexChange" EnableTextSelection="True">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" Position="Top" runat="server" ToolbarAlign="Left">
                            <Items>
                                <f:RadioButtonList runat="server" AutoPostBack="true" Width="200px"
                                    ID="rbType" OnSelectedIndexChanged="rbType_SelectedIndexChanged">
                                    <f:RadioItem Value="0" Text="全部" Selected="true" />
                                    <f:RadioItem Value="1" Text="公司" />
                                    <f:RadioItem Value="2" Text="分公司" />
                                </f:RadioButtonList>
                                <f:DropDownList runat="server" ID="drpCompany" AutoPostBack="true"
                                    LabelWidth="50px" Width="270px"
                                    OnSelectedIndexChanged="drpCompany_SelectedIndexChanged" EnableEdit="true">
                                </f:DropDownList>
                                <f:DropDownList runat="server" ID="drpProject" Label="项目" AutoPostBack="true"
                                    LabelWidth="50px" Width="300px"
                                    OnSelectedIndexChanged="drpProject_SelectedIndexChanged" EnableEdit="true">
                                </f:DropDownList>
                                <f:DropDownList runat="server" ID="drpUnit" Label="施工单位" LabelWidth="80px"
                                    Width="300px" EnableEdit="true">
                                </f:DropDownList>
                            </Items>
                        </f:Toolbar>
                        <f:Toolbar ID="Toolbar1" Position="Top" runat="server" ToolbarAlign="Left">
                            <Items>
                                <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="开始日期" ID="txtStartTime"
                                    AutoPostBack="true" OnTextChanged="TextBox_TextChanged" LabelAlign="right" Width="210px" LabelWidth="80px">
                                </f:DatePicker>
                                <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="结束日期" ID="txtEndTime"
                                    AutoPostBack="true" OnTextChanged="TextBox_TextChanged" LabelAlign="right" Width="210px" LabelWidth="80px">
                                </f:DatePicker>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                </f:ToolbarFill>
                                <f:Button ID="btnSearch" ToolTip="统计" Icon="SystemSearch" OnClick="TextBox_TextChanged" runat="server">
                                </f:Button>
                                <f:Button ID="btnOut" OnClick="btnOut_Click" runat="server" ToolTip="导出" Icon="FolderUp"
                                    EnableAjax="false" DisableControlBeforePostBack="false">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>
                        <f:TemplateField ColumnID="tfPageIndex" Width="60px" HeaderText="序号" HeaderTextAlign="Center" TextAlign="Center"
                            EnableLock="true" Locked="False">
                            <ItemTemplate>
                                <asp:Label ID="lblPageIndex" runat="server" Text='<%# Grid1.PageIndex * Grid1.PageSize + Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:RenderField Width="230px" ColumnID="DataColName" DataField="DataColName" FieldType="String"
                            HeaderText="公司/分公司" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="250px" ColumnID="DataAllName" DataField="DataAllName" FieldType="String"
                            HeaderText="项目" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="250px" ColumnID="DataName" DataField="DataName" FieldType="String"
                            HeaderText="施工单位" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="90px" ColumnID="DataSumCount" DataField="DataSumCount" FieldType="Int"
                            HeaderText="总数" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="90px" ColumnID="DataCount1" DataField="DataCount1" FieldType="Int"
                            HeaderText="待签发" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="90px" ColumnID="DataCount2" DataField="DataCount2" FieldType="Int"
                            HeaderText="待整改" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="90px" ColumnID="DataCount3" DataField="DataCount3" FieldType="Int"
                            HeaderText="待审核" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="90px" ColumnID="DataCount4" DataField="DataCount4" FieldType="Int"
                            HeaderText="待复查" TextAlign="Left" HeaderTextAlign="Center">
                        </f:RenderField>
                        <f:RenderField Width="90px" ColumnID="DataCount5" DataField="DataCount5" FieldType="Int"
                            HeaderText="已完成" TextAlign="Left" HeaderTextAlign="Center">
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
                    </PageItems>
                </f:Grid>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
