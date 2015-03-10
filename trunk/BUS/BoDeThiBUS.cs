using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace thitracnghiem.BUS
{
    public class BoDeThiBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();

        //Lưu bộ đề thi vào CSDL
        public void SaveBoDeThi(  int socauhoi)
        {
            BODETHI bdt = new BODETHI();
            bdt.NGAYTAO =DateTime.Today;
            bdt.SOCAUHOI = socauhoi;
            db.BODETHIs.InsertOnSubmit(bdt);

            // Submit the change to the database. 
            try
            {
                db.SubmitChanges();
            }
            catch (Exception e)
            {
                throw e;
                db.SubmitChanges();
            }
        }
        public int GetMaBDTNew()
        {
            int q = 0;
            q= (from a in db.BODETHIs
                        orderby a.MABODT descending
                        select a.MABODT).First();
            return q;
        }
        //Lưu chi tiết bộ đề thi vào CSDL
        public void SaveChiTietBoDeThi(  int socauhoi,ArrayList dsch)
        {
            //Lưu bộ đề thi
            SaveBoDeThi( socauhoi);
            //Lấy mã bộ đề thi mới nhất
            int mabdt = GetMaBDTNew();

            CHITIETBODETHI ctbdt;
            foreach (CAUHOI item in dsch)
            {
                ctbdt = new CHITIETBODETHI();
                ctbdt.MABODT = mabdt;
                ctbdt.MACH = item.MACH;
                db.CHITIETBODETHIs.InsertOnSubmit(ctbdt);

                // Submit the change to the database. 
                try
                {
                    db.SubmitChanges();
                }
                catch (Exception e)
                {
                    throw e;
                    db.SubmitChanges();
                }
            }
         
          
        }
        public ArrayList GetCauHois(int mabdt)
        {
        var q = from a in db.CHITIETBODETHIs
                where a.MABODT == mabdt
                select a.MACH ;
        ArrayList dsch = new ArrayList();
        foreach (int item in q)
        {
            dsch.Add(item);
        }

        return dsch;
        }

    }
}