<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThiOnline.aspx.cs" Inherits="thitracnghiem.ThiOnline" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallback" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 152px;
        }
        .style5
        {
            width: 6px;
        }
        .style6
        {
            width: 109px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; background-color: #99CCFF; font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 100; font-style: normal; color: #000080;" 
            align="center">
            <tr>
                <td>
                    Logo</td>
                <td colspan="2">
                    Tên kỳ thi:<br />
                    Thời gian:<br />
                    Mã SV: Họ tên SV:</td>
                <td>
                    Nộp bài</td>
            </tr>
            <tr>
                <td colspan="3">
                    <table style="width:57%;">
                        <tr>
                            <td class="style1">
                                <dx:ASPxCallback ID="ASPxCallback1" runat="server" 
                                    ClientInstanceName="ASPxClientCallback" oncallback="ASPxCallback1_Callback">
                                    <ClientSideEvents CallbackComplete="function(s, e) {
   if (e.result != &quot;&quot;) {
                var strResults = e.result;
                var OrgInfo = strResults.split(&quot;|&quot;);
                document.getElementById('txtCauHoi').innerHTML = OrgInfo[0].toString();
                imgCauHoi.SetImageUrl(OrgInfo[1].toString());
				document.getElementById('txtDapAn').innerHTML = OrgInfo[2].toString();
				
}
	 
           
}" />
                                </dx:ASPxCallback>
                                <dx:ASPxMemo ID="txtCauHoi" runat="server" Height="70px" Width="350px" 
                                    ClientInstanceName="txtCauHoi" ontextchanged="txtCauHoi_TextChanged" >
                                </dx:ASPxMemo>
                            </td>
                            <td >
                                <dx:ASPxImage ID="imgCauHoi" runat="server" Width="150" Height="150px"  
                                    ShowLoadingImage="true" ClientInstanceName="imgCauHoi">
                                
                                </dx:ASPxImage>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <dx:ASPxMemo ID="txtDapAn" runat="server" Height="200px" Width="500px">
                                </dx:ASPxMemo>
                            </td>
                        </tr>
                    </table>
                </td>
                <td rowspan="3">
                    <dx:ASPxListBox ID="listCauHois" runat="server">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	ASPxClientCallback.PerformCallback('1');
}" />
                    </dx:ASPxListBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                     
                  
                                <dx:ASPxButton ID="ASPxButton1" Width="50" Height="50"  runat="server" Text="A" 
                                    Theme="Aqua" HorizontalAlign="Left">
                                    <HoverStyle BackColor="#FFFFCC">
                                    </HoverStyle>
                                </dx:ASPxButton>
                            
                                <dx:ASPxButton ID="ASPxButton2" Width="50" Height="50" runat="server" Text="B" 
                                    Theme="Aqua" HorizontalAlign="Left">
                                </dx:ASPxButton>
                            
                                <dx:ASPxButton ID="ASPxButton3" Width="50" Height="50" runat="server" Text="C" 
                                    Theme="Aqua" HorizontalAlign="Left">
                                </dx:ASPxButton>
                            
                                <dx:ASPxButton ID="ASPxButton4" Width="50" Height="50" runat="server" Text="D" 
                                    Theme="Aqua" HorizontalAlign="Left">
                                </dx:ASPxButton>
                   
                </td>
            </tr>
            <tr>
                <td style="padding: inherit">
                    &nbsp;</td>
                <td style="padding: inherit" class="style6">
                    Thời gian còn lại<br />
                    <dx:ASPxLabel ID="ASPxLabel1" capt runat="server" Theme="Aqua">
                    </dx:ASPxLabel>
                </td>
                <td class="style5" style="padding: inherit">
                    Thông tin làm bài thi<br />
                    Số câu đã làm<br />
                    Số câu chưa làm</td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
