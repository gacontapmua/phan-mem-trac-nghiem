using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace thitracnghiem.BUS
{
    public class SinhVienBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        //Đăng nhập
        public bool IsDangNhap(string tendn, string mk)
        {
            var q = from a in db.SINHVIENs
                    where a.TENDN == tendn && a.MATKHAU == mk
                    select a;
            if (q.Count() != 0)
                return true;
            return false;
        }
    }
}