using InfosNews.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InfosNews.Models
{
    public class NewsAuteurModel
    {
        List<News> _mesNews;
        Auteurs _nomAuteur;

        public List<News> MesNews
        {
            get { return _mesNews; }
            set { _mesNews = value; }
        }

        public Auteurs NomAuteur
        {
            get { return _nomAuteur; }
            set { _nomAuteur = value; }
        }

    }
}