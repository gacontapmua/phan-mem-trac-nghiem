using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace thitracnghiem.BUS
{
    public class KyThiBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        //Lưu thông tin
        public void SaveKyThi(KYTHI obj)
        {
            db.KYTHIs.InsertOnSubmit(obj);
            try
            {
                db.SubmitChanges();
            }
            catch (Exception e)
            {
                
                throw e;
            }
        }
        public int GetMaKyThiNew ()
        {
            int q = (from a in db.KYTHIs
                     orderby a.MAKYTHI descending
                     select a.MAKYTHI).First();
            return q;
        }
        public string GetTenKyThi (string tendn)
        {
        string    q = (from a in db.SINHVIENs
                join b in db.DETHIs on a.SODETHI equals b.MADETHI
                join c in db.KYTHIs on b.MAKYTHI equals c.MAKYTHI
                where a.TENDN == tendn
                select c.TENKYTHI).First();
        return q.ToString();
        }
        
    }
}