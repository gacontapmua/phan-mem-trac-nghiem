using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thitracnghiem.BUS;
using System.Collections;
using DevExpress.Web.ASPxEditors;
namespace thitracnghiem
{
    public partial class demo_ThiOnline : System.Web.UI.Page
    {
        DeThiBUS dtBus = new DeThiBUS();
        CauHoiBUS chBus = new CauHoiBUS();
        ArrayList dsch = new ArrayList();
        SinhVienBUS svBus = new SinhVienBUS();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SM1.IsInAsyncPostBack)
                Session["timeout"] = DateTime.Now.AddMinutes(90).ToString();
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["name"] == null)
                {
                    string url;
                    url = "~/DangNhap.aspx?";
                    Response.Redirect(url);
                }
                Session["diem"] = 0;
                lblHoTenSV.Text = Request.QueryString["name"];
                lblTenKT.Text = Request.QueryString["tenkt"];
                //Load câu hỏi cho thí sinh
                //Lấy mã thí sinh
                
                //Lấy mã đề thi
                int mats = svBus.GetMats(lblHoTenSV.Text);
                int madt = dtBus.GetMadt(mats);
                //Lấy danh sách câu hỏi
                dsch = chBus.GetDSCauHoiDT(madt);
                Session["dsch"] = dsch;
                Session["no_ch"] = 0;
                //Load câu hỏi đầu tiên vào bảng câu hỏi
                CAUHOI ch1 = (CAUHOI)dsch[(int)Session["no_ch"]];
                
                txtCauHoi.Text = "Câu hỏi " + ((int)Session["no_ch"] +1).ToString() +": " + ch1.NOIDUNG;
                imgCauHoi.ImageUrl = "~/image/" +ch1.HINHANH;
                //Lấy danh sách đáp án
                ArrayList dsda = new ArrayList();
                dsda = chBus.getDapAn(ch1.MACH);
               
                int index = 1;
                foreach (DAPAN item in dsda)
                {
                  
                    if (index == 1)
                        radListDA.Items.Add("A. " + item.NOIDUNGDA, index);
                    if (index == 2)
                        radListDA.Items.Add("B. " + item.NOIDUNGDA, index);
                    if (index == 3)
                        radListDA.Items.Add("C. " +item.NOIDUNGDA, index);
                    if (index == 4)
                        radListDA.Items.Add("D. " +item.NOIDUNGDA, index);

                    if ((bool)item.DADUNG)
                       Session["dad"] = index;
                    index++;
                }
                Session["no_ch"] = (int)Session["no_ch"] + 1;
            }
         
        }

       
     

     
        int demoCounter = 0;
        protected void ASPxTimer1_Init(object sender, EventArgs e)
        {
            demoCounter = 90;
        }
        void demoUpdate()
        {
            if (demoCounter > 0)
                lblCountDown.Text = demoCounter.ToString();
                
            else
            {
                ASPxTimer1.Enabled = false;
                
            }
        }
        protected void ASPxTimer1_Tick(object sender, EventArgs e)
        {
            demoCounter -= 1;
            demoUpdate();
        }

        

        protected void btnStart_Click(object sender, EventArgs e)
        {
            //
            txtCauHoi.Visible = true;
            radListDA.Visible = true;
            imgCauHoi.Visible = true;
            Timer2.Enabled = true;
            btnNopBai.Visible = true;
            btnTiepTheo.Visible = true;

            DateTime endTime = DateTime.Now.AddMinutes(1);
          Session["thoigian"] = endTime.ToShortTimeString();
            //Tính toán thời gian để kết thúc bài thì

        }

        protected void btnTiepTheo_Click(object sender, EventArgs e)
        {
            //Lựa chọn đáp án, tính điểm, chuyển câu tiêp theo
            ASPxRadioButtonList rbl = (ASPxRadioButtonList)this.FindControl("radListDA");
            ListEditItem item1 = rbl.SelectedItem;
            if (item1 != null)
            {
                int dadung = (int)Session["dad"];
                int dapanchon = Convert.ToInt32(item1.Value);
                if (dapanchon == (int)Session["dad"])
                {
                    //Tăng tổng điểm
                    int diemtong = (int)Session["diem"];
                    Session["diem"] = diemtong + 1;
                }
            }
            //Chuyển qua câu tiếp theo

            //Load câu hỏi tiếp theo vào bảng câu hỏi
            int soch = (int)Session["no_ch"];
            if (((ArrayList)Session["dsch"]).Count > soch)
            {
                CAUHOI ch1 = (CAUHOI)((ArrayList)Session["dsch"])[(int)Session["no_ch"]];
                txtCauHoi.Text = "Câu hỏi " + ((int)Session["no_ch"] + 1).ToString() + ": " + ch1.NOIDUNG;
                imgCauHoi.ImageUrl = "~/image/" + ch1.HINHANH;
                //Lấy danh sách đáp án
                ArrayList dsda = new ArrayList();
                dsda = chBus.getDapAn(ch1.MACH);
                radListDA.Items.Clear();
                int index = 1;
                foreach (DAPAN item in dsda)
                {

                    if (index == 1)
                        radListDA.Items.Add("A. " + item.NOIDUNGDA, index);
                    if (index == 2)
                        radListDA.Items.Add("B. " + item.NOIDUNGDA, index);
                    if (index == 3)
                        radListDA.Items.Add("C. " + item.NOIDUNGDA, index);
                    if (index == 4)
                        radListDA.Items.Add("D. " + item.NOIDUNGDA, index);

                    if ((bool)item.DADUNG)
                        Session["dad"] = index;
                    index++;
                }
                Session["no_ch"] = (int)Session["no_ch"] + 1;
            }
            else
            {
                lblNotify.Text = "Kết thúc bài thi, mời bạn Nộp bài thi";
                btnTiepTheo.Enabled = false;
            }

        }

        protected void btnNopBai_Click(object sender, EventArgs e)
        {
            //Nếu nhấn nút nộp bài thì tính tổng điểm
            string url;
            url = "~/ThongBaoNopBai.aspx?tenkt=" + lblTenKT.Text + "&name=" +
                lblHoTenSV.Text + "&diemthi=" + Session["diem"] ;
            Response.Redirect(url);
        }

        protected void timer1_tick(object sender, EventArgs e)
        {
            if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timeout"].ToString())))
            {
                lblTimer.Text = "Số phút còn lại: " + ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString();
            }
        }
 
       
        
    }
}