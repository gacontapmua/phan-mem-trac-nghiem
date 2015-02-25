<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestNCH.aspx.cs" Inherits="thitracnghiem.TestNCH" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <script type="text/javascript">
     function OnUpdateClick() {
         uploader.UploadFile();
     }
    </script>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="thitracnghiem.QLTHITNDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" TableName="CAUHOIs">
        <InsertParameters>
                     
                    <asp:Parameter Name="noidung" Type="String" />
                    <asp:SessionParameter SessionField="uploadedFileData" Name="hinhanh" DbType="string" />
                </InsertParameters>
    </asp:LinqDataSource>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LinqDataSource1" KeyFieldName="MACH" 
        onrowinserting="ASPxGridView1_RowInserting">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" 
                ShowNewButtonInHeader="True" VisibleIndex="0" 
                ShowInCustomizationForm="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="NOIDUNG" VisibleIndex="1" 
                ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataImageColumn Caption="HINHANH" VisibleIndex="2" 
                ShowInCustomizationForm="True" FieldName="HINHANH">
            <PropertiesImage ImageHeight="60" ImageWidth="60" imageurlformatstring="~/{0}" showloadingimage="True"></PropertiesImage>
            </dx:GridViewDataImageColumn>
            
        </Columns>
        <Templates>
        <EditForm>
            <div style="padding: 4px 4px 3px 4px">
                <dx:ASPxPageControl ID="pageControl" Width="100%" Height="140px" runat="server" ActiveTabIndex="1">
                    <TabPages>
                        <dx:TabPage Text="General">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <dx:ASPxLabel ID="lblCauHoi" runat="server" Text="Nội dung câu hỏi">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCauHoi" runat="server" Text='<%# Eval("NOIDUNG") %>' 
                                        Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Foto">
                            <ContentCollection>
                                <dx:ContentControl runat="server">
                                    <table style="width:100%;" id="table1">
                                        <tr>
                                            <td valign="top" align="center" class="content">
                                                <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td align="center" style="padding-right: 20px; vertical-align: top;">
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td style="white-space:nowrap; padding-right: 5px;">
                                                                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select image:"  AssociatedControlID="uplImage">
                                                                                </dx:ASPxLabel>
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxUploadControl ID="uplImage" ClientInstanceName="uploader" runat="server" Width="280px" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete">
                                                                                 <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe" MaxFileSize="4000000">
                                                                                    </ValidationSettings>
                                                                                    <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { grid.UpdateEdit(); }}" />
                                                                                </dx:ASPxUploadControl>
                                                                            </td>
                                                                        </tr>
                                                                     </table>   
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
                      
                 <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                    <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server">
                    </dx:ASPxGridViewTemplateReplacement>
                        
            </div>
        </EditForm>
        </Templates>
    </dx:ASPxGridView>
</asp:Content>
