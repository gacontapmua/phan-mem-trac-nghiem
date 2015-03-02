using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thitracnghiem
{
    public partial class LapKyThi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            //Xóa dữ liệu
            txtTenKT.Text = "";
            dateNgayThi.Value = DateTime.Today;
            txtSoDT.Text = "0";
            txtTenKT.Focus();

        }
    }
}