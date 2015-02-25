<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NhapCauHoi.aspx.cs" Inherits="thitracnghiem.NhapCauHoi" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Styles/DragAndDrop.css">
 <script type="text/javascript">
     function OnUpdateClick() {
         uploader.UploadFile();
       
     }
   
    </script>
      <style type="text/css">
        .note {
            color: black;
        }
          </style>
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"  ClientIDMode="AutoID"
        ClientInstanceName="grid" KeyFieldName="MACH" 
        onrowinserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating" DataSourceID="LinqDataSource1" 
        EnableTheming="True" Theme="Aqua" Width="100%"    
        OnCellEditorInitialize="grid_CellEditorInitialize" >
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" 
                ShowNewButtonInHeader="True" VisibleIndex="0" ShowDeleteButton="True" 
                ShowEditButton="True" Width="50px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="NOIDUNG" VisibleIndex="2" 
                Caption="Nội dung câu hỏi">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataImageColumn  Caption="Hình ảnh" FieldName="HINHANH" Name="Image"
                VisibleIndex="3">
                <PropertiesImage ImageHeight="60" ImageWidth="60" ImageUrlFormatString="~/Image/{0}">
                </PropertiesImage>
            </dx:GridViewDataImageColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhóm vũ khí" FieldName="MANHOM" 
                VisibleIndex="5" Width="50px">
                <PropertiesComboBox DataSourceID="LinqDataSource2" TextField="TENNHOM" 
                    ValueField="MANHOM">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>

        <SettingsPager NumericButtonCount="5">
        </SettingsPager>

        <Settings ShowFilterRow="True" ShowGroupPanel="True" />

        <SettingsDetail ShowDetailRow="True" />

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
            <ClearFilterButton Text="Bỏ lọc">
            </ClearFilterButton>
        </SettingsCommandButton>

        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gridDetail" runat="server" AutoGenerateColumns="False" 
                    ClientInstanceName="gridDetail" DataSourceID="DapAnSource" KeyFieldName="MADA"
                    onbeforeperformdataselect="gridDetail_BeforePerformDataSelect" 
                    oninitnewrow="gridDetail_InitNewRow" 
                    onrowinserting="gridDetail_RowInserting" Width="70%">
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" 
                            VisibleIndex="0" ShowEditButton="True" Width="50px">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Đáp án" FieldName="NOIDUNGDA" 
                            VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn Caption="Đáp án đúng" FieldName="DADUNG" 
                            VisibleIndex="2" Width="20px">
                        </dx:GridViewDataCheckColumn>
                    </Columns>
                </dx:ASPxGridView>
            </DetailRow>
            <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" Height="140px"
                            ActiveTabIndex="0">

                    <TabPages>
                        <dx:TabPage Text="Câu hỏi">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                <table>
                                    <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nội dung">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td> <dx:ASPxMemo ID="txtNoidung" runat="server" Height="71px" Width="300px" 
                                        Text='<%# Eval("NOIDUNG") %>'>
                                    </dx:ASPxMemo></td>
                                    </tr>
                                    <tr>
                                     <td>
                                         <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Nhóm câu hỏi">
                                         </dx:ASPxLabel>
                                     </td>
                                    <td><dx:ASPxComboBox ID="cbNhomVK" runat="server" ValueType="System.Int32" 
                                        DataSourceID="LinqDataSource2" TextField="TENNHOM" 
                                        ValueField="MANHOM" Value='<%# Eval("MANHOM") %>'>
                                    
                                    </dx:ASPxComboBox></td>
                                    </tr>
                                </table>
                                   
                                    
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Hình ảnh câu hỏi">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                 <table border="0" cellpadding="0" cellspacing="0" id="Table1">
                                                <tr>
                                                    <td valign="top" align="center" class="content">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="center" style="padding-right: 20px; vertical-align: top;">
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="white-space:nowrap; padding-right: 5px;">
                                                                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Chọn hình upload:" AssociatedControlID="ASPxUploadControl1">
                                                                                </dx:ASPxLabel>
                                                                             </td>
                                                                             <td>
                                                                                 <dx:ASPxUploadControl ID="ASPxUploadControl1" ClientInstanceName="uploader" Size="35" runat="server" 
                                                                                 OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
                                                                                 <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe" MaxFileSize="4000000"></ValidationSettings>
                                                                                 <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { grid.UpdateEdit(); }}" />
                                                                                 </dx:ASPxUploadControl>
                                                                             </td>
                                                                             </tr>
                                                                             <tr>
                                                                             <td>   </td>
                                                                             <td class="note">
                                                                                 <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Allowed ContentTypes: image/jpeg" Font-Size="8pt">

                                                                                 </dx:ASPxLabel>
                                                                                 <br>
                                                                                 <br>
                                                                                 <br></br>
                                                                                 <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="8pt" 
                                                                                     Text="Maximum file size: 4Mb">
                                                                                 </dx:ASPxLabel>
                                                                                 <br></br>
                                                                                 </br>
                                                                                 </br>
                                                                             </td>
                                                                                
                                                                             </tr>
                                                                          
                                                                             </table>
                                                                             </td>
                                                                             </tr>
                                                                             </table>
                                                                             </td>
                                                                             </tr>
                                                                             </table>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>

                </dx:ASPxPageControl>
                 </div>
                  
                  
                  
                  <div style="text-align: right; padding: 2px 2px 2px 2px">
                      <a href="#" onclick="OnUpdateClick()">Update</a>
                                         
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                </div>
            </EditForm>
        </Templates>

    </dx:ASPxGridView>
    &nbsp;<asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="CAUHOIs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource2"  runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" TableName="NHOMVKs">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="DapAnSource" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext"  EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" EntityTypeName="" 
        TableName="DAPANs" 
        Where="MACH == @MACH">
        <WhereParameters>
            <asp:SessionParameter Name="MACH" SessionField="MACH" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
