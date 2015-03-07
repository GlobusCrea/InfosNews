using InfosNews.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InfosNews.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            List<News> lstNews = new List<News>();
            lstNews = News.getFiveNews();
            return View(lstNews);
        }

        public ActionResult allNews()
        {
            List<News> lstNews = new List<News>();
            lstNews = News.getAllNews();
            return View(lstNews);
        }

        public ActionResult ListeAuteurs()
        {
            List<Auteurs> lstAuteurs = new List<Auteurs>();
            lstAuteurs = Auteurs.getAllAuteurs();
            return View(lstAuteurs);
        }
	}
}