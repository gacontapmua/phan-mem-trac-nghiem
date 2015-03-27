<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrintDeThi.aspx.cs" Inherits="thitracnghiem.PrintDeThi" %>
<%@ Register assembly="DevExpress.XtraReports.v14.1.Web, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" 
        ReportTypeName="thitracnghiem.XtraReport1">
    </dx:ASPxDocumentViewer>

</asp:Content>
