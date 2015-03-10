<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LapDSThiSinh.aspx.cs" Inherits="thitracnghiem.LapDSThiSinh" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpreadsheet.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpreadsheet" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <dx:ASPxGridView ID="Grid" runat="server" AutoGenerateColumns="False" 
            ClientInstanceName="grid" DataSourceID="ThiSinhSource" EnableRowsCache="False" 
            EnableTheming="True" KeyFieldName="MATS" Theme="Aqua">
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" 
                    VisibleIndex="0">
                </dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="ThiSinhSource" runat="server" 
            ContextTypeName="thitracnghiem.QLTHITNDataContext" EnableDelete="True" 
            EnableInsert="True" EnableUpdate="True" TableName="SINHVIENs">
        </asp:LinqDataSource>
    </p>
</asp:Content>
