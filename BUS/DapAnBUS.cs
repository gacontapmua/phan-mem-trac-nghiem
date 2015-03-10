using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace thitracnghiem.BUS
{
    public class DapAnBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        public ArrayList GetDSDapAn(int mach)
        {
            ArrayList dsda = new ArrayList();
            var q = from a in db.DAPANs
                    where a.MACH == mach
                    select a.MADA;

            foreach (int item in q)
            {
                dsda.Add(item);
            }
            return dsda;
        }
    }
}