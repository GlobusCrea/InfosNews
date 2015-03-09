using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace InfosNews.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            /* BUNDLE CSS*/
            
            /* <link href="css/bootstrap.min.css" rel="stylesheet">
                <link href="css/font-awesome.min.css" rel="stylesheet">
                <link href="css/prettyPhoto.css" rel="stylesheet">
                <link href="css/price-range.css" rel="stylesheet">
                <link href="css/animate.css" rel="stylesheet">
                <link href="css/main.css" rel="stylesheet">
                <link href="css/responsive.css" rel="stylesheet">
             */

            /* bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/css/bootstrap.min.css",
                "~/Content/css/font-awesome.min.css",
                "~/Content/css/prettyPhoto.css",
                "~/Content/css/price-range.css",
                "~/Content/css/animate.css",
                "~/Content/css/main.css",
                "~/Content/css/responsive.css",
                "~/Content/css/styles.css"));
             */
            
            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/css/style.css"));

            /* BUNDLE SCRIPTS*/
            
            /*  <script src="js/jquery.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/jquery.scrollUp.min.js"></script>
                <script src="js/price-range.js"></script>
                <script src="js/jquery.prettyPhoto.js"></script>
                <script src="js/main.js"></script>
             */

            /* bundles.Add(new ScriptBundle("~/Scripts/jquery").Include(
                "~/Scripts/jquery.js",
                "~/Scripts/jquery.scrollUp.min.js",
                "~/Scripts/.prettyPhoto.js"
                ));

            bundles.Add(new ScriptBundle("~/Scripts/bootstrap").Include(
                "~/Scripts/bootstrap.min.js"
                ));

            bundles.Add(new ScriptBundle("~/Scripts/custom").Include(
                "~/Scripts/price-range.js",
                "~/Scripts/main.js"
                ));
             */
        }
    }
}