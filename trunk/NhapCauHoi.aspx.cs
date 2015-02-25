using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxTabControl;
using System.Collections.Specialized;
using System.Text;
using System.IO;
using DevExpress.Web;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxClasses;
using DevExpress.Web.ImageControls.Internal;
using System.Drawing;
using DevExpress.Web.Internal;
namespace thitracnghiem
{
    public partial class NhapCauHoi : System.Web.UI.Page
    {
        QLTHITNDataContext db = new QLTHITNDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid.DataBind();
                grid.DetailRows.ExpandRow(0);
            }
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            //e.CallbackData = String.Format("Image\\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
            string path = Page.MapPath("~/Image/") + e.UploadedFile.FileName;
            e.UploadedFile.SaveAs(path);
            Session["data"] = e.UploadedFile.FileName;
            
        }
        
         
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            ASPxGridView grid = sender as ASPxGridView;
            ASPxMemo textBox = FindPageControl(grid).FindControl("txtNoidung") as ASPxMemo;
         
            ASPxComboBox nhomvk = FindPageControl(grid).FindControl("cbNhomvk") as ASPxComboBox;
           
            e.NewValues["NOIDUNG"] = textBox.Text;
            
            e.NewValues["MANHOM"] = nhomvk.SelectedItem.Value;
            //e.Cancel = !SaveFileBytesToRow(grid, e.NewValues);
            if (Session["data"] != null)
            {
                e.NewValues["HINHANH"] = (string)Session["data"];//uploader.FileBytes;
                Session.Remove("data");
            }
          
        }
        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "MANHOM")
            {
                ASPxComboBox cmb = e.Editor as ASPxComboBox;
                cmb.DataSource = LinqDataSource2;
                cmb.ValueField = "MANHOM";
                cmb.ValueType = typeof(Int32);
                cmb.TextField = "TENNHOM";
                cmb.DataBindItems();
            }
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            ASPxGridView grid = sender as ASPxGridView;
            ASPxMemo textBox = FindPageControl(grid).FindControl("txtNoidung") as ASPxMemo;
          
            ASPxComboBox nhomvk = FindPageControl(grid).FindControl("cbNhomvk") as ASPxComboBox;
          
            e.NewValues["NOIDUNG"] = textBox.Text;
           
            e.NewValues["MANHOM"] = nhomvk.SelectedItem.Value;
            //e.Cancel = !SaveFileBytesToRow(grid, e.NewValues);
            if (Session["data"] != null)
            {
                e.NewValues["HINHANH"] = (string)Session["data"];//uploader.FileBytes;
                Session.Remove("data");
            }

        }
        protected bool SaveFileBytesToRow(ASPxGridView grid, OrderedDictionary newValues)
        {
            bool ret = true;
            if (Session["data"] != null)
            {
                newValues["HINHANH"] =(string) Session["data"];//uploader.FileBytes;
                Session.Remove("data");
            }
            else
                ret = false;
            return ret;
        }
        ASPxPageControl FindPageControl(ASPxGridView grid)
        {
            return grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;
            
        }

        protected void gridDetail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["MACH"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gridDetail_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["MACH"] = Session["MACH"];
        }

        protected void gridDetail_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["MACH"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        
    }
}