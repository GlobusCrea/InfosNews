using InfosNews.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InfosNews.Controllers
{
    public class NewsController : Controller
    {
        //
        // GET: /News/
        public ActionResult NewsDetail(int id)
        {
            News newsDetail = News.getOneNews(id);
            return View(newsDetail);
        }

        public ActionResult NewsByAuteur(int id)
        {
            List<News> newsByAuteur = Auteurs.getNewsByAuteur(id);
            return View(newsByAuteur);
        }
	}
}