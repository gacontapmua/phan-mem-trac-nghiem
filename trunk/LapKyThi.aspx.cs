using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using thitracnghiem.BUS;
using System.Collections;
namespace thitracnghiem
{
    public partial class LapKyThi : System.Web.UI.Page
    {
        KyThiBUS kythiBus;
        DeThiBUS dethiBus;
        BoDeThiBUS bodtBus;
        DapAnBUS daBus;
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
           
          
            
        }
       
        protected void txtTenKT_Validation(object sender, DevExpress.Web.ASPxEditors.ValidationEventArgs e)
        {
            if ((e.Value as string).Length <= 0)
                e.IsValid = false;
        }
      
    }
}