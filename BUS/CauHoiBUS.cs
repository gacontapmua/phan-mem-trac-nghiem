using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace thitracnghiem.BUS
{
    public class CauHoiBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        //Lấy danh sách câu hỏi theo nhóm
        public ArrayList GetDSCauHoi (int manhom) 
        {
            ArrayList dsch = new ArrayList();
            var query = from a in db.CAUHOIs
                        where a.MANHOM == manhom
                        select a;
            foreach (CAUHOI item in query)
            {
                dsch.Add(item);
            }
            return dsch;
        }
    }
}