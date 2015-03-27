using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thitracnghiem.BUS;
using System.Collections;
using DevExpress.Web.ASPxGridView;
using System.Drawing;
using DevExpress.XtraReports.UI;
namespace thitracnghiem
{
    public partial class LapKyThi : System.Web.UI.Page
    {
        KyThiBUS kythiBus;
        DeThiBUS dethiBus;
        BoDeThiBUS bodtBus;
        DapAnBUS daBus;
        CauHoiBUS chBus;
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxGridView1.DataBind();
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            //Xóa dữ liệu
            txtTenKT.Text = "";
            dateNgayThi.Value = DateTime.Today;
            txtSoDT.Text = "0";
            txtTenKT.Focus();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            KYTHI obj = new KYTHI();
            obj.TENKYTHI = txtTenKT.Text;
            obj.NGAYTHI =(DateTime) dateNgayThi.Value;
            obj.SODETHI =Convert.ToInt32( txtSoDT.Text);
            obj.MABODT =Convert.ToInt32( cbBoDT.SelectedItem.Value);
            int mabodt = Convert.ToInt32(cbBoDT.SelectedItem.Value);
            try
            {
                kythiBus = new KyThiBUS();
                kythiBus.SaveKyThi(obj);
            }
            catch (Exception ex)
            {

                txtError.Text = ex.Message;
            }
            //Lấy số đề thi để tạo
            int sodethi = Convert.ToInt32(txtSoDT.Text);
            //Thành công thì tạo các đề thi tự động
            //Lấy thông tin mã các câu hỏi từ bộ đề thi
            bodtBus = new BoDeThiBUS();
            ArrayList dsch = bodtBus.GetCauHois(mabodt);
            int makythimoi = kythiBus.GetMaKyThiNew();

            for (int j = 0; j < sodethi ; j++)
            {
               
                //Lấy được hoán vị xong thì bắt đầu lưu vào
                dethiBus = new DeThiBUS();
                DETHI obj2 = new DETHI();
                obj2.NGAYTAO = DateTime.Now;
                obj2.MAKYTHI = makythimoi;
                dethiBus.SaveDeThi(obj2);

                foreach (int ch in dsch)
                {
                    CHITIETDETHI obj1 = new CHITIETDETHI();
                    obj1.MACH = ch;
                    //Lấy danh sách câu trả lời
                    daBus = new DapAnBUS();
                    ArrayList dsda = daBus.GetDSDapAn(ch);
                    //Tạo ra các dãy số đảo của câu trả lời và lưu vào dữ liệu
                    int[] numbers = new int[] { 1, 2, 3, 4};

                    Random rnd = new Random();
                    int[] hoanvi = numbers.OrderBy(x => rnd.Next()).ToArray();
                    //Có được hoán vị thì sẽ hoán vị ds đáp án
                     
                    if (dsda.Count < 4)
                        continue;
                    for (int i = 0; i < hoanvi.Length; i++)
                    {
                        int index =  hoanvi[i] ;
                        obj1.DA += dsda[index-1].ToString() + ",";
                    }

                                      
                    dethiBus.SaveChiTietDeThi( obj1);

                }
            }


            ASPxGridView1.DataBind();
        }
       
        protected void txtTenKT_Validation(object sender, DevExpress.Web.ASPxEditors.ValidationEventArgs e)
        {
            if ((e.Value as string).Length <= 0)
                e.IsValid = false;
        }

        protected void ASPxGridView1_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID != "btnCusPrintDT") return;
            ASPxGridView grid = sender as ASPxGridView;
           //Lấy thông tin mã kỳ thi
            int kthiid = (int)grid.GetRowValues(e.VisibleIndex, "MAKYTHI");
            //Từ mã kỳ thi xác định các đề thi và in ra file doc
            ArrayList dsdethi = dethiBus.GetMadtFromKythi(kthiid);
            //Tạo arraylist đề thi
            foreach (DETHI item in dsdethi)
            {
                chBus = new CauHoiBUS();
                ArrayList dsch = chBus.GetDSCauHoiDT(item.MADETHI);
               
 
            }
          
        }
        public void AddBoundLabel(string bindingMember, Rectangle bounds)
        {
            // Create a label. 
            XRLabel label = new XRLabel();

            // Add the label to the report's Detail band. 
            //Detail.Controls.Add(label);

            // Set its location and size. 
            label.Location = bounds.Location;
            label.Size = bounds.Size;

            // Bind it to the bindingMember data field. 
            // When the dataSource parameter is null, the report's data source is used. 
            label.DataBindings.Add("Text", null, bindingMember);
        }
    }
}