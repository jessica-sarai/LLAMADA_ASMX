using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace WSLLAMA_ASMX
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Off; //paraque permita llamar de nuevo--se puede llamar así mismo
            routes.EnableFriendlyUrls(settings);
        }
    }
}
