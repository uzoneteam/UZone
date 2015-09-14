using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using UZone.Models;

namespace UZone.Admin
{
    public partial class UsersRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UsersGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadUsers();
        }

        private void LoadUsers()
        {
            using (var context = new UzoneEntities())
            {
                List<RegisteredUser> _users;
                _users = context.Set<RegisteredUser>().ToList();
                UsersGrid.DataSource = _users;              
            }
        }
    }
}