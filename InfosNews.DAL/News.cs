using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InfosNews.DAL
{
    public class News
    {
        #region Fields

        private int _idNews;
        private int _idAuteur;
        private string _newsPicture;
        private DateTime _newsDate;
        private string _newsTitre;
        private string _newsTxt;
        private string _newsResume;
        private Auteurs _Auteur;

        #endregion

        #region Properties

        public int idNews
        {
            get { return _idNews; }
            set { _idNews = value; }
        }

        public int idAuteur
        {
            get { return _idAuteur; }
            set { _idAuteur = value; }
        }

        public string NewsPicture
        {
            get { return _newsPicture; }
            set { _newsPicture = value; }
        }

        public DateTime NewsDate
        {
            get { return _newsDate; }
            set { _newsDate = value; }
        }

        public string NewsTitre
        {
            get { return _newsTitre; }
            set { _newsTitre = value; }
        }

        public string NewsTxt
        {
            get { return _newsTxt; }
            set { _newsTxt = value; }
        }

        public string NewsResume
        {
            get { return _newsResume; }
            set { _newsResume = value; }
        }

        public Auteurs Auteur
        {
            get { return _Auteur = _Auteur ?? getAuteur(); }
        }

        #endregion

        #region Static

        public static News getChampsNews(Dictionary<string,object> item)
        {
            News news = new News();
            news.idNews = (int)item["idNews"];
            news.idAuteur = (int)item["idAuteur"];
            news.NewsPicture = item["NewsPicture"].ToString();
            news.NewsDate = (DateTime)item["NewsDate"];
            news.NewsTitre = item["NewsTitre"].ToString();
            news.NewsTxt = item["NewsTxt"].ToString();
            news.NewsResume = item["NewsResume"].ToString();
            return news;
        }

        public static News getOneNews(int idNews)
        {
            List<Dictionary<string, object>> uneNews = GestionConnexion.Instance.getData("SELECT * FROM tblNews WHERE idNews =" + idNews);
            News news = getChampsNews(uneNews[0]);
            return news;
        }

        public static List<News> getFiveNews()
        {
            List<Dictionary<string, object>> fiveNews = GestionConnexion.Instance.getData("SELECT TOP 5 * FROM dbo.tblNews ORDER BY NewsDate DESC");
            List<News> lstFiveNews = new List<News>();
            foreach (Dictionary<string, object> item in fiveNews)
            {
                News news = getChampsNews(item);
                lstFiveNews.Add(news);
            }
            return lstFiveNews;
        }

        public static List<News> getAllNews()
        {
            List<Dictionary<string, object>> desNews = GestionConnexion.Instance.getData("SELECT * FROM tblNews");
            List<News> lstNews = new List<News>();
            foreach(Dictionary<string,object> item in desNews)
            {
                News news = getChampsNews(item);
                lstNews.Add(news);
            }
            return lstNews;
        }

        #endregion

        #region Function

        public Auteurs getAuteur()
        {
            string strRequest = @"SELECT AuteurPrenom,AuteurNom FROM tblAuteurs a INNER JOIN tblNews n ON a.idAuteur = n.idAuteur WHERE n.idAuteur = " + this.idAuteur;
            List<Dictionary<string, object>> auteur = GestionConnexion.Instance.getData(strRequest);
            Auteurs monAuteur = new Auteurs();
            monAuteur.auteurPrenom = auteur[0]["AuteurPrenom"].ToString();
            monAuteur.auteurNom = auteur[0]["AuteurNom"].ToString();
            return monAuteur;
        }


        /// <summary>
        /// Ajouter ou modifier une news
        /// </summary>
        /// <returns></returns>
        public bool saveNews()
        {
            string strRequest = "";

            if(this.idNews == 0)
            {
                strRequest = "INSERT INTO tblNews (idAuteur,NewsPicture,NewsDate,NewsTitre,NewsTxt,NewsResume) VALUES (@idAuteur,@NewsPicture,@NewsDate,@NewsTitre,@NewsTxt,@NewsResume)";
            }
            else
            {
                strRequest = "UPDATE tblAuteurs SET idAuteur = @idAuteur,NewsPicture = @NewsPicture,NewsDate = @NewsDate,NewsTitre = @NewsTitre,NewsTxt = @NewsTxt,NewsResume = @NewsResume ";
            }

            Dictionary<string, object> ValueToSave = new Dictionary<string, object>();
            ValueToSave["idAuteur"] = this.idAuteur;
            ValueToSave["NewsPicture"] = this.NewsPicture;
            ValueToSave["NewsDate"] = this.NewsDate;
            ValueToSave["NewsTitre"] = this.NewsTitre;
            ValueToSave["NewsTxt"] = this.NewsTxt;
            ValueToSave["NewsResume"] = this.NewsResume;

            if(GestionConnexion.Instance.saveData(strRequest, GenerateKey.DB, ValueToSave))
            {
                if(this.idNews == 0) GestionConnexion.Instance.getLastGenerateId();
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Supprimer une news
        /// </summary>
        /// <returns></returns>
        public bool deleteNews()
        {
            string strRequest = "DELETE FOM tblNews WHERE idNews = @idNews";
            Dictionary<string, object> ValueToDelete = new Dictionary<string, object>();
            ValueToDelete["idNews"] = this.idNews;
            return GestionConnexion.Instance.saveData(strRequest, GenerateKey.APP, ValueToDelete);
        }

        #endregion
    }
}
