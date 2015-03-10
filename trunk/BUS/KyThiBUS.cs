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
    }
}