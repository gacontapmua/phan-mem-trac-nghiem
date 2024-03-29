﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace thitracnghiem.BUS
{
    public class DeThiBUS
    {
        QLTHITNDataContext db = new QLTHITNDataContext();
        public void SaveDeThi(DETHI obj)
        {
            try
            {
                db.DETHIs.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            catch (Exception e)
            {

                throw e;
            }
        }
        public int GetMaDTNew()
        {
            int q = (from a in db.DETHIs
                     orderby a.MADETHI descending
                     select a.MADETHI).First();
            return q;
        }

        public void SaveChiTietDeThi( CHITIETDETHI obj)
        {
            
            int madt = GetMaDTNew();
            obj.MADETHI = madt;
            try
            {
                db.CHITIETDETHIs.InsertOnSubmit(obj);
                db.SubmitChanges();
            }
            catch (Exception e)
            {
                
                throw e;
            }
        }
        //có mã ts tìm mã đề thi
        public int GetMadt (int mats)
        {
            var sdt = from a in db.SINHVIENs
                      where a.MATS == mats
                      select a;
            foreach (SINHVIEN item in sdt)
            {
                return (int) item.SODETHI;
            }
            return 0;
        }
        //có mã kỳ thi tìm mã đề thi
        public ArrayList GetMadtFromKythi(int makthi)
        {
            ArrayList dsDethi = new ArrayList();
            var dethi = (from a in db.DETHIs
                       where a.MAKYTHI == makthi
                       select a).Distinct();
            foreach (DETHI item in dethi)
            {
                dsDethi.Add(item);
            }
            return dsDethi;
        }
        

    }
}