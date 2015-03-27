<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BoDeThi.aspx.cs" Inherits="thitracnghiem.BoDeThi" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<script runat="server">

   
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
     
        .style1
        {
            font-size: large;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            width: 93px;
            font-weight: bold;
        }
        .style4
        {
            font-size: large;
            width: 122px;
        }
        .style5
        {
            font-size: large;
            width: 93px;
        }
        .style6
        {
            color: #6699FF;
        }
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <table style="width:50%;">
        <tr>
            <td colspan="3" class="style2">
                <strong><span class="style1">LẬP ĐỀ THI</span></strong></td>
        </tr>
        <tr>
            <td colspan="3" class="style2">
                <dx:ASPxDateEdit ID="dateBDT" runat="server" AutoPostBack="True" 
                    Caption="Ngày tạo Bộ đề thi" 
                    ClientInstanceName="dateBDT">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="style2">
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr class="style6">
            <td class="style3" style="border: thin groove #00FFFF">
                Tên loại vũ khí</td>
            <td class="bold" colspan="2" align="left" valign="top" 
                style="border: thin groove #00FFFF">
                Số lượng câu hỏi</td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="AK" Theme="Office2003Olive">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoAK" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="K54">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoK54" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="CKC">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoCKC" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="RPD">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoRPD" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
             
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="PKMS">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoPKMS" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
           
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="CỐI">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoCoi" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
           
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="SMPK">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoSMPK" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="DKZ">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoDKZ" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
           
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="B41">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtNoB41" runat="server" Width="100%" Text="0">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="I">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtI" runat="server" Text="0" Width="170px">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5" style="border: thin groove #00FFFF">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="II">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="border: thin groove #00FFFF">
                <dx:ASPxTextBox ID="txtII" runat="server" Text="0" Width="170px">
                </dx:ASPxTextBox>
            </td>
            
        </tr>
        <tr>
            <td class="style5">
                <dx:ASPxButton ID="btnClear" runat="server" Text="Xóa số liệu" 
                    Theme="Aqua" onclick="btnClear_Click">
                </dx:ASPxButton>
            </td>
            <td class="style4">
                <dx:ASPxButton ID="btnCreateQuestion" runat="server" Text="Tạo bộ câu hỏi" 
                    Theme="Aqua" onclick="btnCreateQuestion_Click" 
                    PostBackUrl="~/BoDeThi.aspx" UseSubmitBehavior="False" ViewStateMode="Disabled">
                </dx:ASPxButton>
            </td>
            
            <td>
                &nbsp;</td>
            
        </tr>
    </table>
    
    <dx:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
        Caption="BỘ ĐỀ THI" DataSourceID="MasterSource" EnableTheming="True" 
        KeyFieldName="MABODT" Theme="Aqua" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" 
                Width="20px" ShowDeleteButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Tổng số câu" FieldName="SOCAUHOI" 
                VisibleIndex="3" Width="30px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày tạo" FieldName="NGAYTAO" 
                VisibleIndex="2">
                <PropertiesDateEdit DisplayFormatString="">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager PageSize="5">
        </SettingsPager>
        <SettingsText CommandDelete="Bạn muốn xóa bộ đề thi này?" />
        <SettingsDetail ShowDetailRow="True" />

<SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

<SettingsText CommandDelete="Bạn muốn x&#243;a bộ đề thi n&#224;y?"></SettingsText>

<SettingsDetail ShowDetailRow="True"></SettingsDetail>

        <SettingsCommandButton>
            <DeleteButton Text="Xóa">
            </DeleteButton>
        </SettingsCommandButton>
        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />

<SettingsDataSecurity AllowInsert="False" AllowEdit="False"></SettingsDataSecurity>

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
                                ImageWidth="60px"></PropertiesImage>
                        </dx:GridViewDataImageColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Nhóm VK" FieldName="MANHOM" 
                            VisibleIndex="5">
                            <PropertiesComboBox DataSourceID="NhomVKSource" TextField="TENNHOM" 
                                ValueField="MANHOM"></PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" />
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="MasterSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" 
    TableName="BODETHIs" EnableDelete="True">
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
