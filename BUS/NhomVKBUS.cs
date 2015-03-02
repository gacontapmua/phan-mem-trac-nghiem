using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace thitracnghiem.BUS
{
    public class NhomVKBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();

       public  int GetMaNhomVK (string tennhom)
        {
        int query  = (from a in db.NHOMVKs
                     where a.TENNHOM == tennhom
                     select a.MANHOM).First() ;
        return query;  
        }
    }
}