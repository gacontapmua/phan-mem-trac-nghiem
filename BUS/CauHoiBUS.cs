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
        //Load danh sách câu hỏi theo bộ đề thi
        public ArrayList GetGSCauHoiDT(int madt)
        {
        //Có mã đề thi sẽ lấy được danh sách câu hỏi
            var query = from a in db.CHITIETDETHIs
                        where a.MADETHI == madt
                        select a.MACH;
            ArrayList dsch = new ArrayList();
            foreach (int item in query)
            {
                var q = from a in db.CAUHOIs
                        where a.MACH == item
                        select a;
                foreach (CAUHOI item1 in q)
                {
                    dsch.Add(item1);
                }
            }
            return dsch;
        }
        public CAUHOI getCauHoi(int mach)
        {
            var q = from a in db.CAUHOIs
                    where a.MACH == mach
                    select a;
            foreach (CAUHOI item in q)
            {
                return item;
            }
            return null;
        }
        public ArrayList getDapAn(int mach)
        {
            var q = from a in db.DAPANs
                    where a.MACH == mach
                    select a;
            ArrayList dsda = new ArrayList();
            foreach (DAPAN item in q)
            {
                dsda.Add(item);
            }
            return dsda;
        }

    }
}