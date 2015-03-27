<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LapKyThi.aspx.cs" Inherits="thitracnghiem.LapKyThi" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxFormLayout" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v14.1.Web, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
    function OnNameValidation(s, e) {
        var name = e.value;
        if (name == null)
            return;
        if (name.length <= 0)
            e.isValid = false;
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" 
        DataSourceID="KyThiSource" Width="500px">
        <Items>
            <dx:LayoutGroup Caption="Thông tin kỳ thi">
                <Items>
                    <dx:LayoutItem Caption="Tên kỳ thi" FieldName="TENKYTHI">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtTenKT" runat="server" ClientInstanceName="txtTenKT" 
                                    OnValidation="txtTenKT_Validation" Width="100%">
                                    <ClientSideEvents Validation="OnNameValidation" />
                                    <ValidationSettings ErrorText="Phải đặt tên kỳ thi" SetFocusOnError="True">
                                        <RequiredField ErrorText="Yêu cầu đặt tên" IsRequired="True" />
                                    </ValidationSettings>
                                    <InvalidStyle BackColor="LightPink">
                                    </InvalidStyle>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Ngày thi" FieldName="NGAYTHI">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="dateNgayThi" runat="server" 
                                    ClientInstanceName="dateNgayThi" Width="100%">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Mã bộ đề thi" FieldName="MABODT">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox ID="cbBoDT" runat="server" ClientInstanceName="cbBoDT" 
                                    DataSourceID="BoDeThiSource" ValueField="MABODT" Width="100%">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Mã bộ đề thi" FieldName="MABODT" />
                                        <dx:ListBoxColumn Caption="Ngày lập" FieldName="NGAYTAO" />
                                    </Columns>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Số đề thi" FieldName="SODETHI">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtSoDT" runat="server" ClientInstanceName="txtSoDT" 
                                    Width="100%">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
            <dx:LayoutGroup Caption="" ColCount="2">
                <Items>
                    <dx:LayoutItem Caption="" HorizontalAlign="Left" VerticalAlign="Middle">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnNew" runat="server" ClientInstanceName="btnNew" 
                                    OnClick="btnNew_Click" Text="Tạo mới">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" HorizontalAlign="Left" VerticalAlign="Middle">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxButton ID="btnSave" runat="server" ClientInstanceName="btnSave" 
                                    OnClick="btnSave_Click" Text="Lưu thông tin">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="" ColSpan="2">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtError" runat="server" ClientInstanceName="txtError" 
                                    ForeColor="Red" Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        Caption="Danh sách kỳ thi" DataSourceID="KyThiSource" EnableTheming="True" 
        KeyFieldName="MAKYTHI" Theme="Aqua" Width="500px" 
        oncustombuttoncallback="ASPxGridView1_CustomButtonCallback">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnCusPrintDT" Text="In các đề thi">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="MAKYTHI" 
                VisibleIndex="1" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TENKYTHI" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="NGAYTHI" 
                VisibleIndex="3">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="MABODT" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SODETHI" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsText CommandDelete="Bạn có muốn xóa kỳ thi này không?" />
        <SettingsCommandButton>
            <DeleteButton Text="Xóa">
            </DeleteButton>
        </SettingsCommandButton>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="KyThiSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="KYTHIs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="BoDeThiSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="BODETHIs">
    </asp:LinqDataSource>
    <br />
</asp:Content>
