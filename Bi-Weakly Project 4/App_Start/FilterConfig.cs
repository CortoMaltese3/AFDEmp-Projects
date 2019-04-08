using System.Web;
using System.Web.Mvc;

namespace Bi_Weakly_Project_4
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
