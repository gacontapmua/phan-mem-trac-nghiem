<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LapKyThi.aspx.cs" Inherits="thitracnghiem.LapKyThi" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxFormLayout" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                                    Width="170px">
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Ngày thi" FieldName="NGAYTHI">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="dateNgayThi" runat="server" 
                                    ClientInstanceName="dateNgayThi">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Mã bộ đề thi" FieldName="MABODT">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxSpinEdit ID="cbBoDT" runat="server" ClientInstanceName="cbBoDT" 
                                    Number="0">
                                </dx:ASPxSpinEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Số đề thi" FieldName="SODETHI">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox ID="txtSoDT" runat="server" ClientInstanceName="txtSoDT" 
                                    Width="170px">
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
                                    Text="Lưu thông tin">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        Caption="Lập kỳ thi" DataSourceID="KyThiSource" EnableTheming="True" 
        KeyFieldName="MAKYTHI" Theme="Aqua">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="MAKYTHI" 
                VisibleIndex="0" ReadOnly="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TENKYTHI" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="NGAYTHI" 
                VisibleIndex="2">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="MABODT" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SODETHI" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="KyThiSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="KYTHIs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="BoDeThiSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="BODETHIs">
    </asp:LinqDataSource>
</asp:Content>
