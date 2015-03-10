<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="thitracnghiem.DangNhap" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style3
        {
            width: 500px;
            font-family: "Times New Roman", Times, serif;
            color: #FF0000;
            font-size: x-large;
            text-align: left;
        }
        .style5
        {
            width: 299px;
        }
        .style7
        {
            width: 95px;
            text-align: center;
            font-weight: bold;
            background-color: #ACECDE;
        }
        .style8
        {
            width: 97px;
        }
        .style9
        {}
        .style10
        {
            width: 299px;
            font-weight: bold;
            color: #003366;
            background-color: #ACECDE;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#ACECDE" Height="1000px" 
            Width="100%">
            <table style="width: 100%; height: 185px;">
                <tr>
                    <td class="style7" rowspan="5" width="700px">
                        &nbsp;</td>
                    <td class="style3" height="100px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        <strong style="text-align: left">CHƯƠNG TRÌNH THI TRẮC NGHIỆM</strong></td>
                </tr>
                <tr>
                    <td class="style3" height="50px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style10">
                        ĐĂNG NHẬP</td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderStyle="Double" 
                            Height="100px" Width="400px">
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style8">
                                        Tên đăng nhập</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="txtTenDN" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        Mật khẩu</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="txtMatKhau" runat="server" Password="True" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        &nbsp;</td>
                                    <td align="justify" class="style9">
                                        <dx:ASPxButton ID="btnDangNhap" runat="server" onclick="btnDangNhap_Click" 
                                            Text="Đăng nhập" Theme="Youthful" Width="50px">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnThoat" runat="server" Text="Thoát" Theme="Youthful" 
                                            Width="70px">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style8">
                                        &nbsp;</td>
                                    <td class="style9" colspan="2">
                                        <dx:ASPxLabel ID="lblError" runat="server">
                                        </dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
