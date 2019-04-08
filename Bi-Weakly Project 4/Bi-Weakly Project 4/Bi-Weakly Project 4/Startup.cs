using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Bi_Weakly_Project_4.Startup))]
namespace Bi_Weakly_Project_4
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
