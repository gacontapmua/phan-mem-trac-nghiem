<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HocVien.aspx.cs" Inherits="thitracnghiem.HocVien" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="HocVienSource" EnableTheming="True" KeyFieldName="MATS" 
        Theme="Aqua">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Mã thí sinh" FieldName="MATS" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Họ tên" FieldName="HOTEN" VisibleIndex="3" 
                Width="200px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên đăng nhập" FieldName="TENDN" 
                VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mật khẩu" FieldName="MATKHAU" 
                VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" 
                ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="1">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Caption="Cấp bậc" FieldName="CAPBAC" 
                VisibleIndex="9" Width="20px">
                <PropertiesComboBox EnableFocusedStyle="False" DataSourceID="CapBacSource" 
                    TextField="TENCAPBAC" ValueField="MACAPBAC">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Chức vụ" FieldName="CHUCVU" 
                VisibleIndex="11">
                <PropertiesComboBox DataSourceID="ChucVuSource" TextField="TENCHUCVU" 
                    ValueField="MACHUCVU">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Đơn vị" FieldName="DONVI" 
                VisibleIndex="13">
                <PropertiesComboBox DataSourceID="DonViSource" TextField="TENDONVI" 
                    ValueField="MADONVI">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Số đề thi" FieldName="SODETHI" 
                VisibleIndex="19">
                <PropertiesComboBox DataSourceID="MaDTSource" TextField="SODETHI" 
                    ValueField="MADETHI">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tên bài TH" FieldName="TENBAITH" 
                VisibleIndex="20">
                <PropertiesComboBox DataSourceID="NhomVKSource" TextField="TENNHOM" 
                    ValueField="MANHOM">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsCommandButton>
            <NewButton Text="Thêm mới">
            </NewButton>
            <UpdateButton Text="Lưu">
            </UpdateButton>
            <CancelButton Text="Hủy">
            </CancelButton>
            <EditButton Text="Sửa">
            </EditButton>
            <DeleteButton Text="Xóa">
            </DeleteButton>
        </SettingsCommandButton>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="HocVienSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="SINHVIENs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="CapBacSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="CAPBACs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ChucVuSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="CHUCVUs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="DonViSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="DONVIs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="NhomVKSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="NHOMVKs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="MaDTSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="DETHIs">
    </asp:LinqDataSource>
</asp:Content>
