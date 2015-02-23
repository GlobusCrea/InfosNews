using InfosNews.DAL;
using InfosNews.Models;
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
            //NewsAuteurModel nam = new NewsAuteurModel();
            //nam.MesNews = News.getFiveNews();
            //nam.NomAuteur = Auteurs.getAllAuteurs();
        }

        public ActionResult ListeAuteurs()
        {
            List<Auteurs> lstAuteurs = new List<Auteurs>();
            lstAuteurs = Auteurs.getAllAuteurs();
            return View(lstAuteurs);
        }
	}
}