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
    public partial class ThiOnline : System.Web.UI.Page
    {
        DeThiBUS dtBus = new DeThiBUS();
        CauHoiBUS chBus = new CauHoiBUS();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Load câu hỏi cho thí sinh
            //Lấy mã đề thi
            int mats = 1;
            int madt = dtBus.GetMadt(mats);
            //Lấy danh sách câu hỏi
            ArrayList dsch = chBus.GetGSCauHoiDT(madt);
            //Add vào list box
            int i = 1;
            foreach (CAUHOI item in dsch)
            {
                listCauHois.Items.Add( i.ToString(),item.MACH.ToString());
                i++;
            }
        }
       

        protected void ASPxCallback1_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
           int mach = Convert.ToInt32( listCauHois.SelectedItem.Value);
           string stt = (string)listCauHois.SelectedItem.Text;
           CAUHOI ch = chBus.getCauHoi(mach);
           //Lấy danh sách đáp án
           ArrayList dsda = new ArrayList();
           dsda = chBus.getDapAn(mach);
            e.Result = "Câu hỏi" + stt + ": <br>" + ch.NOIDUNG +"|image/" + ch.HINHANH +"|";
            string dapan = "";
            int ascii = 65;
            
            foreach (DAPAN item in dsda)
            {
                char value = (char)ascii;
               dapan +=value.ToString() + ".\t" +  item.NOIDUNGDA +"<br> \r\n";
               ascii++;
            }
            
            e.Result += dapan;
        }

        protected void txtCauHoi_TextChanged(object sender, EventArgs e)
        {
            //Khi thay đổi text thì load câu hỏi, load câu trả lời và ảnh vào
            CAUHOI ch = chBus.getCauHoi(Convert.ToInt32( txtCauHoi.Text));
            txtCauHoi.Text = ch.NOIDUNG;
            imgCauHoi.ImageUrl = "~/image/" + ch.HINHANH;

        }
    }
}