using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Reflection;
using DevExpress.XtraPrinting.Native;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
public partial class GenerateMsWord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Fires when button is clicked
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GenerateMsWordDoc(object sender, EventArgs e)
    {

        string strBody = "<html>" +
            "<body>" +
                "<div>Your name is: <b>" + "" + "</b></div>" +
                "<table width=\"100%\" style=\"background-color:#cfcfcf;\"><tr><td>1st Cell body data</td><td>2nd cell body data</td></tr></table>" +
                "Ms Word document generated successfully." +
            "</body>" +
            "</html>";
        string fileName = "MsWordSample.doc";
        // You can add whatever you want to add as the HTML and it will be generated as Ms Word docs
        Response.AppendHeader("Content-Type", "application/msword");
        Response.AppendHeader("Content-disposition", "attachment; filename=" + fileName);
        Response.Write(strBody);
    }
    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        // Open a WordprocessingDocument for editing using the filepath.
        WordprocessingDocument wordprocessingDocument =
            WordprocessingDocument.Open("MsWordSample.docx", true);
        // Assign a reference to the existing document body.
        Body body = wordprocessingDocument.MainDocumentPart.Document.Body;
    }
}
