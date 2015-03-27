using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thitracnghiem.BUS;
namespace thitracnghiem
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SinhVienBUS svBus;
        KyThiBUS ktBus;
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            //Nhập tên và mật khẩu để đăng nhập
            svBus = new SinhVienBUS();
            bool isdn = svBus.IsDangNhap(txtTenDN.Text, txtMatKhau.Text);
            if (isdn)
            {
                //Đăng nhập thành công
                //Chuyển trang sang thi trắc nghiệm
                ktBus = new KyThiBUS();
                string tenkt = ktBus.GetTenKyThi( txtTenDN.Text);
                string url;
                url = "~/ThiOnline.aspx?tenkt=" + tenkt +"&name=" +
                    txtTenDN.Text;
                Response.Redirect(url);
              //  Response.Redirect("~/ThiOnline.aspx");
            }
            else
                lblError.Text = "Đăng nhập không thành công, mời đăng nhập lại";

        }
    }
}