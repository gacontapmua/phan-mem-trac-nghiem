<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateMsWord.aspx.cs" Inherits="GenerateMsWord" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Generate Ms Word document</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Write your name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="req1" runat="server" ControlToValidate="txtName" Text="*"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btn" runat="server" OnClick="GenerateMsWordDoc" Text="Generate Ms Word Document" />
        <dx:ASPxButton ID="ASPxButton1" runat="server" onclick="ASPxButton1_Click" 
            Text="ASPxButton">
        </dx:ASPxButton>
    </div>
    </form>
</body>
</html>
