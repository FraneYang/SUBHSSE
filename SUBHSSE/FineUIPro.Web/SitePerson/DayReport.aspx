﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DayReport.aspx.cs" Inherits="FineUIPro.Web.SitePerson.DayReport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>人工时日报</title>
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
            <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="人工时日报" EnableCollapse="true"
                runat="server" BoxFlex="1" DataKeyNames="DayReportId"  DataIDField="DayReportId" AllowSorting="true" SortField="CompileDate"
                SortDirection="DESC" OnSort="Grid1_Sort" AllowPaging="true" IsDatabasePaging="true"
                EnableColumnLines="true" PageSize="10" OnPageIndexChange="Grid1_PageIndexChange"   EnableTextSelection="True"
                AllowColumnLocking="true" EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick">
                <Toolbars>
                    <f:Toolbar ID="Toolbar2" Position="Top" runat="server">
                        <Items>
                            <%--<f:TextBox runat="server" Label="编号" ID="txtDayReportCode" EmptyText="输入查询条件" AutoPostBack="true"
                                OnTextChanged="TextBox_TextChanged" LabelWidth="50px" LabelAlign="right">
                            </f:TextBox>--%>
                            <f:DatePicker runat="server" Label="查询日期" ID="txtDate" LabelWidth="100px" AutoPostBack="true"
                                OnTextChanged="TextBox_TextChanged"
                                Width="220px" LabelAlign="right">
                            </f:DatePicker>
                            <f:CheckBox runat="server" Label="历史" ID="ckRecord"  Width="100px" LabelWidth="50px"
                                AutoPostBack="true" OnCheckedChanged="ckRecord_CheckedChanged"></f:CheckBox>
                            <f:ToolbarFill ID="ToolbarFill1" runat="server">
                            </f:ToolbarFill>
                            <f:DatePicker runat="server" Label="日报日期" ID="txtCompileDate" LabelWidth="100px"
                                Width="220px" LabelAlign="right">
                            </f:DatePicker>
                            <f:Button ID="btnNew" ToolTip="新增" Icon="Add" runat="server" OnClick="btnNew_Click"
                                Hidden="true">
                            </f:Button>
                            <f:Button ID="btnImport" ToolTip="导入" Icon="ApplicationGet" Hidden="true" runat="server"
                                OnClick="btnImport_Click">
                            </f:Button>
                            <f:Button ID="btnImport2" ToolTip="导入2" Icon="ApplicationGet" Hidden="true" runat="server"
                                OnClick="btnImport2_Click">
                            </f:Button>
                            <f:Button ID="btnOut" OnClick="btnOut_Click" runat="server" ToolTip="导出" Icon="FolderUp"
                                EnableAjax="false" DisableControlBeforePostBack="false">
                            </f:Button>
                        </Items>
                    </f:Toolbar>
                </Toolbars>
                <Columns>
                    <f:TemplateField ColumnID="tfPageIndex" Width="100px" HeaderText="序号" HeaderTextAlign="Center"
                        TextAlign="Center" EnableLock="true" Locked="False">
                        <ItemTemplate>
                            <asp:Label ID="lblPageIndex" runat="server" Text='<%# Grid1.PageIndex * Grid1.PageSize + Container.DataItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>
                    <f:RenderField Width="200px" ColumnID="DayReportCode" DataField="DayReportCode" SortField="DayReportCode"
                        FieldType="String" HeaderText="编号" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="150px" ColumnID="CompileDate" DataField="CompileDate" SortField="CompileDate"
                        FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="编制日期"
                        HeaderTextAlign="Center" TextAlign="Center">
                    </f:RenderField>
                    <f:RenderField Width="150px" ColumnID="UserName" DataField="UserName" SortField="UserName"
                        FieldType="String" HeaderText="编制人" TextAlign="Left" HeaderTextAlign="Center">
                    </f:RenderField>
                    <f:TemplateField ColumnID="tfWorkTime" Width="200px" HeaderText="当日人工时" HeaderTextAlign="Center"
                        TextAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblWorkTime" runat="server" Text='<%# ConvertPersonWorkTimeSum(Eval("DayReportId")) %>'
                                ToolTip='<%# ConvertPersonWorkTimeSum(Eval("DayReportId")) %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>
                    <%--<f:TemplateField ColumnID="tfWorkTimeYear" Width="150px" HeaderText="当年累计人工时" HeaderTextAlign="Center"
                        TextAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblWorkTimeYear" runat="server" Text='<%# ConvertYearPersonWorkTime(Eval("CompileDate")) %>'
                                ToolTip='<%# ConvertYearPersonWorkTime(Eval("CompileDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>--%>
                    <%--<f:TemplateField ColumnID="tfTotal" Width="150px" HeaderText="累计人工时" HeaderTextAlign="Center"
                        TextAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblTotal" runat="server" Text='<%# ConvertTotalPersonWorkTimeSum(Eval("CompileDate")) %>'
                                ToolTip='<%# ConvertTotalPersonWorkTimeSum(Eval("CompileDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </f:TemplateField>--%>
                    <f:RenderField Width="150px" ColumnID="FlowOperateName" DataField="FlowOperateName"
                        ExpandUnusedSpace="true" SortField="FlowOperateName" FieldType="String" HeaderText="状态"
                        HeaderTextAlign="Center" TextAlign="Left">
                    </f:RenderField>
                </Columns>
                <Listeners>
                    <f:Listener Event="beforerowcontextmenu" Handler="onRowContextMenu" />
                </Listeners>
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
    <f:Window ID="Window1" Title="人工时日报" Hidden="true" EnableIFrame="true" EnableMaximize="true"
        Target="Parent" EnableResize="true" runat="server" OnClose="Window1_Close" IsModal="true"
        Width="1200px" Height="800px">
    </f:Window>
    <f:Menu ID="Menu1" runat="server">
        <f:MenuButton ID="btnMenuModify" EnablePostBack="true" runat="server" Hidden="true"
            Text="修改" Icon="Pencil" OnClick="btnMenuModify_Click">
        </f:MenuButton>
        <f:MenuButton ID="btnMenuDel" EnablePostBack="true" runat="server" Hidden="true"
            Icon="Delete" Text="删除" ConfirmText="确定删除当前数据？" OnClick="btnMenuDel_Click">
        </f:MenuButton>
    </f:Menu>
    </form>
    <script type="text/javascript">
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
