using InfosNews.DAL;
using InfosNews.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InfosNews.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string login, string pass)
        {
            Auteurs a = Auteurs.getLoginPass(login, pass);
            if(a != null)
            {
                SessionTools.Login = a.auteurLogin;
                SessionTools.auteur = a;
                return RedirectToRoute(new { area = "", controller = "Home", action = "Index" }); 
            }
            else 
            {
                ViewBag.ErrorLogin = "Erreur Login/Password";
                return View();
            }
        }

        [HttpGet]
        public ActionResult Logout()
        {
            SessionTools.Login = null;
            Session.Abandon();
            return RedirectToRoute(new { area = "", controller = "Home", action = "Index" }); 
        }
    }
}