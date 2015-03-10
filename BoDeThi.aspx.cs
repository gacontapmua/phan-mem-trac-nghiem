using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using System.Collections;
using thitracnghiem.BUS;
namespace thitracnghiem
{
    public partial class BoDeThi : System.Web.UI.Page
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        CauHoiBUS chBus = new CauHoiBUS();
        NhomVKBUS nvkBus = new NhomVKBUS();
        BoDeThiBUS bdtBus = new BoDeThiBUS();
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
        static Random rnd = new Random();
        protected void btnCreateQuestion_Click(object sender, EventArgs e)
        {
            #region Lấy danh sách câu hỏi của các bộ đề thi
            int socauhoi = 0;
            int NoAK = 0;
            int NoK54 = 0;
            int NoCKC = 0;
            int NoRPD = 0;
            int NoPKMS = 0;
            int NoCoi = 0;
            int NoSMPK = 0;
            int NoDKZ = 0;
            int NoB41 = 0;
            //Lấy các tham số
            if (txtNoAK.Text !="0")
                 NoAK =Convert.ToInt32 (txtNoAK.Text);
            if (txtNoK54.Text != "0")
                NoK54 = Convert.ToInt32(txtNoK54.Text);
            if (txtNoCKC.Text != "0")
                NoCKC = Convert.ToInt32(txtNoCKC.Text);

            if (txtNoRPD.Text != "0")
                NoRPD = Convert.ToInt32(txtNoRPD.Text);

            if (txtNoPKMS.Text != "0")
                NoPKMS = Convert.ToInt32(txtNoPKMS.Text);

            if (txtNoCoi.Text != "0")
                NoCoi = Convert.ToInt32(txtNoCoi.Text);

            if (txtNoSMPK.Text != "0")
                NoSMPK = Convert.ToInt32(txtNoSMPK.Text);

            if (txtNoDKZ.Text != "0")
                NoDKZ = Convert.ToInt32(txtNoDKZ.Text);

            if (txtNoB41.Text != "0")
                NoB41 = Convert.ToInt32(txtNoB41.Text);
            
            
            //Tạo câu hỏi
            ArrayList dsCauHoi = new ArrayList();
            ArrayList l_nn;
            //Lấy danh sách câu hỏi theo tham số
            if (NoAK != 0)
            {
                socauhoi += NoAK;
            //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("AK");
                ArrayList chAK = chBus.GetDSCauHoi(manhom);
                if (chAK.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (chAK.Count <= NoAK)
                        dsCauHoi.AddRange(chAK);
                    else
                        //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while(i<NoAK)
                        {
                            int r = rnd.Next(chAK.Count);
                            if (!l_nn.Contains(r))
                            { 
                                i++;
                                l_nn.Add(r);
                            }

                        }
                       //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(chAK[item]);
                        }
                    }
            }
            if (NoK54 != 0)
            {
                socauhoi += NoK54;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("K54");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoK54)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoK54)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoCKC != 0)
            {
                socauhoi += NoCKC;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("CKC");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoCKC)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoCKC)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoRPD != 0)
            {
                socauhoi += NoRPD;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("RPD");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoRPD)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoRPD)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoPKMS != 0)
            {
                socauhoi += NoPKMS;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("PKMS");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoPKMS)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoPKMS)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoCoi != 0)
            {
                socauhoi += NoCoi;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("Coi");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoCoi)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoCoi)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoSMPK != 0)
            {
                socauhoi += NoSMPK;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("SMPK");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoSMPK)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoSMPK)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoDKZ != 0)
            {
                socauhoi += NoDKZ;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("DKZ");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoDKZ)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoDKZ)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }
            }
            if (NoB41 != 0)
            {
                socauhoi += NoB41;
                //Lấy mã nhóm VK 
                int manhom = nvkBus.GetMaNhomVK("AK");
                ArrayList ch = chBus.GetDSCauHoi(manhom);
                if (ch.Count != 0)
                    //lấy ngẫu nhiêm theo đúng số lượng câu hỏi
                    if (ch.Count <= NoB41)
                        dsCauHoi.AddRange(ch);
                    else
                    //Nếu lớn hơn thì lấy danh sách ngẫu nhiên câu hỏi
                    {
                        l_nn = new ArrayList();
                        int i = 0;
                        while (i < NoB41)
                        {
                            int r = rnd.Next(ch.Count);
                            if (!l_nn.Contains(r))
                            {
                                i++;
                                l_nn.Add(r);
                            }

                        }
                        //Lấy câu hỏi chèn vào
                        foreach (int item in l_nn)
                        {
                            dsCauHoi.Add(ch[item]);
                        }
                    }

            }
#endregion
            #region Lưu danh sách bộ đề thi
            //Lây ngày tháng 
            bdtBus.SaveChiTietBoDeThi(socauhoi, dsCauHoi);
            #endregion

        }
        
    }
}