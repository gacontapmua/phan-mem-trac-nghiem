<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThiOnline.aspx.cs" Inherits="thitracnghiem.ThiOnline" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTimer" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script type="text/javascript">
           var demoCounter;
           
           function demoInit() {
               demoCounter = 90;
               demoGetButtonElement().disabled = true;
            
               demoUpdate();
           }
           function demoTick() {
               demoCounter -= 1;
               demoUpdate();
           }
           function demoUpdate() {
               if (demoCounter > 0)
                   document.getElementById("lblCountDown").innerHTML = demoCounter;
               else {
                   Timer1.SetEnabled(false);
                  
               }
           }
         
    </script>
    <script runat="server" type="text/c#">
        protected void Timer2_Tick(object sender, EventArgs e)
    {
        lblCountDown.Text = "Thời gian: " + DateTime.Now.ToLongTimeString();
        string endtime =(string) Session["thoigian"];
            if (DateTime.Now.ToShortTimeString() == endtime)
        {
            Timer2.Enabled = false;
            lblCountDown.Text = "HẾT GIỜ";
            btnTiepTheo.Visible = false;
            
        }
    }
    </script>
    <style type="text/css">
        .style1
        {
            width: 825px;
        }
        .style2
        {
            width: 70%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: justify; vertical-align: middle; " class="style2">
    
        <table style="border: thin double #CCCC00" >
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td width="100px">
                    <dx:ASPxImage ID="ASPxImage1" runat="server" 
                        ImageUrl="~/image/200px-Vietnam_People's_Army_signal.jpg">
                    </dx:ASPxImage>
                </td>
                <td>
                    Tên kỳ thi: 
                    <dx:ASPxLabel ID="lblTenKT" runat="server" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: medium">
                    </dx:ASPxLabel>
                    <br />
                    Thời gian: &nbsp;90&#39;&nbsp;<br />
                    Mã SV:
                    <dx:ASPxLabel ID="lblMaSV" runat="server" 
                        style="font-family: 'Times New Roman', Times, serif; font-size: medium">
                    </dx:ASPxLabel>
                    <br />
                    Họ tên SV:<dx:ASPxLabel ID="lblHoTenSV" runat="server" 
                        style="font-size: medium; font-family: 'Times New Roman', Times, serif">
                    </dx:ASPxLabel>
&nbsp;</td>
                <td>
                                <dx:ASPxButton ID="btnStart" Width="50" Height="50" runat="server" Text="BẮT ĐẦU" 
                                    Theme="Aqua" HorizontalAlign="Left" onclick="btnStart_Click">
                                </dx:ASPxButton>
                            
                                </td>
            </tr>
            <tr>
                <td align="left" class="style1">
                    &nbsp;</td>
                <td colspan="2" align="left">
                    <table >
                        <tr>
                            <td valign="top">
                                <dx:ASPxMemo ID="txtCauHoi" runat="server" Height="200px" Width="500px" 
                                    ClientInstanceName="txtCauHoi"  
                                    Font-Size="Large" ReadOnly="True" >
                                </dx:ASPxMemo>
                            </td>
                            <td >
                                <dx:ASPxImage ID="imgCauHoi" runat="server" Width="300px" Height="200px" 
                                    ClientInstanceName="imgCauHoi">
                                
                                </dx:ASPxImage>
                            </td>
                        </tr>
                        </table>
                </td>
                <td rowspan="3" style="text-align: left; vertical-align: top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right" class="style1">
                     
                  
                                &nbsp;</td>
                <td colspan="2" style="text-align: right">
                     
                  
                                <dx:ASPxRadioButtonList ID="radListDA" runat="server" Theme="Aqua" 
                                    ValueType="System.String" Width="800px">
                                </dx:ASPxRadioButtonList>
                   
                </td>
            </tr>
            <tr>
                <td style="text-align: right" class="style1">
                     
                  
                                &nbsp;</td>
                <td style="text-align: right">
                     
                                <dx:ASPxButton ID="btnTiepTheo" Width="50" Height="50" runat="server" Text="Câu tiếp theo" 
                                    Theme="Aqua" HorizontalAlign="Left" onclick="btnTiepTheo_Click">
                                </dx:ASPxButton>
                            
                                <dx:ASPxButton ID="btnNopBai" Width="50" Height="50" runat="server" Text="Nộp bài" 
                                    Theme="Aqua" HorizontalAlign="Left" onclick="btnNopBai_Click">
                                </dx:ASPxButton>
                   
                                <br />
                                <dx:ASPxLabel ID="lblNotify" runat="server">
                                </dx:ASPxLabel>
                   
                </td>
                <td style="text-align: right">
                     
                  
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <dx:ASPxTimer ID="ASPxTimer1" runat="server" ClientInstanceName="Timer1" 
                                            Interval="1000">
                                            <ClientSideEvents Init="function(s, e) {
	 demoInit();
}" Tick="function(s, e) {
	 demoTick();
}" />
                                        </dx:ASPxTimer>
                                        <asp:Timer ID="Timer2" runat="server" Interval ="1000" OnTick="Timer2_Tick" 
                                            Enabled="False">
                                        </asp:Timer>
                                        <dx:ASPxLabel ID="lblCountDown" runat="server"  
                                            ClientInstanceName="lblCountDown" Text="">
                                        </dx:ASPxLabel>
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                
                 
                                <br />
                                
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
                </td>
            </tr>
            </table>
        
    </div>
    </form>
</body>
</html>
