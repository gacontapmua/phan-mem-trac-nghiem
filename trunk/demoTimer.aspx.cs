using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace thitracnghiem
{
    public partial class demoTimer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SM1.IsInAsyncPostBack)
                Session["timeout"] = DateTime.Now.AddMinutes(120).ToString();
        }

        protected void timer1_tick(object sender, EventArgs e)
        {
            if (0 > DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timeout"].ToString())))
            {
                lblTimer.Text = "Number of Minutes Left: " + ((Int32)DateTime.Parse(Session["timeout"].ToString()).Subtract(DateTime.Now).TotalMinutes).ToString();
            }
        }
    }
}