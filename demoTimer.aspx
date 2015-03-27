<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demoTimer.aspx.cs" Inherits="thitracnghiem.demoTimer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
<asp:ScriptManager ID= "SM1" runat="server"></asp:ScriptManager>
<asp:Timer ID="timer1" runat="server" Interval="1000" OnTick="timer1_tick"></asp:Timer>
        <br />
</div>
<pre><div>
<asp:UpdatePanel id="updPnl" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<asp:Label ID="lblTimer" runat="server"></asp:Label>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="timer1" EventName ="tick" />
</Triggers>
</asp:UpdatePanel>
</div>
    </div>
    </form>
</body>
</html>
