<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HocVien.aspx.cs" Inherits="thitracnghiem.HocVien" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function Grid_BatchEditStartEditing(s, e) {
        var hoTenColumn = s.GetColumnByField("HOTEN");
        if (!e.rowValues.hasOwnProperty(hoTenColumn.index))
            return;
        var cellInfo = e.rowValues[hoTenColumn.index];
        hoTenTextBox.SetValue(cellInfo.value);
        if (e.focusedColumn === hoTenColumn)
            hoTenTextBox.SetFocus();
    }
    function Grid_BatchEditEndEditing(s, e) {
        var hoTenColumn = s.GetColumnByField("HOTEN");
        if (!e.rowValues.hasOwnProperty(hoTenColumn.index))
            return;
        var cellInfo = e.rowValues[hoTenColumn.index];
        cellInfo.value = hoTenTextBox.GetValue();
        cellInfo.text = hoTenTextBox.GetText();
        hoTenTextBox.SetValue(null);
    }
    function Grid_BatchEditRowValidating(s, e) {
        var hoTenColumn = s.GetColumnByField("HOTEN");
        var cellValidationInfo = e.validationInfo[hoTenColumn.index];
        if (!cellValidationInfo) return;
        var value = cellValidationInfo.value;
        if (!ASPxClientUtils.IsExists(value) || ASPxClientUtils.Trim(value) === "") {
            cellValidationInfo.isValid = false;
            cellValidationInfo.errorText = "Yêu cầu nhập họ tên";
        }
    }
    var preventEndEditOnLostFocus = false;
    function HoTenTextBox_KeyDown(s, e) {
        var keyCode = ASPxClientUtils.GetKeyCode(e.htmlEvent);
        if (keyCode !== ASPxKey.Tab) return;
        var moveActionName = e.htmlEvent.shiftKey ? "MoveFocusBackward" : "MoveFocusForward";
        if (grid.batchEditApi[moveActionName]()) {
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            preventEndEditOnLostFocus = true;
        }
    }
    function HoTenTextBox_LostFocus(s, e) {
        if (!preventEndEditOnLostFocus)
            grid.batchEditApi.EndEdit();
        preventEndEditOnLostFocus = false;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <table class="OptionsTable BottomMargin">
    <tr><td>
        <dx:ASPxLabel ID="EditModeLabel" runat="server" Text="Edit mode:" AssociatedControlID="EditModeCombo" />
    </td><td>
        <dx:ASPxComboBox runat="server" ID="EditModeCombo" AutoPostBack="true" SelectedIndex="0">
            <Items>
                <dx:ListEditItem Value="Cell" />
                <dx:ListEditItem Value="Row" />
            </Items>
        </dx:ASPxComboBox>
    </td></tr><tr><td>
        <dx:ASPxLabel ID="StartEditActionLabel" runat="server" Text="Start edit action:" AssociatedControlID="StartEditActionCombo" />
    </td><td>
        <dx:ASPxComboBox runat="server" ID="StartEditActionCombo" AutoPostBack="true" SelectedIndex="0">
            <Items>
                <dx:ListEditItem Value="Click" />
                <dx:ListEditItem Value="DblClick" />
            </Items>
        </dx:ASPxComboBox>
    </td></tr>
    </table>
    <br />
    <dx:ASPxGridView ID="Grid" runat="server" AutoGenerateColumns="False" 
        DataSourceID="HocVienSource" EnableTheming="True" KeyFieldName="MATS" 
        Theme="Aqua" ClientInstanceName="grid">
        <ClientSideEvents BatchEditEndEditing="Grid_BatchEditEndEditing" 
            BatchEditRowValidating="Grid_BatchEditRowValidating" 
            BatchEditStartEditing="Grid_BatchEditStartEditing" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Họ tên" FieldName="HOTEN" 
                VisibleIndex="3" Width="200px">
                 <EditItemTemplate>
                     <dx:ASPxTextBox ID="HoTenTextBox" runat="server" ClientInstanceName="hoTenTextBox" Width="100%">
                     <ClientSideEvents KeyDown="HoTenTextBox_KeyDown" LostFocus="HoTenTextBox_LostFocus" />
                     </dx:ASPxTextBox>
                 </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tên đăng nhập" FieldName="TENDN" 
                VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Mật khẩu" FieldName="MATKHAU" 
                VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" 
                ShowNewButtonInHeader="True" VisibleIndex="1">
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
                <PropertiesComboBox DataSourceID="MaDTSource" TextField="MADETHI" 
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
        <SettingsEditing Mode="Batch">
        </SettingsEditing>
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
