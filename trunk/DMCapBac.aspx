<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DMCapBac.aspx.cs" Inherits="thitracnghiem.DMCapBac" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
    function Grid_BatchEditStartEditing(s, e) {
        var tenCBColumn = s.GetColumnByField("TENCAPBAC");
        if (!e.rowValues.hasOwnProperty(tenCBColumn.index))
            return;
        var cellInfo = e.rowValues[tenCBColumn.index];
        tenCBTextBox.SetValue(cellInfo.value);
        if (e.focusedColumn === tenCBColumn)
            tenCBTextBox.SetFocus();
    }
    function Grid_BatchEditEndEditing(s, e) {
        var tenCBColumn = s.GetColumnByField("TENCAPBAC");
        if (!e.rowValues.hasOwnProperty(tenCBColumn.index))
            return;
        var cellInfo = e.rowValues[tenCBColumn.index];
        cellInfo.value = tenCBTextBox.GetValue();
        cellInfo.text = tenCBTextBox.GetText();
        tenCBTextBox.SetValue(null);
    }
    function Grid_BatchEditRowValidating(s, e) {
        var tenCBColumn = s.GetColumnByField("TENCAPBAC");
        var cellValidationInfo = e.validationInfo[tenCBColumn.index];
        if (!cellValidationInfo) return;
        var value = cellValidationInfo.value;
        if (!ASPxClientUtils.IsExists(value) || ASPxClientUtils.Trim(value) === "") {
            cellValidationInfo.isValid = false;
            cellValidationInfo.errorText = "Yêu cầu nhập tên cấp bậc";
        }
    }
    var preventEndEditOnLostFocus = false;
    function TenCBTextBox_KeyDown(s, e) {
        var keyCode = ASPxClientUtils.GetKeyCode(e.htmlEvent);
        if (keyCode !== ASPxKey.Tab) return;
        var moveActionName = e.htmlEvent.shiftKey ? "MoveFocusBackward" : "MoveFocusForward";
        if (grid.batchEditApi[moveActionName]()) {
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            preventEndEditOnLostFocus = true;
        }
    }
    function TenCBTextBox_LostFocus(s, e) {
        if (!preventEndEditOnLostFocus)
            grid.batchEditApi.EndEdit();
        preventEndEditOnLostFocus = false;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False" 
        DataSourceID="CapBacSource" EnableRowsCache="False" Width="100%" 
        EnableTheming="True" KeyFieldName="MACAPBAC" 
        Theme="Aqua">
        <ClientSideEvents BatchEditEndEditing="Grid_BatchEditEndEditing" 
            BatchEditRowValidating="Grid_BatchEditRowValidating" 
            BatchEditStartEditing="Grid_BatchEditStartEditing" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" 
                ShowNewButtonInHeader="True" VisibleIndex="0" Width="40px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Tên cấp bậc" FieldName="TENCAPBAC" 
                VisibleIndex="1">
                 <EditItemTemplate>
                    <dx:ASPxTextBox ID="TenCBTextBox" runat="server" ClientInstanceName="tenCBTextBox" Width="100%">
                        <ClientSideEvents KeyDown="TenCB_KeyDown" LostFocus="TenCBTextBox_LostFocus" />
                    </dx:ASPxTextBox>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing Mode="Batch">
            <BatchEditSettings EditMode="Row" />
        </SettingsEditing>
        <SettingsCommandButton>
            <NewButton Text="Thêm mới">
            </NewButton>
            <UpdateButton Text="Lưu">
            </UpdateButton>
            <CancelButton Text="Hủy">
            </CancelButton>
            <DeleteButton Text="Xóa">
            </DeleteButton>
        </SettingsCommandButton>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="CapBacSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="CAPBACs" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
</asp:Content>
