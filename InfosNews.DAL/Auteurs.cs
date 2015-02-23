using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InfosNews.DAL
{
    public class Auteurs
    {
        #region Fields

        private int _idAuteur;
        private string _AuteurNom;
        private string _AuteurPrenom;
        private int _AuteurPower;
        private string _AuteurLogin;
        private string _AuteurPassword;
        private List<News> _News;

        #endregion

        #region Properties

        public int idAuteur
        {
            get { return _idAuteur; }
            set { _idAuteur = value; }
        }

        public string auteurNom
        {
            get { return _AuteurNom; }
            set { _AuteurNom = value; }
        }

        public string auteurPrenom
        {
            get { return _AuteurPrenom; }
            set { _AuteurPrenom = value; }
        }

        public int auteurPower
        {
            get { return _AuteurPower; }
            set { _AuteurPower = value; }
        }

        public string auteurLogin
        {
            get { return _AuteurLogin; }
            set { _AuteurLogin = value; }
        }

        public string auteurPassword
        {
            get { return _AuteurPassword; }
            set { _AuteurPassword = value; }
        }

        public List<News> news
        {
            get { return _News = _News ?? getNewsByAuteur(this.idAuteur); }
        }

        #endregion

        #region Static

        public static Auteurs getChampsAuteurs(Dictionary<string,object> item)
        {
            Auteurs aut = new Auteurs();
            aut.idAuteur = (int)item["idAuteur"];
            aut.auteurNom = item["AuteurNom"].ToString();
            aut.auteurPrenom = item["AuteurPrenom"].ToString();
            aut.auteurPower = (int)item["AuteurPower"];
            aut.auteurLogin = item["AuteurLogin"].ToString();
            aut.auteurPassword = item["AuteurPassword"].ToString();
            return aut;
        }

        public static Auteurs getOneAuteur(int idAuteur)
        {
            List<Dictionary<string, object>> unAuteur = GestionConnexion.Instance.getData("SELECT * FROM tblAuteurs WHERE idAuteur =" + idAuteur);
            Auteurs auteur = getChampsAuteurs(unAuteur[0]);
            return auteur;
        }

        public static List<Auteurs> getAllAuteurs()
        {
            List<Dictionary<string, object>> desAuteurs = GestionConnexion.Instance.getData("SELECT * FROM tblAuteurs");
            List<Auteurs> lstAuteurs = new List<Auteurs>();
            foreach(Dictionary<string,object> item in desAuteurs)
            {
                Auteurs auteur = getChampsAuteurs(item);
                lstAuteurs.Add(auteur);
            }
            return lstAuteurs;
        }

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

        #endregion

        #region Function

        public static List<News> getNewsByAuteur(int id)
        {
            List<Dictionary<string,object>> nba = GestionConnexion.Instance.getData("SELECT * FROM tblNews WHERE idAuteur = " + id);
            List<News> lstnba = new List<News>();
            foreach(Dictionary<string,object> item in nba)
            {
                News news = getChampsNews(item);
                lstnba.Add(news);
            }
            return lstnba;
        }

      
        /// <summary>
        /// Ajouter ou modifier un auteur
        /// </summary>
        /// <returns></returns>
        public bool saveAuteur()
        {
            string strRequest = "";

            if(this.idAuteur == 0)
            {
                strRequest = "INSERT INTO tblAuteurs (AuteurNom,AuteurPrenom,AuteurPower,AuteurLogin,AuteurPassword) VALUES (@AuteurNom, @AuteurPrenom, @AuteurPower, @AuteurLogin, @AuteurPassword)";
            }
            else
            {
                strRequest = "UPDATE tblAuteurs SET AuteurNom = @AuteurNom,AuteurPrenom = @AuteurPrenom,AuteurPower = @AuteurPower,AuteurLogin = @AuteurLogin,AuteurPassword = @AuteurPassword";
            }

            Dictionary<string, object> ValueToSave = new Dictionary<string, object>();
            ValueToSave["AuteurNom"] = this.auteurNom;
            ValueToSave["AuteurPrenom"] = this.auteurPrenom;
            ValueToSave["AuteurPower"] = this.auteurPower;
            ValueToSave["AuteurLogin"] = this.auteurLogin;
            ValueToSave["AuteurPassword"] = this.auteurPassword;

            if(GestionConnexion.Instance.saveData(strRequest, GenerateKey.DB, ValueToSave))
            {
                if (this.idAuteur == 0) GestionConnexion.Instance.getLastGenerateId();
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Supprimer un auteur
        /// </summary>
        /// <returns></returns>
        public bool deleteAuteur()
        {
            string strRequest = "DELETE FROM tblAuteurs WHERE idAuteur = @idAuteur";
            Dictionary<string, object> ValueToDelete = new Dictionary<string, object>();
            ValueToDelete["idAuteur"] = this.idAuteur;
            return GestionConnexion.Instance.saveData(strRequest, GenerateKey.APP, ValueToDelete);
        }

        #endregion
    }
}
