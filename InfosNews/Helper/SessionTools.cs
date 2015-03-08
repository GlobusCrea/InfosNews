using InfosNews.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InfosNews.Helper
{
    public class SessionTools
    {
        public static Auteurs auteur
        {
            get { return (Auteurs)HttpContext.Current.Session["auteur"]; }
            set { HttpContext.Current.Session["auteur"] = value; }

        }

        public static string Login
        {
            get
            {
                if (HttpContext.Current.Session["Login"] != null) return HttpContext.Current.Session["Login"].ToString();
                else return null;
            }

            set { HttpContext.Current.Session["Login"] = value; }
        }
    }
}