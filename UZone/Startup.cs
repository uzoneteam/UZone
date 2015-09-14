using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(UZone.Startup))]
namespace UZone
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            //ConfigureAuth(app);
        }
    }
}
