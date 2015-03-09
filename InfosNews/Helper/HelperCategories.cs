using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InfosNews.Helper
{
    public static class HelperCategories
    {
        public static MvcHtmlString BoldTitle(this HtmlHelper Origin, string txt, string cssFont)
        {
            TagBuilder tag = new TagBuilder("h1");
            tag.AddCssClass(cssFont);
            tag.InnerHtml = txt;
            return new MvcHtmlString(tag.ToString());
        }
    }
}