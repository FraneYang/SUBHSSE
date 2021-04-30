﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskView.aspx.cs" Inherits="FineUIPro.Web.EduTrain.TaskView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑培训任务</title>
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
                    <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" ClicksToEdit="1"
                        AllowCellEditing="true" DataIDField="TaskItemId" DataKeyNames="TaskItemId" 
                        OnSort="Grid1_Sort" AllowPaging="true" IsDatabasePaging="true" ForceFit="true"
                        PageSize="15" OnPageIndexChange="Grid1_PageIndexChange" EnableMultiSelect="false"
                         ShowGridHeader="true" EnableColumnLines="true" Height="480px" SortField="TrainingItemCode">                       
                        <Columns>
                            <f:RowNumberField ColumnID="rbNumber" HeaderText="序号" Width="50px" HeaderTextAlign="Center"
                                TextAlign="Center" />  
                            <f:RenderField Width="100px" ColumnID="TrainingItemCode" DataField="TrainingItemCode"
                                FieldType="String" HeaderText="教材编号" HeaderTextAlign="Center" TextAlign="Left">
                            </f:RenderField>
                             <f:RenderField Width="150px" ColumnID="TrainingItemName" DataField="TrainingItemName"
                                FieldType="String" HeaderText="教材名称" HeaderTextAlign="Center" TextAlign="Left">
                            </f:RenderField> 
                        <f:RenderField Width="150px" ColumnID="ScheduleTime" DataField="ScheduleTime"
                                FieldType="String" HeaderText="学习时长" HeaderTextAlign="Center" TextAlign="Left">
                            </f:RenderField>
                            <%--<f:RenderField Width="350px" ColumnID="Summary" DataField="Summary" FieldType="String"
                                HeaderText="教材内容" HeaderTextAlign="Center" TextAlign="Left" ExpandUnusedSpace="true">
                            </f:RenderField>--%>
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
                            <f:ListItem Text="所有行" Value="10000" />
                        </f:DropDownList>
                    </PageItems>
                    </f:Grid>
                </Items>
            </f:FormRow>
        </Rows>       
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
