﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UZone.Admin
{
    public partial class Modules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            editSchool.HRef = "Register.aspx?schoolid=" + Session["currentSchoolID"];
        }
    }
}