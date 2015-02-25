using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

namespace thitracnghiem
{
    public partial class BoDeThi : System.Web.UI.Page
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridDetail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["MABODT"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtNoAK.Text = "0";
            txtNoB41.Text = "0";
            txtNoCKC.Text = "0";
            txtNoCoi.Text = "0";
            txtNoDKZ.Text = "0";
            txtNoK54.Text = "0";
            txtNoPKMS.Text = "0";
            txtNoRPD.Text = "0";
            txtNoSMPK.Text = "0";
            
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            //Tạo bộ đề thi từ số liệu nhập vào
            //Lấy số liệu nhập vào từ text
            //Lọc ra số lượng câu hỏi của từng nhóm VK
            //Lấy random cho đủ số lượng câu, lưu vào dữ liệu

        }
    }
}