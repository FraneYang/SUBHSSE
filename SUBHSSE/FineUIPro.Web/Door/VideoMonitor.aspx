<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoMonitor.aspx.cs" Inherits="FineUIPro.Web.Door.VideoMonitor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>事故类型</title>
    <link href="../res/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        
    <f:Panel ID="Panel1" runat="server" Margin="5px" BodyPadding="5px"  Layout="HBox" ShowHeader="false">
        <Items>
            <f:ContentPanel runat="server" Height="650px" Width="1300px">
                <div>
                    <iframe style="width:100%;height:800px;" src="http://117.191.103.163:10001/#/screen"></iframe>
                </div>
            </f:ContentPanel>
         </Items>
    </f:Panel>
    </form>
</body>
</html>
