<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherActivities.aspx.cs" Inherits="FineUIPro.Web.SafetyActivities.OtherActivities"
    ValidateRequest="false" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>其他安全活动</title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
            <Items>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true"
                    EnableCollapse="true" Width="250" Title="公司-项目" TitleToolTip="公司-项目" ShowBorder="true"
                    ShowHeader="true" AutoScroll="true" BodyPadding="5px" IconFont="ArrowCircleLeft" Layout="Fit">
                    <Items>
                        <f:Tree ID="tvProjectAndUnit" EnableCollapse="true" ShowHeader="false" Title="单位-项目"
                            OnNodeCommand="tvProjectAndUnit_NodeCommand" AutoLeafIdentification="true" runat="server"
                            ShowBorder="false"
                            EnableTextSelection="True">
                        </f:Tree>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center" ShowBorder="true"
                    Layout="VBox" ShowHeader="false" BodyPadding="5px" IconFont="PlusCircle" Title="安全活动"
                    TitleToolTip="安全活动信息" AutoScroll="true">
                    <Items>
                        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="其他安全活动" EnableCollapse="true"
                            runat="server" BoxFlex="1" EnableColumnLines="true" DataKeyNames="OtherActivitiesId"
                            DataIDField="OtherActivitiesId" AllowSorting="true" ForceFit="true"
                            SortField="CompileDate" SortDirection="DESC" OnSort="Grid1_Sort" AllowPaging="true"
                            IsDatabasePaging="true" PageSize="10" OnPageIndexChange="Grid1_PageIndexChange"
                            EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick" EnableTextSelection="True">
                            <Toolbars>
                                <f:Toolbar ID="Toolbar2" Position="Top" runat="server" ToolbarAlign="Left">
                                    <Items>
                                        <f:TextBox runat="server" Label="标题" ID="txtTitle" EmptyText="输入查询条件"
                                            AutoPostBack="true" OnTextChanged="TextBox_TextChanged" Width="250px" LabelWidth="80px"
                                            LabelAlign="right">
                                        </f:TextBox>
                                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                                        </f:ToolbarFill>
                                        <f:Button ID="btnNew" ToolTip="新增" Icon="Add" EnablePostBack="true"  OnClick="btnNew_Click" Hidden="true"
                                            runat="server">
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
                                        <asp:Label ID="lblNumber" runat="server" Text='<%# Grid1.PageIndex * Grid1.PageSize + Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </f:TemplateField>
                                <f:RenderField Width="300px" ColumnID="Title" DataField="Title"
                                    SortField="Title" FieldType="String" HeaderText="标题"
                                    HeaderTextAlign="Center" TextAlign="Left">
                                </f:RenderField>
                                <f:RenderField Width="100px" ColumnID="CompileDate" DataField="CompileDate"
                                    SortField="CompileDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                                    HeaderText="活动日期" HeaderTextAlign="Center" TextAlign="Center">
                                </f:RenderField>
                                <f:RenderField Width="100px" ColumnID="Scope" DataField="CompileManName"
                                    SortField="CompileManName" FieldType="String" HeaderText="整理人" HeaderTextAlign="Center"
                                    TextAlign="Left">
                                </f:RenderField>
                                <f:RenderField Width="120px" ColumnID="Remark" DataField="Remark"
                                    SortField="Remark" FieldType="String" HeaderText="备注" HeaderTextAlign="Center"
                                    TextAlign="Left">
                                </f:RenderField>
                                <f:WindowField TextAlign="Left" Width="60px" WindowID="WindowAtt" HeaderText="附件" Text="附件" ToolTip="附件上传查看"
                                    DataIFrameUrlFields="OtherActivitiesId" DataIFrameUrlFormatString="../AttachFile/webuploader.aspx?toKeyId={0}&type=-1&path=FileUpload/OtherActivitiesAttachUrl&menuId=446D702B-F0C1-4D12-A862-0B8317D95928"
                                    HeaderTextAlign="Center" />
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
                                </f:DropDownList>
                            </PageItems>
                        </f:Grid>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <f:Window ID="Window1" Title="编辑活动" Hidden="true" EnableIFrame="true" EnableMaximize="true"
            Target="Parent" EnableResize="true" runat="server" IsModal="true" Width="1024px" OnClose="Window1_Close"
            Height="500px">
        </f:Window>
        <f:Window ID="WindowAtt" Title="附件页面" Hidden="true" EnableIFrame="true" EnableMaximize="true"
            Target="Parent" EnableResize="true" runat="server" IsModal="true" Width="700px"
            Height="500px">
        </f:Window>
        <f:Menu ID="Menu1" runat="server">
            <f:MenuButton ID="btnMenuEdit" OnClick="btnMenuEdit_Click" Icon="TableEdit" EnablePostBack="true"
                Hidden="true" runat="server" Text="编辑">
            </f:MenuButton>
            <f:MenuButton ID="btnMenuDelete" OnClick="btnMenuDelete_Click" EnablePostBack="true"
                Hidden="true" Icon="Delete" ConfirmText="删除选中行？" ConfirmTarget="Parent" runat="server"
                Text="删除">
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
