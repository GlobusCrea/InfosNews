using InfosNews.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InfosNews.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult addAuteur()
        {
            return View();
        }

        [HttpPost]
        public ActionResult addAuteur(Auteurs a)
        {
            a.saveAuteur();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult deleteAuteur(int id)
        {
            Auteurs a = Auteurs.getOneAuteur(id);
            a.deleteAuteur();
            return RedirectToAction("Index");
        }
    }
}