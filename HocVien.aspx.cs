using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

namespace thitracnghiem
{
    public partial class HocVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              Grid.SettingsEditing.BatchEditSettings.EditMode = (GridViewBatchEditMode)Enum.Parse(typeof(GridViewBatchEditMode), EditModeCombo.Text, true);
        Grid.SettingsEditing.BatchEditSettings.StartEditAction = (GridViewBatchStartEditAction)Enum.Parse(typeof(GridViewBatchStartEditAction), StartEditActionCombo.Text, true);
        }
    }
}