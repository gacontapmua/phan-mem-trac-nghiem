using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using DevExpress.XtraReports.UI;

namespace thitracnghiem
{
    public partial class PrintDeThi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxDocumentViewer1.Report = CreateReport();
         
        }
        XtraReport1 CreateReport()
        {
            XtraReport1 report = new XtraReport1();
            QLTHITNDataContext db = new QLTHITNDataContext();
            report.DataSource = db.sp_DanhSachCauHoiDeThi(33);
            
            return report;
        }
        
    }
}