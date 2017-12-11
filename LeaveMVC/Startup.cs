using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LeaveMVC.Startup))]
namespace LeaveMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
