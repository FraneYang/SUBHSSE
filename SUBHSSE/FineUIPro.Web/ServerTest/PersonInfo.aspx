﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonInfo.aspx.cs" Inherits="FineUIPro.Web.ServerTest.PersonInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>人员信息</title>
    <style type="text/css">
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
    <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
        <Items>
            <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true"
                EnableCollapse="true" Width="250" Title="人员信息" TitleToolTip="人员信息" ShowBorder="true"
                ShowHeader="true" AutoScroll="true" BodyPadding="5px" IconFont="ArrowCircleLeft" Layout="Fit">
                <Items>
                    <f:Tree ID="tvProjectAndUnit" EnableCollapse="true" ShowHeader="false" Title="单位" OnNodeCommand="tvProjectAndUnit_NodeCommand" AutoLeafIdentification="true" runat="server" ShowBorder="false" 
                         EnableTextSelection="True">
                    </f:Tree>
                </Items>
                 <Toolbars>
                    <f:Toolbar ID="Toolbar2" Position="Bottom" ToolbarAlign="Right" runat="server">
                        <Items>
                            <f:Button ID="btnPersonUnit" ToolTip="调整人员单位" Icon="TableRefresh" runat="server" Hidden="true" OnClick="btnPersonUnit_Click">
                             </f:Button>                           
                        </Items>
                    </f:Toolbar>
                </Toolbars>
            </f:Panel>
            <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center" ShowBorder="true"
                Layout="VBox" ShowHeader="false" BodyPadding="5px" IconFont="PlusCircle" Title="人员信息"
                TitleToolTip="人员信息" AutoScroll="true">
                <Items>
                    <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="人员信息" EnableCollapse="true"
                        runat="server" BoxFlex="1" DataKeyNames="PersonId" AllowCellEditing="true" ClicksToEdit="2"
                        DataIDField="PersonId" AllowSorting="true" SortField="PersonName" SortDirection="ASC" ForceFit="true"
                        OnSort="Grid1_Sort" AllowPaging="true" IsDatabasePaging="true" PageSize="10" EnableColumnLines="true"
                        OnPageIndexChange="Grid1_PageIndexChange" EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick">
                        <Toolbars>
                            <f:Toolbar ID="Toolbar3" Position="Top" ToolbarAlign="Left" runat="server">
                                <Items>
                                    <f:TextBox runat="server" Label="姓名" ID="txtPersonName" EmptyText="输入查询条件"
                                         Width="200px" LabelWidth="50px" LabelAlign="right">
                                    </f:TextBox>
                                    <f:DropDownList ID="drpPost" runat="server" Label="岗位" EnableEdit="true" EnableMultiSelect="true" 
                                        Width="250px" LabelWidth="50px" LabelAlign="right" ForceSelection="false" EnableCheckBoxSelect="true">
                                    </f:DropDownList>       
                                    <f:CheckBox runat="server" ID="ckTrain" Label="未培训" LabelAlign="right" Width="90px" LabelWidth="70px"> 
                                    </f:CheckBox>
                                    <f:TextBox runat="server" Label="身份证" ID="txtIdentityCard" EmptyText="输入查询条件"
                                        Width="250px" LabelWidth="70px">
                                    </f:TextBox>                                      
                                </Items>
                            </f:Toolbar>
                        </Toolbars>
                        <Toolbars>
                            <f:Toolbar ID="Toolbar1" Position="Top" ToolbarAlign="Right" runat="server">
                                <Items>
                              <f:ToolbarFill ID="ToolbarFill1" runat="server"></f:ToolbarFill>
                                    <f:Button ID="btSearch" ToolTip="查询" Icon="SystemSearch" runat="server" 
                                        OnClick="TextBox_TextChanged"></f:Button>
                                    <f:Button ID="btnNew" ToolTip="增加" Icon="Add" runat="server" Hidden="true" OnClick="btnNew_Click">
                                    </f:Button>
                                    <f:Button ID="btnPersonOut" ToolTip="批量进入项目" Icon="UserGo" runat="server" Hidden="true" OnClick="btnPersonOut_Click">
                                    </f:Button>
                                    <f:Button ID="btnImport" ToolTip="导入" Icon="ApplicationGet" Hidden="true" runat="server"
                                        OnClick="btnImport_Click">
                                    </f:Button>
                                    <f:Button ID="btnOut" OnClick="btnOut_Click" runat="server" ToolTip="导出" Icon="FolderUp"
                                            EnableAjax="false" DisableControlBeforePostBack="false">
                                    </f:Button>                                    
                                    <f:Button ID="btnQR" ToolTip="批量生成二维码" Icon="TableRefresh" runat="server"  OnClick="btnQR_Click">
                                </f:Button>    
                                 </Items>
                            </f:Toolbar>
                        </Toolbars>
                        <Columns>
                            <f:TemplateField ColumnID="tfNumber" HeaderText="序号" Width="50px" HeaderTextAlign="Center" TextAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="labNumber" runat="server" Text=' <%# Grid1.PageIndex * Grid1.PageSize + Container.DataItemIndex + 1%>'></asp:Label>
                                </ItemTemplate>
                            </f:TemplateField>                              
                            <f:RenderField Width="100px" ColumnID="PersonName" DataField="PersonName" SortField="PersonName"
                                FieldType="String" HeaderText="姓名" HeaderTextAlign="Center"
                                TextAlign="Center">                          
                            </f:RenderField>                            
                             <f:RenderField HeaderText="单位" ColumnID="UnitName" DataField="UnitName" SortField="UnitName"
                                 FieldType="String" HeaderTextAlign="Center" TextAlign="Left" Width="220px">                               
                            </f:RenderField>   
                            <f:RenderField HeaderText="部门" ColumnID="DepartName" DataField="DepartName" SortField="DepartName"
                                 FieldType="String" HeaderTextAlign="Center" TextAlign="Left" Width="120px">                               
                            </f:RenderField>    
                            <f:RenderField HeaderText="岗位" ColumnID="WorkPostName" DataField="WorkPostName" SortField="WorkPostName"
                                 FieldType="String" HeaderTextAlign="Center" TextAlign="Left" Width="100px">                               
                            </f:RenderField>
                            <f:TemplateField ColumnID="tfI" HeaderText="身份证号" Width="170px" HeaderTextAlign="Center" TextAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lbI" runat="server" Text=' <%# Bind("IdentityCard") %>'></asp:Label>
                                </ItemTemplate>
                            </f:TemplateField> 
                              <f:RenderField HeaderText="电话" ColumnID="Telephone" DataField="Telephone" SortField="Telephone"
                                 FieldType="String" HeaderTextAlign="Center" TextAlign="Left" Width="100px">                               
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
                            </f:DropDownList>
                            <f:Label runat="server" Text="红色表示未进行过任何培训人员。"  CssClass="LabelColor"></f:Label>
                        </PageItems>
                    </f:Grid>
                </Items>
            </f:Panel>
        </Items>
    </f:Panel>
    <f:Window ID="Window1" Title="编辑人员信息" Hidden="true" EnableIFrame="true" EnableMaximize="true"
        Target="Parent" EnableResize="true" runat="server" OnClose="Window1_Close" IsModal="true"
        Width="900px" Height="520px">
    </f:Window>
    <f:Window ID="Window2" Title="导入人员信息" Hidden="true" EnableIFrame="true" EnableMaximize="true"
        Target="Parent" EnableResize="true" runat="server" OnClose="Window2_Close" IsModal="false"
        CloseAction="HidePostBack" Width="1200px" Height="600px">
    </f:Window>
    <f:Window ID="Window3" Title="编辑人员信息" Hidden="true" EnableIFrame="true" EnableMaximize="true"
        Target="Parent" EnableResize="true" runat="server" OnClose="Window3_Close" IsModal="true"
        Width="800px" Height="520px">
    </f:Window>
    <f:Menu ID="Menu1" runat="server">
        <f:MenuButton ID="btnMenuEdit" OnClick="btnMenuEdit_Click" EnablePostBack="true"
            Hidden="true" runat="server" Text="修改" Icon="Pencil">
        </f:MenuButton>
        <f:MenuButton ID="btnMenuDelete" OnClick="btnMenuDelete_Click" EnablePostBack="true"
            Hidden="true" ConfirmText="删除选中行？" ConfirmTarget="Parent" runat="server" Icon="Delete" Text="删除">
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
