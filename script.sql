USE [master]
GO
/****** Object:  Database [InfosNews]    Script Date: 10/02/2015 15:59:09 ******/
CREATE DATABASE [InfosNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InfosNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\InfoNews.mdf' , SIZE = 5019KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InfosNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\InfosNews.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InfosNews] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InfosNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InfosNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InfosNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InfosNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InfosNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InfosNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [InfosNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InfosNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InfosNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InfosNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InfosNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InfosNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InfosNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InfosNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InfosNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InfosNews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InfosNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InfosNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InfosNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InfosNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InfosNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InfosNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InfosNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InfosNews] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InfosNews] SET  MULTI_USER 
GO
ALTER DATABASE [InfosNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InfosNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InfosNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InfosNews] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [InfosNews]
GO
/****** Object:  Table [dbo].[tblAuteurs]    Script Date: 10/02/2015 15:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAuteurs](
	[idAuteur] [int] IDENTITY(1,1) NOT NULL,
	[AuteurNom] [nvarchar](50) NOT NULL,
	[AuteurPrenom] [nvarchar](50) NOT NULL,
	[AuteurPower] [int] NOT NULL CONSTRAINT [DF_tblAuteurs_AuteurPower]  DEFAULT ((2)),
	[AuteurLogin] [nvarchar](50) NOT NULL,
	[AuteurPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAuteurs] PRIMARY KEY CLUSTERED 
(
	[idAuteur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNews]    Script Date: 10/02/2015 15:59:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNews](
	[idNews] [int] IDENTITY(1,1) NOT NULL,
	[idAuteur] [int] NOT NULL,
	[NewsPicture] [nvarchar](50) NULL,
	[NewsDate] [date] NOT NULL,
	[NewsTitre] [nvarchar](255) NOT NULL,
	[NewsTxt] [nvarchar](max) NOT NULL,
	[NewsResume] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblNews] PRIMARY KEY CLUSTERED 
(
	[idNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblAuteurs] ON 

INSERT [dbo].[tblAuteurs] ([idAuteur], [AuteurNom], [AuteurPrenom], [AuteurPower], [AuteurLogin], [AuteurPassword]) VALUES (1, N'de Jardin', N'Lenain', 0, N'lenain', N'007')
SET IDENTITY_INSERT [dbo].[tblAuteurs] OFF
SET IDENTITY_INSERT [dbo].[tblNews] ON 

INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (1, 1, N'LesCons.jpg', CAST(N'2015-02-02' AS Date), N'Selon un rapport, 1% des cons détiennent plus de 50% de la connerie mondiale ', N'L’organisation Oxfam dévoile un rapport alarmant sur l’accroissement des inégalités en matière de connerie dans le monde. Le résultat de l’étude fait froid dans le dos : d’ici 2016, 1% des cons pourraient posséder plus de 50% de la connerie mondiale, et devenir à eux seuls plus cons que 99% du reste de la population.

« Bande de cons »

« Il y a toujours eu des cons à travers l’histoire. Mais nous traversons une période particulièrement faste en matière de stupidité humaine » commente Louis Turmasse, historien spécialiste de la connerie et auteur de « Des souris et des cons ». « Il s’agit d’un phénomène connu : plus certaines personnes sont connes, et plus le reste du monde s’indigne et relativise. Alors, le fossé se creuse. » explique-t-il.

Jean-Philippe Sautreuil, qui a dirigé l’étude, met en cause la montée de l’extrémisme politique et religieux : « une faible partie de la population est devenue complètement conne. De plus, les cons ont tendance a vivre en communauté pour former ce qu’on appelle « des bandes de cons ». Leur connerie augmente alors parfois de plus de 1000% comme en témoignent les évènements de ce début d’année 2015 » affirme-t-il.

« Quand on est con, on est con »

Plusieurs personnalités politiques ont d’ores et déjà réagi à l’inquiétant constat. Le premier c’est Nicolas Sarkozy qui déclare sur son compte Twitter : « Cassez-vous pov’ cons » tout en essayant de se hisser au premier rang des Top Tweets de France. Jean François Copé a, de son côté, proposé un système de fausses factures de connerie afin de réduire au moins en apparence la bêtise de certains actes ou propos. Un système qu’il juge “efficace” et qui a selon lui “largement fait ses preuves” par le passé.

Enfin, le chef de l’Etat s’est exprimé ce matin lors du conseil des ministres, en demandant la mise en place d’une cellule psychologique pour les personnes victimes de connerie, ainsi que le lancement d’un plan de recherche pour endiguer la connerie humaine. Un plan jugé peu réaliste par son entourage au vu de la conjoncture actuelle. Ce que l’un de ses conseillers nous confirme à la sortie du conseil en citant le chanteur Georges Brassens : « Quand on est con, on est con ».', N'L’organisation Oxfam dévoile un rapport alarmant sur l’accroissement des inégalités en matière de connerie dans le monde. Le résultat de l’étude fait froid dans le dos : d’ici 2016, 1% des cons pourraient posséder plus de 50% de la connerie mondiale...')
INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (2, 1, N'YoutubeComment.jpg', CAST(N'2015-02-04' AS Date), N'Un commentaire intelligent retrouvé sous une vidéo YouTube', N'Selon plusieurs sources, l’existence d’un commentaire non stupide posté le 15 octobre 2014 sur le site YouTube.fr aurait été confirmée. En effet, MissLisadu87 s’est exprimé sous la vidéo « Le Temps des Cathédrales » interprétée par Bruno Pelletier de la comédie musicale « Notre Dame de Paris ». D’un ton clair et limpide, elle a déclaré « cet homme, manifestement chanteur, semble ne pas avoir saisi la portée dramatique de l’oeuvre de Victor Hugo.». Le commentaire ne comporte pas de fautes de français apparentes et témoigne même d’une certaine maîtrise de la ponctuation puisqu’on peut y voir une virgule et un point. Selon David Garciès, expert en sites de vidéo et auteur de De Youtube à Dailymotion, les dichotomies du paysage audiovisuel français, le commentaire s’éloigne de la norme traditionnelle car il n’intègre pas de point d’exclamation, un « must-have » selon lui en matière d’écriture en ligne. Les internautes n’auraient pas réagi et auraient continué d’écrire « j’adore !!! » ou encore « il é tro bo », sous la vidéo en question. Cela dit, la rédaction n’a pas souhaité continuer à lire des commentaires sur Youtube en raison d’un lien établi par une étude dont vous faisait part LeGorafi en novembre 2014 entre les commentaires sur internet et le cancer du cerveau.', N'Selon plusieurs sources, l’existence d’un commentaire non stupide posté le 15 octobre 2014 sur le site YouTube.fr aurait été confirmée...')
INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (4, 1, N'FileAttente.jpg', CAST(N'2015-02-04' AS Date), N'Il déteste secrètement la personne qui le précède dans la file d’attente ', N'Boulogne-Billancourt – Il est 12h14 quand Stéphane Beaudoin, 28 ans, s’apprête à entrer dans une agence bancaire de la banlieue Ouest-Parisienne. D’ordinaire plutôt détendu, Stéphane est aujourd’hui pressé : “J’avais besoin de déposer des espèces sur mon compte pour éviter d’être à découvert et de payer des Agios, et je n’avais qu’une heure de pause déjeuner”. L’impensable se produit alors. Véritable coup du sort : un inconnu d’une quarantaine d’années, vêtu d’un pardessus, surgit et pousse la porte une dizaine de mètres à peine avant lui.

“Il avait dû préparer son coup depuis longtemps”

Désemparé, Stéphane tente d’abord de relativiser : “Je me suis dit que ce n’était pas très grave, et que j’aurai quand même le temps de passer. Mais il avait cet air narquois, insolent, et puis il avait des lunettes. Je déteste les lunettes. Enfin, j’aime bien les lunettes, mais sur lui cela m’énervait. J’ai commencé à le détester en secret pour mille détails de sa personnalité” avoue-t-il.

Vers 12h22, la situation semble se calmer quand trois des quatre personnes qui précédaient Stéphane dans la queue terminent leurs affaires en très peu de temps. C’est au tour de l’inconnu de se présenter au guichet. La situation vire alors au cauchemar : “Il a commencé à sortir un petit papier de sa poche avec au moins 10 choses à demander au banquier. C’en était trop. D’abord les lunettes, et maintenant ça. Il avait dû préparer son coup depuis longtemps.” fulmine-t-il.

“Comme par hasard aujourd’hui”

Pour Stéphane, aucun doute : il s’agit d’un complot. “Il se pointe comme par hasard aujourd’hui, le jour où je décide d’y aller alors que ça fait 15 jours que je repousse l’échéance. Et puis il entre 5 secondes à peine avant moi. Il devait attendre mon arrivée caché derrière un bosquet. Je le déteste. Je le déteste!” peste-t-il. Car ce qui inquiète Stéphane, à juste titre, c’est que l’agence ferme ses portes à midi trente précise.

12h29. Il ne semble plus y avoir d’espoir. Stéphane envisage des solutions radicales : “C’est foutu, je vais devoir revenir une autre fois. Peut-être me lever plus tôt demain matin pour y aller. C’est insupportable. J’aurais dû m’en douter dès le début quand j’ai vu ses lunettes. Je le hais.” conclut-il. Aux dernières nouvelles, Stéphane hésitait encore entre se lever plus tôt le lendemain, ou quitter son travail et consacrer sa vie à transformer l’existence de l’homme à lunettes en, selon ses dires, “un véritable enfer”.', N'Boulogne-Billancourt – Il est 12h14 quand Stéphane Beaudoin, 28 ans, s’apprête à entrer dans une agence bancaire de la banlieue Ouest-Parisienne. D’ordinaire plutôt détendu...')
INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (7, 1, N'MarineLePen.png', CAST(N'2015-02-04' AS Date), N'Marine Le Pen: « Je tiens à remercier les Français les plus faibles psychologiquement d’avoir voté pour nous » ', N'À résultat exceptionnel, tribune exceptionnelle. Après la victoire historique (25%) de son parti hier aux élections européennes, la chef du Front national s’exprime aujourd’hui dans les colonnes de Libération. Trois doubles pages dans lesquelles elle réagit sur ce score exceptionnel tout en remerciant les Français « les plus faibles et les plus perdus ».

« Nous ne serions rien sans ces attardés »



Elle assure que rien n’aurait été possible sans eux. Eux, ce sont les électeurs français qui sont allés voter F.N. hier, permettant au parti d’extrême-droite de décrocher une victoire sans précédent. Dès le début de son intervention, Marine Le Pen s’adresse à ces soutiens « stupides mais utiles » comme elle les appelle avec tendresse.

« Ils sont déçus, ils comptent sur les autres pour assurer leur propre confort social, et ils sont désespérés à cause de leur faiblesse d’esprit. 
Mais c’est ce dernier trait qui les rend si importants à nos yeux. C’est grâce à eux que nous pourrons redresser la France. Grâce à leur détresse et à leur manque de recul ou d’implication politique. A vrai dire, nous ne serions rien sans ces attardés. C’est pour ça que je tiens à remercier les Français les plus faibles psychologiquement d’avoir voté pour nous » déclare la femme politique.

Plus loin elle explique comment ces électeurs désespérés représentent le cœur de son parti : « Finalement, les vieux racistes ou les jeunes xénophobes ne représentent qu’une petite frange de nos forces. La victoire ne pourra venir que du gros de nos troupes, de nos millions de citoyens aux abois, incapables de résister à la tentation du populisme. »

Un petit mot pour Hollande



Dans sa tribune de six pages, Marine Le Pen a également expliqué que sa victoire était également le fruit du travail acharné du président de la République : « Ces Français les plus faibles ne seraient jamais venus dans notre giron si M. Hollande n’avait pas stimulé très légèrement leur absence totale de patience et de résistance. Cette victoire, c’est aussi et surtout la sienne. »', N'À résultat exceptionnel, tribune exceptionnelle. Après la victoire historique (25%) de son parti hier aux élections européennes, la chef du Front national s’exprime aujourd’hui dans les colonnes de Libération...')
INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (9, 1, N'iceberg.png', CAST(N'2015-02-05' AS Date), N'Les scientifiques proposent de placer la banquise dans une glacière géante en attendant de trouver une solution ', N'Une équipe de chercheurs norvégiens vient de dévoiler les plans d’une glacière géante destinée à recueillir provisoirement la banquise menacée de fonte. Le dispositif aux dimensions pharaoniques pourrait être mis en service d’ici la fin de l’année. Reportage.

Le chantier qui devrait débuter dès le mois prochain va voir l’installation dans l’océan Arctique d’une plate-forme de plus de 100 000 hectares pour accueillir la glacière géante. « Cela représente plus de 52 millions de terrains de curling » se targuait Erik Sorensen, qui pilote le projet depuis le début.

Le chercheur précise que si le projet prévoit de sauver environ 200 milliards de mètres cubes de glace, il n’offre aucune résolution durable au problème du réchauffement climatique. « Nous agissons juste sur un symptôme, mais le mal reste toujours là. Il est donc toujours urgent d’agir et de continuer à trouver d’autres solutions » rappelle le scientifique en précisant que le chantier démesuré risquait d’augmenter de 0,2 degrés les températures dans la zone.

De nombreux pays voisins ont salué l’initiative des chercheurs norvégiens, certains annonçant qu’ils étaient prêts à apporter leur contribution au projet. Les Suédois devrait suivre avec un dispositif complémentaire au Norvégien. Trois millions de ventilateurs devraient être installés dans l’Arctique, dès que la construction de la centrale nucléaire qui les fera fonctionner sera achevée.', N'Une équipe de chercheurs norvégiens vient de dévoiler les plans d’une glacière géante destinée à recueillir provisoirement la banquise menacée de fonte. Le dispositif aux dimensions pharaoniques pourrait être mis en service d’ici la fin de l’année...')
INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (10, 1, N'FordFiesta.jpg', CAST(N'2015-02-05' AS Date), N'6 signes qui indiquent que vous êtes une Ford Fiesta ', N'Déterminer si l’on est un humain ou une modèle de voiture américaine n’est pas toujours chose facile. Pourtant, certains indices peuvent vous mettre la puce à l’oreille. Le Gorafi vous accompagne dans cette entreprise.

Vous avez un goût prononcé pour l’essence

Vous avez tendance à consommer de l’essence ou diesel, pour alimenter votre moteur 4 temps 16 soupapes, à un débit de 3,7 à 6,6 litres au 100km : Il y a de fortes chances que vous soyez une Ford Fiesta. A titre d’exemple, un humain moyen consomme entre 0 et 0 litres d’essence au 100km, puisqu’en plus d’être mauvais pour sa santé, l’alcool a un goût qu’il définit comme “franchement dégueulasse”.

Vous avez récemment changé votre embrayage

C’est un classique chez les Ford Fiesta après 150.000 km. Beaucoup moins chez les humains, qui se contentent après autant de kilomètres parcourus de boire un bon verre d’eau, voire deux, pour se réhydrater. Mais en aucun cas de changer d’embrayage puisqu’ils n’en sont pas pourvus. A vous de tirer les bonnes conclusions.

Vous êtes constitué de tôle

Encore une fois, il y a peu de chances que vous soyez un humain si vous avez une carrosserie de tôle. Ou même si vous avez une carrosserie tout court. Les humains étant recouverts d’épiderme, qui même s’il peut être dure, reste beaucoup plus souple qu’une feuille de métal obtenue par laminage.

Vos sièges arrières sont rétractables

Attention : à ne pas confondre avec la simple possibilité de se pencher en avant qu’offre le corps humain. L’option « banquette rétractable » est disponible sur de nombreux modèles de l’automobile.

Vous ne pouvez pas lire cet article

Ce qui est logique puisque vous êtes pourvus de phares et non d’yeux, et d’un moteur plutôt que d’un cerveau. Si le moteur vous permet de faire tourner vos roues motrices jusqu’à 152 voire 220 km/h pour certains modèles, il ne vous donne pas accès à des capacités cognitives qui vous permettraient de lire cet article et de vous rendre compte que vous êtes en réalité : une Ford Fiesta.

Vous trouvez cet article « complètement con »

Les voitures ont tendance à ne pas comprendre les articles puisqu’elles ne peuvent pas les lire, et à les trouver par conséquent « complètement con ». Si ce dernier point vous fait écho, plus aucun doute sur votre nature : vous êtes bien une automobile américaine de type Ford Fiesta.', N'Déterminer si l’on est un humain ou une modèle de voiture américaine n’est pas toujours chose facile. Pourtant, certains indices peuvent vous mettre la puce à l’oreille. Le Gorafi vous accompagne dans cette entreprise...')
INSERT [dbo].[tblNews] ([idNews], [idAuteur], [NewsPicture], [NewsDate], [NewsTitre], [NewsTxt], [NewsResume]) VALUES (13, 1, N'LaMainDeDieu.jpg', CAST(N'2015-02-05' AS Date), N'Dieu se demande si activer la fonction « Désastres et épidémies » de son jeu vidéo était une bonne idée ', N'Joueur invétéré, Dieu se demande s’il a fait le bon choix en activant la fonction « Désastres et épidémies » de son jeu vidéo, une simulation assez riche qui permet de jouer avec plusieurs civilisations en même temps. « Je pensais que c’était une bonne idée au début, quand je joue je n’aime pas quand c’est trop facile » explique la divinité qui a commencé à jouer d’abord en « difficulté moyenne ». Mais au fil du temps, le jeu lui a paru un peu répétitif, trop facile. « Je suis passé alors en mode Difficulté élevée  et c’est devenu intéressant niveau gestion, complexe » explique-t-il. Pour corser encore la chose, il décide alors d’activer la fonction « Désastres et épidémies ».

Dieu se retrouve alors confronté à plusieurs catastrophes en même temps et à une difficulté de jeu de moins en moins gérable. « J’ai l’impression que mes civilisations ont perdu des XP de culture et de sagesse alors que j’avais atteint un bon niveau. C’est presque devenu injouable d’un coup » se lamente-t-il. « J’aurais peut-être dû lire le manuel de mon jeu avant de m’y mettre mais ça prend trop de temps ». Dieu se demande maintenant s’il doit continuer à jouer, reprendre une vieille sauvegarde ou simplement tout recommencer à zéro. « Honnêtement, ça m’ennuierait de tout recommencer. Je perdrais tous mes trophées et victoires ».

Après une relecture rapide du manuel, Dieu tombe alors sur une phrase qui stipule qu’en mode difficile, lorsque les désastres sont activés, ils ne sont dès lors plus désactivables. « Mais c’est totalement nul, comment on peut programmer un jeu ainsi » s’emporte-t-il en jetant sa souris d’ordinateur sur le clavier, actionnant accidentellement le mode « Très Difficile ».', N'Joueur invétéré, Dieu se demande s’il a fait le bon choix en activant la fonction « Désastres et épidémies » de son jeu vidéo, une simulation assez riche qui permet de jouer avec plusieurs civilisations en même temps. ..')
SET IDENTITY_INSERT [dbo].[tblNews] OFF
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD  CONSTRAINT [FK_tblNews_tblAuteurs] FOREIGN KEY([idAuteur])
REFERENCES [dbo].[tblAuteurs] ([idAuteur])
GO
ALTER TABLE [dbo].[tblNews] CHECK CONSTRAINT [FK_tblNews_tblAuteurs]
GO
USE [master]
GO
ALTER DATABASE [InfosNews] SET  READ_WRITE 
GO
