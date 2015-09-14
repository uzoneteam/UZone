using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UZone.Models
{
    public class ApplicationContext
    {
            public Boolean IsLoggedIn { get; set; }
            public string CurrentSchool { get; set; }
            public DateTime LoggedTimestamp { get; set; }
            public CurrentUser currentUser { get; set; }       

        public class CurrentUser
        {
            public string Name { get; set; }
            public string EmailAddress { get; set; }
            public string RegisteredSchool { get; set; }
            public DateTime LastLogin { get; set; }
        }
    }
}