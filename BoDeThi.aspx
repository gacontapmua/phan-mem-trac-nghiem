<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BoDeThi.aspx.cs" Inherits="thitracnghiem.BoDeThi" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 119px;
            text-align: center;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            color: #FF0000;
            font-size: large;
            background-color: #FFFFFF;
        }
        .style4
        {
            width: 162px;
        }
        .style5
        {
            width: 119px;
            text-align: center;
            font-weight: bold;
        }
        .style6
        {
            font-weight: bold;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:50%;">
        <tr>
            <td colspan="3" class="style2">
                <strong><span class="style3">LẬP ĐỀ THI</span></strong></td>
        </tr>
        <tr>
            <td colspan="3" class="style2">
                <dx:ASPxDateEdit ID="dateBDT" runat="server" AutoPostBack="True" 
                    Caption="Ngày tạo Bộ đề thi">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Tên loại vũ khí</td>
            <td class="style6" colspan="2">
                Số lượng câu hỏi</td>
            
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="AK" Theme="Office2003Olive">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoAK" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="K54">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoK54" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="CKC">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoCKC" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="RPD">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoRPD" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
             
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="PKMS">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoPKMS" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="CỐI">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoCoi" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="SMPK">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoSMPK" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="DKZ">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoDKZ" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
           
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="B41">
                </dx:ASPxLabel>
            </td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtNoB41" runat="server" Width="170px" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxButton ID="btnClear" runat="server" Text="Xóa dữ liệu" Theme="Aqua" 
                    onclick="btnClear_Click">
                </dx:ASPxButton>
            </td>
            <td class="style4">
                <dx:ASPxButton ID="btnCreate" runat="server" Text="Tạo bộ đề thi" Theme="Aqua" 
                    onclick="btnCreate_Click">
                </dx:ASPxButton>
            </td>
            
            <td>
                <dx:ASPxButton ID="btnCreateDefault" runat="server" style="margin-left: 3px" 
                    Text="Tạo bộ đề thi mặc định" Theme="Aqua">
                </dx:ASPxButton>
            </td>
            
        </tr>
    </table>
    <dx:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
        Caption="BỘ ĐỀ THI" DataSourceID="MasterSource" EnableTheming="True" 
        KeyFieldName="MABODT" Theme="Aqua" Width="60%">
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" 
                Width="20px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Tổng số câu" FieldName="SOCAUHOI" 
                VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày tạo" FieldName="NGAYTAO" 
                VisibleIndex="2">
                <PropertiesDateEdit DisplayFormatString="">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gridDetail" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="DetailSource" EnableTheming="True" 
                    onbeforeperformdataselect="gridDetail_BeforePerformDataSelect" Theme="Aqua">
                    <Columns>
                        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Câu hỏi" FieldName="NOIDUNG" 
                            VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataImageColumn Caption="Hình ảnh" FieldName="HINHANH" 
                            VisibleIndex="3">
                            <PropertiesImage ImageHeight="60px" ImageUrlFormatString="~/Image/{0}" 
                                ImageWidth="60px">
                            </PropertiesImage>
                        </dx:GridViewDataImageColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Nhóm VK" FieldName="MANHOM" 
                            VisibleIndex="5">
                            <PropertiesComboBox DataSourceID="NhomVKSource" TextField="TENNHOM" 
                                ValueField="MANHOM">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="MasterSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="BODETHIs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="DetailSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" EntityTypeName="" 
        TableName="BODETHI_CAUHOIs" Where="MABODT == @MABODT">
        <WhereParameters>
            <asp:SessionParameter Name="MABODT" SessionField="MABODT" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="NhomVKSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="NHOMVKs">
    </asp:LinqDataSource>
</asp:Content>
