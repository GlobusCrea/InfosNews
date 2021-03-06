﻿using InfosNews.DAL;
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
            return RedirectToRoute(new { area = "", controller = "Home", action = "ListeAuteurs"});
        }

        [HttpGet]
        public ActionResult editAuteur(int id)
        {
            Auteurs a = Auteurs.getOneAuteur(id);
            return View(a);
        }

        [HttpGet]
        public ActionResult deleteAuteur(int id)
        {
            Auteurs a = Auteurs.getOneAuteur(id);
            a.deleteAuteur();
            return RedirectToRoute(new { area = "", controller = "Home", action = "ListeAuteurs" });
        }

        [HttpGet]
        public ActionResult addNews()
        {
            return View();
        }

        [HttpPost]
        public ActionResult addNews(News n)
        {
            n.saveNews();
            return RedirectToRoute(new { area = "", controller = "Home", action = "Index" });
        }

        [HttpGet]
        public ActionResult editNews(int id)
        {
            News n = News.getOneNews(id);
            return View(n);
        }

        [HttpGet]
        public ActionResult deleteNews(int id)
        {
            News n = News.getOneNews(id);
            n.deleteNews();
            return RedirectToRoute(new { area = "", controller = "Home", action = "Index" });
        }
    }
}