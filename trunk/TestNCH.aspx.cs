using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxTabControl;

namespace thitracnghiem
{
    public partial class TestNCH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      
        protected void ASPxUploadControl1_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            Session["uploadedFileData"] = e.UploadedFile.FileName;
            e.CallbackData = String.Format("Image\\Picture{0}.jpg", DateTime.Now.ToString("yyyy-MM-dd hh-mm-ss"));
            string path = Page.MapPath("~/") + e.CallbackData;
            e.UploadedFile.SaveAs(path);

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            ASPxTextBox textBox = FindPageControl(grid).FindControl("txtCauHoi") as ASPxTextBox;
            ASPxUploadControl uplControl = FindPageControl(grid).FindControl("uplImage") as ASPxUploadControl;
            e.NewValues["NOIDUNG"] = textBox.Text;
            e.NewValues["HINHANH"] = Session["uploadedFileData"];
        }
        ASPxPageControl FindPageControl(ASPxGridView grid)
        {
            return grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;
        }

    }
}