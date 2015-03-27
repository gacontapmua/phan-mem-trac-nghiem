<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="thitracnghiem.DangNhap" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
      
        .style1
        {
            width: 412px;
        }
        .style2
        {
            color: #A7A7A7;
        }
      
        .style3
        {
            color: #A7A7A7;
        }
      
        .newStyle1
        {
            font-family: tahoma;
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" Height="1000px" 
            Width="100%" BackColor="#F7F7F7">
            <table style="width: 100%; height: 185px;">
                <tr>
                    <td class="style7" rowspan="3" width="400px">
                        &nbsp;</td>
                    <td class="style1" align="center">
                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageAlign="Middle" 
                            ImageUrl="~/image/touch-icon-192x192.png" style="text-align: center" 
                            TabIndex="-1" Theme="Aqua">
                        </dx:ASPxImage>
                    </td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Panel ID="Panel2" runat="server" BackColor="#F7F7F7" BorderStyle="None" 
                            Height="250px" Width="460px">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style2">
                                        <strong>Tên đăng nhập</strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxTextBox ID="txtTenDN" runat="server" Height="30px" Width="450px">
                                            <Border BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="2px" />
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        <strong>Mật khẩu</strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxTextBox ID="txtMatKhau" runat="server" Height="30px" Password="True" 
                                            Width="450px">
                                            <Border BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="2px" />
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9" align="center">
                                        <dx:ASPxButton ID="btnDangNhap" runat="server" BackColor="#707070" 
                                            Font-Size="Large" ForeColor="#A4A4A4" Height="48px" onclick="btnDangNhap_Click" 
                                            Text="Đăng nhập" Theme="Youthful" Width="210px">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style9">
                                        <dx:ASPxLabel ID="lblError" runat="server">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="style1">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
