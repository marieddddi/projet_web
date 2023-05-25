-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Jeu 25 Mai 2023 à 22:38
-- Version du serveur :  10.3.38-MariaDB-0+deb10u1
-- Version de PHP :  7.3.31-1~deb10u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `leschefs`
--

-- --------------------------------------------------------

--
-- Structure de la table `AVIS`
--

CREATE TABLE `AVIS` (
  `id_avis` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL COMMENT 'titre de l''''avis',
  `texte_avis` varchar(200) DEFAULT NULL COMMENT 'contenu de l''''avis',
  `id_pers` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant de la personne qui a rédigé l''''avis'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `AVIS`
--

INSERT INTO `AVIS` (`id_avis`, `titre`, `texte_avis`, `id_pers`) VALUES
(1, 'SUPER BON', 'Une cuillère et j\'ai eu l\'impression d\'etre de retour en France. Je le referai pour toute ma famille sans hésiter !', 10),
(2, 'INCROYABLE', 'DÉ-LI-CIEUX ! Rien à dire !', 22),
(3, 'Formidable', 'Cette recette est l\'une des meilleure que j\'ai mangé de ma vie !', 21),
(33, 'Quelle belle découverte !', 'Facile et rapide pour une entrée. Trop bon, merci pour cette recette.', 10),
(88, 'BISTRO ADORABLE', 'C\'est tout doux ce velouté. Moi j\'adore. J\'ai rehaussé le gout avec un peu de piment turc. Servi avec quelques noix de cajou pour le croquant.', 22);

-- --------------------------------------------------------

--
-- Structure de la table `FAVORIS`
--

CREATE TABLE `FAVORIS` (
  `id_page_recette` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la page de recettes',
  `id_pers` int(11) NOT NULL COMMENT 'clé étrangére, identifiant de la personne',
  `favoris` tinyint(1) DEFAULT NULL COMMENT 'favoris'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `FRIGO`
--

CREATE TABLE `FRIGO` (
  `id_pers` int(11) NOT NULL COMMENT 'clé primaire et étrangére, identifiant de la personne',
  `id_ingredient` int(11) NOT NULL COMMENT 'clé primaire et étrangére, identifiant de l''''ingrédient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `FRIGO`
--

INSERT INTO `FRIGO` (`id_pers`, `id_ingredient`) VALUES
(10, 23),
(10, 44);

-- --------------------------------------------------------

--
-- Structure de la table `ILLUSTRATIONS`
--

CREATE TABLE `ILLUSTRATIONS` (
  `id_page_recette` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la page de rectte',
  `lien_presentation` varchar(255) DEFAULT NULL COMMENT 'lien vers l''''llustration de la présentation du plat',
  `id_ingredient1` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant vers l''ingrédient 1 pour recuperer son illustration',
  `id_ingredient2` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant vers l''ingrédient 1 pour recuperer son illustration',
  `lien_final` varchar(255) DEFAULT NULL COMMENT 'lien vers l''''llustration de la présentation du plat final'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Contenu de la table `ILLUSTRATIONS`
--

INSERT INTO `ILLUSTRATIONS` (`id_page_recette`, `lien_presentation`, `id_ingredient1`, `id_ingredient2`, `lien_final`) VALUES
(1, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.Lnkn8bpWKDGaEkedftod1QHaFj%26pid%3DApi&f=1&ipt=baed5999ccf12e2a961a7ebbbc780b871c06b12dbffa41fa0f38b3b82d5b10f3&ipo=images', 1, 2, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fassets.afcdn.com%2Frecipe%2F20200907%2F114026_w400h400c1cx540cy960.jpg&f=1&nofb=1&ipt=259631a4f8c6eb1fac8bc6bce88651ddda472f6ef8f4b394d48e57e211a65f48&ipo=images'),
(2, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fdb%2F58%2Fcc%2Fdb58ccfbcf9d0a2968dcd9bccc9074d0.jpg&f=1&nofb=1&ipt=2f38ff0c34c6a481d5bd4f145ba31e923493bce775a79138ebe0a970bc94bbcf&ipo=images', 6, 8, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.recetteaz.net%2Fwp-content%2Fuploads%2F2016%2F02%2Frecette-lasagnes-bolognaise.jpg&f=1&nofb=1&ipt=8c7c47a561203a323a87d0aa1ff72a4ea81107abfaa8a5c70096c1c37e21d155&ipo=images'),
(3, 'https://recette.supertoinette.com/150511/b/riz-cantonais.jpg', 16, 19, 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/a6d77527-6549-424c-be63-5076b3ad2960/Derivates/7ec247d4-5010-42bd-8ab7-df140cd54df0.jpg'),
(4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcuisine-addict.com%2Fwp-content%2Fuploads%2F2019%2F10%2Frecette-pates-carbonara-166x166.jpg&f=1&nofb=1&ipt=08111ebdbe62bc85e474914b7f8f55ae3b33eaad058a6c7f1f52c746046919a6&ipo=images', 20, 22, 'https://thumbs.dreamstime.com/b/p%C3%A2tes-de-carbonara-spaghetti-avec-le-pancetta-oeuf-parmesan-dur-et-sauce-cr%C3%A8me-cuisine-italienne-traditionnelle-carbo-d-alla-111813414.jpg'),
(5, 'http://goodtoknow.media.ipcdigital.co.uk/111/00000b929/24bc/Tartiflette-recipe.jpg', 26, 27, 'https://www.cuisine-blog.fr/wp-content/uploads/2017/11/fotolia_60240140_subscription_xxl.jpg'),
(6, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.cuisineetsentiments.com%2Fimages%2Fpaupiette-de-veau_7.jpg&f=1&nofb=1&ipt=f2b7b10933f5c90042a18e30acd562115c09cfdda9a89129079aefd90393e156&ipo=images', 37, 34, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tendriade.fr%2Fwp-content%2Fuploads%2Fambiances-festives-paupiettes.jpg&f=1&nofb=1&ipt=c8e9299a2c3a9d8b23a9007b06450a1792bfa20bb31872b117a9f00d1a60c026&ipo=images'),
(7, 'https://www.chezandre.fr/wp-content/uploads/2014/10/recette-blanquette-de-veau.png', 39, 7, 'https://lespetitsplatsdechristopher.files.wordpress.com/2021/01/wp-16108018172593629381126326612770.jpg?w=1168'),
(8, 'https://cache.marieclaire.fr/data/photo/w1000_c17/cuisine/49/oeufssouffle.jpg', 22, 47, 'http://3.bp.blogspot.com/-V8jo4dBWQgY/Ud1g8GxaAMI/AAAAAAAAJBw/aNDQuQWnki0/w1200-h630-p-k-no-nu/oeufs+souffl%C3%A9+ouvert.JPG'),
(9, 'https://assets.afcdn.com/recipe/20221010/135902_w1000h667c1cx1360cy887cxb2121cyb1414.webp', 48, 50, 'https://assets.afcdn.com/recipe/20141031/28311_w1000h747c1.webp'),
(10, 'https://assets.afcdn.com/recipe/20150922/57763_w1024h768c1cx1296cy864.jpg', 53, 41, 'https://www.cuisineactuelle.fr/imgre/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F3faa3a37-2c18-4567-881c-c1c05de38413.2Ejpeg/748x372/quality/80/crop-from/center/amour-de-saumon-en-papillote.jpeg'),
(11, 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.cuisineetsentiments.com%2Fimages%2Fcreme-aux-oeufs_2.jpg&f=1&nofb=1&ipt=1e29793e2c1af4b4fcfe0ef784d0aca4cbd78500f7d69ac82fe4bcd1cff93bf5&ipo=images', 78, 22, 'https://img.cuisineaz.com/610x610/2013-12-20/i46431-creme-aux-oeufs.jpg'),
(12, 'https://www.lescarnetsdemarine.com/wp-content/uploads/2020/04/unnamed-2-1-scaled.jpg', 54, 55, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Frecettes-cookeo.fr%2Fwp-content%2Fuploads%2F2019%2F04%2Frisotto-asperges-cookeo.jpg&f=1&nofb=1&ipt=d3d4e6f53e4c6626fd65d1d46983fb96654ff4e07abc2bc87afba3b20cc1a766&ipo=images'),
(13, 'https://4.bp.blogspot.com/-uhzy-xLwLQs/VqsLfkndDYI/AAAAAAAAMyY/2O-G27COLBc/s640/FullSizeRender%252889%2529.jpg', 53, 57, 'https://www.recettesclub.com/photos/gratin-de-ravioles-aux-courgettes-et-saumon-fume.jpg'),
(14, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fassets.afcdn.com%2Frecipe%2F20150813%2F59911_w1024h768c1cx3932cy2832.jpg&f=1&nofb=1&ipt=aa3e48e1aa72b1ea3548b42074debeacccc7302060b3314cd40dbe204135b8b2&ipo=images', 62, 63, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fproduitsitaliens.fr%2Fwp-content%2Fuploads%2F2020%2F04%2Foliveail.jpg&f=1&nofb=1&ipt=3435374a631d5a77656625842569c61ea1ee7ba27658cfc318d622b012e3d115&ipo=images'),
(15, 'https://assets.afcdn.com/recipe/20180921/82297_w1000h1500c1cx2000cy3000cxb4000cyb6000.webp', 64, 65, 'https://assets.afcdn.com/recipe/20130925/25080_w1000h925c1.webp'),
(16, 'https://assets.afcdn.com/recipe/20191125/102972_w640h486c1cx1423cy3405cxb2805cyb5000.webp', 22, NULL, 'https://www.lessecretsduchef.be/img/cms/Oeuf_63_Parmesan-8-2%20recadr%C3%A9.jpg'),
(17, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.mesrecettesfaciles.fr%2Fwp-content%2Fuploads%2F2018%2F05%2Fempanadasthon-1000x500.jpg&f=1&nofb=1&ipt=e52f45cee233797ec6960fb5c8a95f090cdd420354c324dd0894ef070cc10d67&ipo=images', 69, 68, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fp8.storage.canalblog.com%2F85%2F88%2F1343559%2F113554812_o.jpg&f=1&nofb=1&ipt=e62b1576ed8f84ad64aa092c46d6160203904d17e3f1891e49bc66a62d8ea937&ipo=images'),
(18, 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Flecamionpizza-lanapo.com%2Fwp-content%2Fuploads%2F2012%2F07%2Fpizznutella.jpg&f=1&nofb=1&ipt=0b1eda17a2cd80a55c924ba62d0d8a59bef5b8663080426eebce65132846f9b7&ipo=images', 70, 72, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.tappizza.ro%2Fwp-content%2Fuploads%2F2020%2F11%2FTAP-89-1024x819.jpg&f=1&nofb=1&ipt=f5099d8fa419742861df909a4fbee3c31ff6c15317a096e1b65bdfbca5ab7fc6&ipo=images'),
(19, 'https://assets.afcdn.com/recipe/20140723/28102_w1000h1330c1.webp', 12, 23, 'https://assets.afcdn.com/recipe/20160514/28835_w1000h1333c1.webp'),
(20, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.cuisineaz.com%2F610x610%2F2018-09-05%2Fi142351-veloute-patates-douces-et-carottes.jpeg&f=1&nofb=1&ipt=2824732319888c306cab08cb59442447b8bef2280e9c465b6682f09e86d16d96&ipo=images', 44, 32, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fe9%2F0b%2F44%2Fe90b44c993f7eda65fa6e9b479712e5a.jpg&f=1&nofb=1&ipt=6faccfb9d77b989f015e8ab2079f7e4b2ad52f84bbbbd53188180699390f06c8&ipo=images');

-- --------------------------------------------------------

--
-- Structure de la table `INGREDIENTS`
--

CREATE TABLE `INGREDIENTS` (
  `id_ingredient` int(11) NOT NULL COMMENT 'clé primaire, identifiant vers un ingrédient',
  `nom` varchar(100) DEFAULT NULL COMMENT 'nom de l''''ingrédient',
  `lien_photo` varchar(255) DEFAULT NULL COMMENT 'lien vers une photo de l''''ingrédient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `INGREDIENTS`
--

INSERT INTO `INGREDIENTS` (`id_ingredient`, `nom`, `lien_photo`) VALUES
(1, 'Curry', 'https://assets.afcdn.com/recipe/20170607/67368_w120h120c1cx350cy350.webp'),
(2, 'Filet de poulet', 'https://assets.afcdn.com/recipe/20170607/67699_w120h120c1cx350cy350.webp'),
(3, 'Sauce soja', 'https://assets.afcdn.com/recipe/20170607/67466_w120h120c1cx350cy350.webp'),
(4, 'Ciboulette', 'https://assets.afcdn.com/recipe/20170607/67695_w120h120c1cx350cy350.webp'),
(5, 'Crème fraîche', 'https://assets.afcdn.com/recipe/20170619/68883_w120h120c1cxb700cyb700.webp'),
(6, 'Pâtes \"lasagnes\"', 'https://assets.afcdn.com/recipe/20170607/67588_w120h120c1cx350cy350.webp'),
(7, 'Carotte', 'https://assets.afcdn.com/recipe/20170607/67370_w120h120c1cx350cy350.webp'),
(8, 'Purée de tomate', 'https://assets.afcdn.com/recipe/20181023/83358_w120h120c1cx1000cy1000cxb2000cyb2000.webp'),
(9, 'Eau', 'https://assets.afcdn.com/recipe/20190308/88958_w120h120c1cx150cy150cxb300cyb300.webp'),
(10, 'Feuilles de laurier', 'https://assets.afcdn.com/recipe/20170621/68932_w120h120c1cxb700cyb700.webp'),
(11, 'Thym', 'https://assets.afcdn.com/recipe/20170607/67735_w120h120c1cx350cy350.webp'),
(12, 'mozzarella', 'https://assets.afcdn.com/recipe/20170607/67396_w120h120c1cx2027cy2027.webp'),
(13, 'Fromage râpé', 'https://assets.afcdn.com/recipe/20170607/67732_w120h120c1cx1484cy1346.webp'),
(14, 'Parmesan', 'https://assets.afcdn.com/recipe/20230414/142093_w120h120c1cx411cy411cxb822cyb822.webp'),
(15, 'Farine', 'https://assets.afcdn.com/recipe/20170607/67682_w120h120c1cx350cy350.webp'),
(16, 'Riz', 'https://assets.afcdn.com/recipe/20170607/67667_w120h120c1cx350cy350.webp'),
(17, 'Crevettes décortiquées', 'https://assets.afcdn.com/recipe/20170607/67700_w120h120c1cx2736cy1824.webp'),
(18, 'Jambon', 'https://assets.afcdn.com/recipe/20170607/67343_w120h120c1cx350cy350.webp'),
(19, 'Petits pois', 'https://assets.afcdn.com/recipe/20170607/67733_w120h120c1cx350cy350.webp'),
(20, 'Pâtes', 'https://assets.afcdn.com/recipe/20170607/67341_w120h120c1cx350cy350.webp'),
(21, 'chapelure', 'https://assets.afcdn.com/recipe/20170607/67436_w120h120c1cx350cy350.webp'),
(22, 'oeuf', 'https://assets.afcdn.com/recipe/20220126/128066_w120h120c1cx1140cy1140cxb2280cyb2280.webp'),
(23, 'tomate', 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.infoescola.com%2Fwp-content%2Fuploads%2F2011%2F01%2Ftomate_345187874.jpg&f=1&nofb=1&ipt=994a0ffbe3c47d0fa5dbfdad59c4754df8300afcaa3f67c07d6fc9b0d86379c9&ipo=images'),
(24, 'Pecorino', 'https://assets.afcdn.com/recipe/20170731/71017_w120h120c1cxb4288cyb2848.webp'),
(25, 'Poitrine fumée', 'https://assets.afcdn.com/recipe/20170607/67393_w120h120c1cx350cy350.webp'),
(26, 'Reblochon', 'https://assets.afcdn.com/recipe/20170607/67516_w120h120c1cx350cy350.webp'),
(27, 'Pomme de terre', 'https://assets.afcdn.com/recipe/20170607/67419_w120h120c1cx350cy350.webp'),
(28, 'Lardons fumés', 'https://assets.afcdn.com/recipe/20170607/67477_w120h120c1cx350cy350.webp\r\n'),
(32, 'ail', 'https://assets.afcdn.com/recipe/20170607/67514_w120h120c1cx350cy350.webp'),
(33, 'oignon', 'https://assets.afcdn.com/recipe/20170607/67621_w120h120c1cx350cy350.webp'),
(34, 'Fond de veau', 'https://assets.afcdn.com/recipe/20170607/67741_w120h120c1cx350cy350.webp'),
(35, 'Moutarde', 'https://assets.afcdn.com/recipe/20170621/69095_w120h120c1cxb700cyb700.webp'),
(36, 'Vinaigre balsamique', 'https://assets.afcdn.com/recipe/20170607/67527_w120h120c1cx350cy350.webp'),
(37, 'Paupiette de veau', 'https://assets.afcdn.com/recipe/20190304/88730_w120h120c1cx150cy150cxb300cyb300.webp'),
(38, 'Vin blanc', 'https://assets.afcdn.com/recipe/20170607/67771_w120h120c1cx350cy350.webp'),
(39, 'Blanquette de veau', 'https://assets.afcdn.com/recipe/20171201/75710_w120h120c1cx2500cy1572cxb5000cyb3144.webp'),
(40, 'Bouillon de poule', 'https://assets.afcdn.com/recipe/20170621/68969_w120h120c1cxb700cyb700.webp'),
(41, 'Champignon', 'https://assets.afcdn.com/recipe/20170607/67739_w120h120c1cx350cy350.webp'),
(42, 'Citron', 'https://assets.afcdn.com/recipe/20170607/67457_w120h120c1cx350cy350.webp'),
(43, 'basilic', 'https://assets.afcdn.com/recipe/20170607/67553_w120h120c1cx350cy350.webp'),
(44, 'lait de coco', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.regal.fr%2Fsites%2Fart-de-vivre%2Ffiles%2Fr58_lait-coco-ayam-recto_dr.jpg&f=1&nofb=1&ipt=bd0704e803896ca4243ca375fcb64ff5a4d31b8fe7f7aaabbf886c704a2bfaed&ipo=images'),
(45, 'Beurre', 'https://assets.afcdn.com/recipe/20201201/115998_w120h120c1cx912cy821cxb1824cyb1643.webp'),
(46, 'Cube de bouillon de légumes', 'https://assets.afcdn.com/recipe/20230303/140910_w120h120c1cx270cy270cxb540cyb540.webp'),
(47, 'Muscade', 'https://assets.afcdn.com/recipe/20170607/67662_w120h120c1cx350cy350.webp'),
(48, 'Gruyère râpé', 'https://assets.afcdn.com/recipe/20170607/67500_w120h120c1cx350cy350.webp'),
(49, 'Lait', 'https://assets.afcdn.com/recipe/20170607/67388_w120h120c1cx350cy350.webp'),
(50, 'Dés de jambon', 'https://assets.afcdn.com/recipe/20170607/67738_w120h120c1cx350cy350.webp'),
(51, 'Tomates cerises', 'https://assets.afcdn.com/recipe/20170607/67652_w120h120c1cx350cy350.webp'),
(52, 'Aneth', 'https://assets.afcdn.com/recipe/20170607/67431_w120h120c1cx350cy350.webp'),
(53, 'Saumon frais', 'https://assets.afcdn.com/recipe/20170607/67773_w120h120c1cx350cy350.webp'),
(54, 'Asperges', 'https://assets.afcdn.com/recipe/20170607/67425_w120h120c1cx350cy350.webp'),
(55, 'Riz pour risotto type Arborio', 'https://assets.afcdn.com/recipe/20170621/69153_w120h120c1cxb300cyb300.webp'),
(56, 'Bouillon de légumes', 'https://assets.afcdn.com/recipe/20230303/140911_w120h120c1cx270cy270cxb540cyb540.webp'),
(57, 'Courgette', 'https://assets.afcdn.com/recipe/20170607/67437_w120h120c1cx350cy262.webp'),
(58, 'Raviole', 'https://assets.afcdn.com/recipe/20170621/69145_w120h120c1cxb700cyb700.webp'),
(59, 'Saumon fumé', 'https://assets.afcdn.com/recipe/20170607/67460_w120h120c1cx350cy350.webp'),
(60, 'mayonnaise', 'https://assets.afcdn.com/recipe/20170607/67759_w120h120c1cx350cy350.webp'),
(61, 'patate douce', 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.roseedeschamps.fr%2Fwp-content%2Fuploads%2F2019%2F07%2FFotolia_84470054_Subscription_Monthly_M.jpg&f=1&nofb=1&ipt=b66d396d37d753572244dbb73428311f5dbd57ae1b26bfc36f7cf813a4d90e56&ipo=images'),
(62, 'huile d olive', 'https://assets.afcdn.com/recipe/20220114/127365_w120h120c1cx411cy411cxb822cyb822.webp'),
(63, 'olives', 'https://assets.afcdn.com/recipe/20170607/67566_w120h120c1cx350cy350.webp'),
(64, 'tequila', 'https://assets.afcdn.com/recipe/20210316/118625_w120h120c1cx451cy451cxb902cyb902.webp'),
(65, 'grenadine', 'https://assets.afcdn.com/recipe/20170621/69069_w120h120c1cxb700cyb700.webp'),
(66, 'jus de citron', 'https://assets.afcdn.com/recipe/20220404/130682_w120h120c1cx241cy362cxb483cyb724.webp'),
(67, 'jus d orange', 'https://assets.afcdn.com/recipe/20170621/69080_w120h120c1cxb700cyb700.webp'),
(68, 'poivron', 'https://assets.afcdn.com/recipe/20170607/67754_w120h120c1cx350cy350.webp'),
(69, 'thon en boite', 'https://assets.afcdn.com/recipe/20170607/67518_w120h120c1cx350cy350.webp'),
(70, 'pâte à pizza', 'https://assets.afcdn.com/recipe/20221207/138286_w120h120c1cx287cy287cxb574cyb574.webp'),
(71, 'banane', 'https://assets.afcdn.com/recipe/20170607/67637_w120h120c1cx350cy350.webp'),
(72, 'nutella ', 'https://assets.afcdn.com/recipe/20170607/67520_w120h120c1cx350cy350.webp'),
(73, 'amandes effilées', 'https://assets.afcdn.com/recipe/20170607/67684_w120h120c1cx350cy350.webp'),
(74, 'sucre', 'https://assets.afcdn.com/recipe/20170607/67691_w120h120c1cx350cy350.webp'),
(75, 'miel', 'https://assets.afcdn.com/recipe/20170607/67597_w120h120c1cx350cy350.webp'),
(76, 'liqueur sucrée', 'https://assets.afcdn.com/recipe/20170607/67446_w120h120c1cx350cy350.webp'),
(77, 'poires', 'https://assets.afcdn.com/recipe/20170607/67498_w120h120c1cx350cy350.webp'),
(78, 'vanille', 'https://assets.afcdn.com/recipe/20170607/67724_w120h120c1cx350cy350.webp'),
(432, 'huile d\'olive', 'https://assets.afcdn.com/recipe/20220114/127365_w120h120c1cx411cy411cxb822cyb822.webp');

-- --------------------------------------------------------

--
-- Structure de la table `LISTE_AVIS`
--

CREATE TABLE `LISTE_AVIS` (
  `id_liste_avis` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la liste de l''''avis',
  `id_avis` int(11) NOT NULL COMMENT 'clé étrangére, identifiant de l''''avis'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `LISTE_AVIS`
--

INSERT INTO `LISTE_AVIS` (`id_liste_avis`, `id_avis`) VALUES
(1, 1),
(1, 88),
(3, 2),
(3, 33);

-- --------------------------------------------------------

--
-- Structure de la table `LISTE_INGREDIENTS`
--

CREATE TABLE `LISTE_INGREDIENTS` (
  `id_liste_ingredients` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la liste d''ingrédients',
  `id_ingredient` int(11) NOT NULL COMMENT 'clé étrangére, identifiant des ingrédients',
  `quantite` float DEFAULT NULL COMMENT 'quantite',
  `unite_universelle` varchar(3) DEFAULT NULL COMMENT 'unité universelle de la quanité (L,kG...)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `LISTE_INGREDIENTS`
--

INSERT INTO `LISTE_INGREDIENTS` (`id_liste_ingredients`, `id_ingredient`, `quantite`, `unite_universelle`) VALUES
(1, 1, 0.5, 'cac'),
(1, 2, 2, NULL),
(1, 3, 2, 'cas'),
(1, 4, 2, NULL),
(1, 5, 5, 'cl'),
(1, 32, NULL, NULL),
(1, 33, 0.5, NULL),
(1, 432, 0.5, 'càs'),
(2, 6, 1, NULL),
(2, 7, 1, NULL),
(2, 8, 800, 'g'),
(2, 9, 15, 'cl'),
(2, 10, 2, NULL),
(2, 11, NULL, NULL),
(2, 13, 70, 'g'),
(2, 14, 125, 'g'),
(2, 15, 100, 'g'),
(2, 33, 3, NULL),
(3, 16, 200, 'g'),
(3, 17, 50, 'g'),
(3, 18, 75, 'g'),
(3, 19, 3, 'cas'),
(3, 22, 2, NULL),
(3, 33, 2, NULL),
(3, 432, 2, 'cas'),
(4, 20, 600, 'g'),
(4, 22, 4, NULL),
(4, 24, 300, 'g'),
(4, 25, 300, 'g'),
(5, 26, 1, NULL),
(5, 27, 1, 'Kg'),
(5, 28, 200, 'g'),
(5, 32, 1, NULL),
(5, 33, 200, 'g'),
(5, 432, 2, 'cas'),
(6, 9, 12.5, 'cl'),
(6, 32, 1, NULL),
(6, 34, 2, 'cas'),
(6, 35, 1, 'cas'),
(6, 36, 1, 'cas'),
(6, 37, 4, NULL),
(6, 38, 12.5, 'cl'),
(6, 432, 1, 'cas'),
(7, 5, 0.5, NULL),
(7, 7, 1, NULL),
(7, 15, NULL, NULL),
(7, 22, NULL, NULL),
(7, 33, 0.5, NULL),
(7, 38, 12.5, 'cl'),
(7, 39, 0.5, 'Kg'),
(7, 40, 0.5, NULL),
(7, 41, 5, NULL),
(7, 42, 1, NULL),
(7, 46, 0.5, NULL),
(8, 22, 4, NULL),
(8, 45, NULL, NULL),
(8, 47, NULL, NULL),
(9, 5, 5, 'cl'),
(9, 15, 1, 'cas'),
(9, 22, 1.5, NULL),
(9, 48, 50, 'g'),
(9, 49, 0.25, 'L'),
(9, 50, 75, NULL),
(10, 32, 0.5, NULL),
(10, 41, 10, NULL),
(10, 42, 0.5, NULL),
(10, 51, 10, NULL),
(10, 52, 2, NULL),
(10, 53, 2, NULL),
(10, 432, NULL, NULL),
(11, 12, 250, 'g'),
(11, 21, NULL, NULL),
(11, 22, 1, NULL),
(11, 23, 6, NULL),
(11, 32, 1, NULL),
(11, 33, 1, NULL),
(11, 43, NULL, NULL),
(11, 432, NULL, NULL),
(12, 14, 50, 'g'),
(12, 33, 0.5, NULL),
(12, 38, 7.5, 'cl'),
(12, 45, 25, 'g'),
(12, 54, 0.5, NULL),
(12, 55, 150, 'g'),
(12, 56, 0.5, 'L'),
(13, 5, 1.5, 'cas'),
(13, 48, NULL, NULL),
(13, 57, 1.5, NULL),
(13, 58, 3, NULL),
(13, 59, 2, NULL),
(14, 32, 1, NULL),
(14, 43, NULL, NULL),
(14, 62, NULL, NULL),
(14, 63, 100, 'g'),
(15, 64, 8, 'cl'),
(15, 65, 4, 'cl'),
(15, 66, 2, 'càc'),
(15, 67, 30, 'cl'),
(16, 22, 2, NULL),
(17, 23, 0.5, NULL),
(17, 33, 0.5, NULL),
(17, 68, 0.25, NULL),
(17, 69, 50, 'g'),
(17, 432, 0.25, NULL),
(18, 70, 2, NULL),
(18, 71, 2, NULL),
(18, 72, NULL, NULL),
(18, 73, NULL, NULL),
(19, 74, 2, 'càs'),
(19, 75, 2, 'càs'),
(19, 76, 1, 'càs'),
(19, 77, 2, NULL),
(20, 22, 0.5, NULL),
(20, 49, 25, 'cl'),
(20, 74, 15, 'g'),
(20, 78, 0.5, NULL),
(22, 7, 4, NULL),
(22, 44, 2, 'L'),
(22, 46, 300, 'mL'),
(22, 61, 300, 'g');

-- --------------------------------------------------------

--
-- Structure de la table `LISTE_PLANNING`
--

CREATE TABLE `LISTE_PLANNING` (
  `id_liste_planning` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la liste du planning',
  `id_planning` int(11) NOT NULL COMMENT 'clé primaire, clé étrangére, identifiant du planning '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `LISTE_PLANNING`
--

INSERT INTO `LISTE_PLANNING` (`id_liste_planning`, `id_planning`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `LISTE_RECETTES`
--

CREATE TABLE `LISTE_RECETTES` (
  `id_liste` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la liste',
  `id_page_recette` int(11) NOT NULL COMMENT 'clé primaire, clé étrangére, identifiant de la page de recette correspondante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `LISTE_RECETTES`
--

INSERT INTO `LISTE_RECETTES` (`id_liste`, `id_page_recette`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 13),
(1, 19),
(1, 20),
(2, 19),
(2, 20);

-- --------------------------------------------------------

--
-- Structure de la table `PAGE_RECETTES`
--

CREATE TABLE `PAGE_RECETTES` (
  `id_page_recette` int(11) NOT NULL COMMENT 'clé primaire, identifiant de la page de recettes',
  `nom` varchar(50) DEFAULT NULL COMMENT 'nom de la recette',
  `temps_prep` time DEFAULT NULL COMMENT 'temps de préparation',
  `temps_cuisson` time DEFAULT NULL COMMENT 'temps de cuisson',
  `note` int(1) DEFAULT NULL COMMENT 'note',
  `type` int(1) DEFAULT NULL COMMENT 'type de plat: 0:apéro, 1:entrée, 2:plat, 3:dessert',
  `couverts` int(5) DEFAULT NULL COMMENT 'nombre de couverts',
  `liste_etape` text DEFAULT NULL COMMENT 'ensemble des étapes',
  `id_liste_ingredents` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant de la liste des ingrédients',
  `id_liste_avis` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant de la liste des avis'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `PAGE_RECETTES`
--

INSERT INTO `PAGE_RECETTES` (`id_page_recette`, `nom`, `temps_prep`, `temps_cuisson`, `note`, `type`, `couverts`, `liste_etape`, `id_liste_ingredents`, `id_liste_avis`) VALUES
(1, 'Filet de poulet au curry', '00:10:00', '00:15:00', 5, 2, 2, '1. Couper les filets de poulet en petits morceaux, les mettre dans un saladier avec la sauce soja, l\'ail, l\'huile d\'olive, la ciboulette et le curry. Laissez reposer une heure.\r\n\r\n2. Après, faire revenir l\'oignon avec un peu d\'huile d\'olive, une fois légèrement caramélisé, mettre la viande.\r\n\r\n3.Quand la viande commence à cuire, mettre petit à petit la crème fraîche (épaisse ou liquide), ajouter du curry selon vos goûts sur la viande.\r\n\r\n4. Mélanger bien le tout, saler et poivrer.\r\n', 1, NULL),
(2, 'Lasagne à la bolognaise', '00:30:00', '01:35:00', 5, 2, 2, '1. Faire revenir gousses hachées d\'ail et les oignons émincés dans un peu d\'huile d\'olive.\r\n\r\n2. Ajouter la carotte et la branche de céleri hachée puis la viande et faire revenir le tout.\r\n\r\n3. Au bout de quelques minutes, ajouter le vin rouge. Laisser cuire jusqu\'à évaporation.\r\n\r\n4. Ajouter la purée de tomates, l\'eau et les herbes. Saler, poivrer, puis laisser mijoter à feu doux 45 minutes.\r\n\r\n5. Préparer la béchamel : faire fondre 100 g de beurre.\r\n\r\n6. Hors du feu, ajouter la farine d\'un coup.\r\n\r\n7. Remettre sur le feu et remuer avec un fouet jusqu\'à l\'obtention d\'un mélange bien lisse.\r\n\r\n8. Ajouter le lait peu à peu.\r\n\r\n9. Remuer sans cesse, jusqu\'à ce que le mélange s\'épaississe.\r\n\r\n10. Ensuite, parfumer avec la muscade, saler, poivrer. Laisser cuire environ 5 minutes, à feu très doux, en remuant. Réserver.\r\n\r\n11. Préchauffer le four à 200°C (thermostat 6-7). Huiler le plat à lasagnes. Poser une fine couche de béchamel puis des feuilles de lasagnes, de la bolognaise, de la béchamel et du parmesan. Répéter l\'opération 3 fois de suite.\r\n\r\n12. Sur la dernière couche de lasagnes, ne mettre que de la béchamel et recouvrir de fromage râpé. Parsemer quelques noisettes de beurre.\r\n\r\n13. Enfourner pour environ 25 minutes de cuisson.', 2, NULL),
(3, 'Riz cantonais', '00:20:00', '00:30:00', 4, 2, 2, '1. Faire cuire le riz et le rincer à l\'eau froide.\r\n\r\n2. Couper le jambon en dés, émincer finement les oignons. Mettre à chauffer 1 cuillère d\'huile dans une poêle et faire revenir l\'oignon avec les petits pois (3 mn). Verser le mélange dans un plat.\r\n\r\n3. Faire une omelette et la couper en lanières.\r\n\r\n4. Mettre à chauffer 1 cuillère d\'huile et faire revenir 1 mn les crevettes.\r\n\r\n5. Ajouter le riz, petits pois, oignons, jambon, omelette. Saler et poivrer.\r\n\r\n6. Faire chauffer 3 mn en remuant sans cesse. Servir très chaud', 3, NULL),
(4, 'Spaghettis carbonara', '00:05:00', '00:10:00', 5, 2, 2, '1. Préparer la sauce de la carbonara: battre les jaunes d’œufs avec environ 150g de pecorino râpé et du poivre jusqu’à obtenir une pâte homogène.\r\n\r\n2. Découper la poitrine fumée en gros dés.\r\n\r\n3. Les faire revenir dans une poêle bien chaude jusqu’à ce que les dés soient légèrement roussis.\r\n\r\n4. Faire cuire les pâtes dans une eau non salée (la poitrine est déjà très salée).\r\n\r\n5. Ajouter quelques pâtes chaudes à la sauce et mélanger (cela va réchauffer un peu la sauce avant de l’ajouter aux pâtes).\r\n\r\n6. Mélanger le reste des pâtes avec le guanciale sans jeter le gras (il va donner consistance et saveur à la sauce).\r\n\r\n7. Ajouter la sauce de la carbonara et mélanger énergiquement pour obtenir une consistance homogène.\r\n\r\n8. Ajouter un peu de pécorino sur votre plat de spaghettis, bomber le torse et déguster tant que c\'est chaud !', 4, NULL),
(5, 'Tartiflette', '00:15:00', '01:00:00', 5, 2, 2, '1. Eplucher les pommes de terre, les couper en dés, bien les rincer et les essuyer dans un torchon propre.\r\n\r\n2.Faire chauffer l\'huile dans une poêle, y faire fondre les oignons.\r\n\r\n3. Lorsque les oignons sont fondus, ajouter les pommes de terre et les faire dorer de tous les côtés.\r\n\r\n4. Lorsqu\'elles sont dorées, ajouter les lardons et finir de cuire. Éponger le surplus de gras avec une feuille de papier essuie-tout.\r\n\r\n5. D\'autre part, gratter la croûte du reblochon et le couper en deux (ou en quatre).\r\n\r\n6. Préchauffer le four à 200°C (thermostat 6-7) et préparer un plat à gratin en frottant le fond et les bords avec la gousse d\'ail épluchée.\r\n\r\n7. Dans le plat à gratin, étaler une couche de pommes de terre aux lardons, disposer dessus la moitié du reblochon, puis de nouveau des pommes de terre. Terminer avec le reste du reblochon (croûte vers les pommes de terre).\r\n\r\n8. Enfourner pour environ 20 minutes de cuisson', 5, NULL),
(6, 'Paupiettes de veau', '00:15:00', '00:30:00', 4, 2, 2, '1. Dans une sauteuse, faire chauffer l\'huile d\'olive avec la gousse d\'ail finement coupée, à feu moyen.\r\n\r\n2. Lorsque c\'est bien chaud, mettre les paupiettes à dorer quelques minutes de chaque côté.\r\n\r\n3. Quand toutes les faces sont légèrement colorées, ajouter le fond de veau et mouiller avec le vin blanc et l\'eau.\r\n4. Ensuite mettre la moutarde, le vinaigre balsamique et bien mélanger en retournant les paupiettes pour qu\'elles s\'imbibent bien de la sauce.\r\n\r\n5. Laisser cuire 5 minutes à feu moyen, pour que l\'alcool du vin blanc s\'évapore, puis mettre à feu doux et couvrir. Laisser mijoter 20 minutes environ, en retournant les paupiettes de temps en temps.\r\n\r\n6. S\'accommode avec toutes sortes de légumes ainsi que des féculents.', 6, NULL),
(7, 'Blanquette de veau', '00:15:00', '02:00:00', 4, 2, 2, '1. Faire revenir la viande dans un peu de beurre doux jusqu\'à ce que les morceaux soient un peu dorés.\r\n\r\n2. Saupoudrer de 2 cuillères de farine. Bien remuer.\r\n\r\n3. Ajouter 2 ou 3 verres d\'eau, les cubes de bouillon, le vin et remuer. Ajouter de l\'eau si nécessaire pour couvrir.\r\n\r\n4. Couper les carottes en rondelles et émincer les oignons puis les incorporer à la viande, ainsi que les champignons.\r\n\r\n5. Laisser mijoter à feu très doux environ 1h30 à 2h00 en remuant.\r\n\r\n6. Si nécessaire, ajouter de l\'eau de temps en temps.\r\n\r\n7. Dans un bol, bien mélanger la crème fraîche, le jaune d’oeuf et le jus de citron. Ajouter ce mélange au dernier moment, bien remuer et servir tout de suite.', 7, NULL),
(8, 'Oeuf au plat au blanc soufflé', '00:05:00', '00:02:00', 4, 2, 2, '1. Séparer les blancs des jaunes.\r\n\r\n2. Battre légèrement les blancs avec une fourchette pour les faire mousser.\r\n\r\n3. Faire chauffer une poêle avec une noix de beurre ou un peu d\'huile.\r\n\r\n4. Mettre les blancs dans la poêle chaude et les assaisonner à votre goût (sel, poivre, muscade, piment d\'espelette, paprika...).\r\n\r\n5. Quand les blancs commencent à prendre, mettre dessus les jaunes et laisser cuire 30 secondes à 1 minute selon votre goût.', 8, NULL),
(9, 'Quiche sans pâte', '00:10:00', '00:30:00', 4, 2, 2, '1. Mixez tous les ingrédients sauf le jambon, le découper en morceaux et mélanger ensuite avec le reste.\r\n\r\n1. Placez dans un plat a tarte beurré et faites cuire une demi-heure à 200°C.', 9, NULL),
(10, 'Amour de saumon en papillote', '00:25:00', '00:25:00', 4, 2, 2, '1. Préchauffer le four à 180°C (thermostat 6). Laver, essorer et ciseler l\'aneth. Peler et émincer la gousse d\'ail finement. Réserver.\r\n\r\n2. Emincer les champignons après les avoir nettoyés.\r\n\r\nÉTAPE 3\r\ntomates cerise\r\nCouper les tomates cerise en deux.\r\n\r\n4. Déposer au centre de chaque feuille de papier cuisson un pavé de saumon,\r\n\r\n5. ajouter les tomates\r\n\r\n6. et les champignons tout autour.\r\n\r\n7. Parsemer les pavés de saumon d\'aneth et d\'ail \r\net les arroser d\'un filet de jus de citron.\r\n\r\n8. Poivrer, saler et terminer par un filet d\'huile d\'olive.\r\n\r\n9. Fermer les papillotes et les mettre au four pendant 25 à 30 minutes.', 10, NULL),
(11, 'Crème aux œufs à la vanille simple', '00:15:00', '00:45:00', 3, 3, 2, '1. Faites bouillir le lait avec le sucre et la vanille.      2. Battez les oeufs en omelette, versez dessus le lait bouillant (retirez la vanille) et fouettez énergiquement. Versez dans un moule que vous placez au bain-marie.      3.Faites cuire dans le four à 150°C (thermostat 5) pendant 45 minutes. Laissez refroidir avant de déguster.', 20, NULL),
(12, 'Risotto aux asperges fraîches', '00:10:00', '00:30:00', 5, 2, 2, '1. Préparer les asperges en cassant le bas de l\'asperge d\'un coup sec (c\'est la partie plus dure), les peler si nécessaire.\r\n\r\n2. Couper en tronçons en réservant les pointes.\r\n\r\n3. Faire fondre le beurre et y mettre à suer les échalotes ou l\'oignon finement coupés.\r\n\r\n4. Ajouter les asperges (sans les pointes) et faites cuire doucement pendant 5 minutes.\r\n\r\n5. Ajouter le riz et remonter le feu.\r\n\r\n6. Verser le vin blanc.\r\n\r\n7. Verser le bouillon de légumes chaud (c\'est important) en 3 fois que l\'on ajoute à chaque fois qu\'il est absorbé.\r\n\r\n8. Le riz ne doit pas être croquant mais crémeux, ne pas trop saler, bouillon vin et fromage le feront.\r\n\r\n9. A mi-cuisson on ajoute les pointes d\'asperges. Goûter pour vérifier la cuisson du riz et poivrer, puis verser le parmesan râpé fin et noix de beurre et bien mélanger pour qu\'il fondent.\r\n\r\n10. Servir très chaud.\r\n\r\n', 12, NULL),
(13, 'Gratin de ravioles au saumon', '00:10:00', '00:30:00', 5, 2, 2, '1. Défaire 3 plaquettes de ravioles et les mettre dans le fond d\'un plat à gratin. Ajouter par dessus les courgettes préalablement coupées en rondelles (et crues). Puis mettre 2 tranches de saumon coupées en morceaux.\r\n\r\n2. Renouveler une fois l\'opération avec les ingrédients restants.\r\n\r\n3. Mettre 4 cuillères à soupe d\'eau dans le plat. Puis couvrir de crème fraîche et de gruyère râpé. Poivrer.\r\n\r\n4. Faire cuire 30 minutes à 200°C.', 13, NULL),
(14, 'olives cocktail', '00:05:00', '00:00:00', 5, 0, 2, '1.Verser les olives vertes dénoyautées dans une boîte refermable.  2.Rajouter la gousse d\'ail émincée et le basilic ciselé (quantité selon goût souhaité).    3.Verser un filet d\'huile d\'olive.   4.Refermer la boîte et secouer.     5.Prêtes à servir pour l\'apéro!\r\n', 14, NULL),
(15, 'Cocktail Tequila sunrise', '00:05:00', '00:00:00', 4, 0, 2, '1. Versez la tequila et le jus de citron dans un verre à cocktail garni de glace et allongez de jus d\'orange.    2. Posez 1 tranche d\'orange sur la boisson et versez la grenadine.', 15, NULL),
(16, 'l\'oeuf parfait', '00:02:00', '00:40:00', 3, 1, 2, '1. Remplir une casserole d\'eau froide et placer les oeufs dedans. Couvrir la casserole pour limiter l\'évaporation.  2.\r\nCommencer à faire chauffer l\'eau. Elle doit atteindre la température exacte de 64°C. Pas plus, car sinon l\'oeuf va trop coaguler, pas moins, car sinon l\'oeuf ne va pas coaguler. Pour atteindre cette température précise, il faut utiliser un thermomètre. Faire cuire pendant 40 minutes.   3. Si vous avez un cuiseur vapeur ou un robot multifonctions type Thermomix, Cook expert de Magimix, Compagnion de Moulinex... utiliser la fonction vapeur et programmer la température de 64°C et un temps de cuisson de 40 minutes.    4. Servir les oeufs immédiatement à la fin de la cuisson.', 16, NULL),
(17, 'Empanada au thon', '00:15:00', '01:00:00', 4, 1, 2, '1. Emincer les oignons, évider le poivron et le détailler en fines lamelles, couper les tomates en petits dés.     2. Chauffer une poêle avec l\'huile d\'olive, faire revenir les oignons et le poivron, à feu doux, pendant 15 min. Ajouter les tomates, et continuer la cuisson, à feu doux, pendant 20 min.   3. Saler, et ajouter le thon émietté. Bien mélanger.    4. Partager la pâte en deux et faire 2 rectangles de même dimensions. Piquer les 2 parties avec une fourchette.     5. Répartir la farce sur la pâte, et recouvrir de l\'autre pâte, bien replier les bords.    6. Badigeonner d\'oeuf.    7. Enfourner à 200 °C (thermostat 6-7) pendant 20 min.', 17, NULL),
(18, 'Pizza dessert au Nutella', '00:10:00', '00:15:00', 5, 3, 2, '1. Tartinez généreusement une pâte à pizza « toute faite » de Nutella, en laissant une marge de 2 ou 2,5 cm des bords.   2.  Garnissez-la à votre guise de lamelles de bananes, amande effilées…   3. Repliez la pâte sur une moitié, et soudez les bords en faisant des motifs.    4. Placez au four pour obtenir une pâte bien dorée, à 180°C (th 6) pendant 15 min environ.\r\n5. Et dégustez tiède !', 18, NULL),
(19, 'mozzarella panée sur son coulis de tomates', '00:15:00', '00:15:00', 5, 1, 3, '1. Préparer la fondue de tomates \r\n2. Emincer l\'oignon, et le faire revenir dans un peu d\'huile d\'olive.\r\n3. Ajouter les tomates finement coupées en dés et l\'ail émincé, saler et poivrer, et ajouter le morceau de sucre. Laisser cuire une dizaine de minutes.\r\n4. Pendant ce temps, couper les boules de mozzarella en tranches épaisses, les passer dans l\'oeuf battu, puis dans la chapelure, et les faire revenir 2 ou 3 min dans un peu d\'huile d\'olive.\r\n5. Ajouter quelques feuilles de basilic dans la fondue de tomates.\r\n6. Dresser l\'assiette :\r\nTapisser le fond d\'une petite assiette de fondue de tomates, poser 1 ou 2 tranches de mozzarella, et parsemer de quelques feuilles de basilic.\r\n7. Servir bien chaud, pour que la mozzarella reste fondante...', 11, 3),
(20, 'velouté de patates douces et carottes', '00:10:00', '00:30:00', 4, 1, 2, '1. DANS UN PREMIER TEMPS, PELEZ LES CAROTTES ET LES PATATES DOUCES. COUPEZ-LES EN CUBES GROSSIERS.\r\n\r\n2. FAITES-LES CUIRE PENDANT 30 MINUTES ENVIRON AFIN QU’ILS DEVIENNENT FONDANTS. N’OUBLIEZ PAS\r\nD’AJOUTER VOTRE BOUILLON DE LÉGUMES.\r\n\r\n3. À LA FIN DE CUISSON, TRANSVASEZ VOS LÉGUMES DANS UN BLENDER, AJOUTEZ LES 300 ML D’EAU AVEC LE\r\nBOUILLON, PUIS LE LAIT DE COCO. MIXEZ JUSQU’À OBTENIR LA TEXTURE SOUHAITÉE.\r\nVOTRE VELOUTÉ DE PATATES DOUCES ET CAROTTES EST PRÊT !', 22, 1);

-- --------------------------------------------------------

--
-- Structure de la table `PERSONNE`
--

CREATE TABLE `PERSONNE` (
  `id_pers` int(11) NOT NULL COMMENT 'clé primaire, identifiant',
  `pseudo` varchar(50) DEFAULT NULL COMMENT 'pseudo',
  `adresse_mail` varchar(50) DEFAULT NULL COMMENT 'adresse mail',
  `mot_de_passe` varchar(50) DEFAULT NULL COMMENT 'mot de passe',
  `id_liste_planning` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant de la liste du planning'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `PERSONNE`
--

INSERT INTO `PERSONNE` (`id_pers`, `pseudo`, `adresse_mail`, `mot_de_passe`, `id_liste_planning`) VALUES
(1, 'falzar62', 'falzar62@gmail.com', 'j\'aimelavie', 2),
(10, 'TEDDY_ted', 'teddydu62@gmail.com', 'tedLens0', NULL),
(21, 'Max', 'max.frer@gmail.com', 'maxouxou2', NULL),
(22, 'danielle_du_07', 'danny.07@yahoo.fr', 'dadatoto22@', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `PLANNING`
--

CREATE TABLE `PLANNING` (
  `id_planning` int(11) NOT NULL COMMENT 'clé primaire, identifiant du planning ',
  `num_semaine` int(2) DEFAULT NULL COMMENT 'numéro de semaine',
  `id_liste` int(11) DEFAULT NULL COMMENT 'clé étrangére, identifiant de liste'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contenu de la table `PLANNING`
--

INSERT INTO `PLANNING` (`id_planning`, `num_semaine`, `id_liste`) VALUES
(1, 22, 2),
(2, 45, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `AVIS`
--
ALTER TABLE `AVIS`
  ADD PRIMARY KEY (`id_avis`),
  ADD KEY `id_pers` (`id_pers`);

--
-- Index pour la table `FAVORIS`
--
ALTER TABLE `FAVORIS`
  ADD PRIMARY KEY (`id_page_recette`,`id_pers`),
  ADD KEY `id_page_recette` (`id_page_recette`),
  ADD KEY `id_pers` (`id_pers`);

--
-- Index pour la table `FRIGO`
--
ALTER TABLE `FRIGO`
  ADD PRIMARY KEY (`id_pers`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`),
  ADD KEY `id_pers` (`id_pers`);

--
-- Index pour la table `ILLUSTRATIONS`
--
ALTER TABLE `ILLUSTRATIONS`
  ADD PRIMARY KEY (`id_page_recette`),
  ADD KEY `id_ingredient1` (`id_ingredient1`),
  ADD KEY `id_ingredient2` (`id_ingredient2`);

--
-- Index pour la table `INGREDIENTS`
--
ALTER TABLE `INGREDIENTS`
  ADD PRIMARY KEY (`id_ingredient`);

--
-- Index pour la table `LISTE_AVIS`
--
ALTER TABLE `LISTE_AVIS`
  ADD PRIMARY KEY (`id_liste_avis`,`id_avis`),
  ADD KEY `id_avis` (`id_avis`);

--
-- Index pour la table `LISTE_INGREDIENTS`
--
ALTER TABLE `LISTE_INGREDIENTS`
  ADD PRIMARY KEY (`id_liste_ingredients`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `LISTE_PLANNING`
--
ALTER TABLE `LISTE_PLANNING`
  ADD PRIMARY KEY (`id_liste_planning`,`id_planning`),
  ADD KEY `id_planning` (`id_planning`);

--
-- Index pour la table `LISTE_RECETTES`
--
ALTER TABLE `LISTE_RECETTES`
  ADD PRIMARY KEY (`id_liste`,`id_page_recette`),
  ADD KEY `id_page_recette` (`id_page_recette`);

--
-- Index pour la table `PAGE_RECETTES`
--
ALTER TABLE `PAGE_RECETTES`
  ADD PRIMARY KEY (`id_page_recette`),
  ADD KEY `id_liste_ingredents` (`id_liste_ingredents`),
  ADD KEY `id_liste_avis` (`id_liste_avis`);

--
-- Index pour la table `PERSONNE`
--
ALTER TABLE `PERSONNE`
  ADD PRIMARY KEY (`id_pers`),
  ADD KEY `id_liste_planning` (`id_liste_planning`);

--
-- Index pour la table `PLANNING`
--
ALTER TABLE `PLANNING`
  ADD PRIMARY KEY (`id_planning`),
  ADD KEY `id_liste` (`id_liste`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `AVIS`
--
ALTER TABLE `AVIS`
  MODIFY `id_avis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT pour la table `PERSONNE`
--
ALTER TABLE `PERSONNE`
  MODIFY `id_pers` int(11) NOT NULL AUTO_INCREMENT COMMENT 'clé primaire, identifiant', AUTO_INCREMENT=38;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `AVIS`
--
ALTER TABLE `AVIS`
  ADD CONSTRAINT `AVIS_ibfk_1` FOREIGN KEY (`id_pers`) REFERENCES `PERSONNE` (`id_pers`);

--
-- Contraintes pour la table `FAVORIS`
--
ALTER TABLE `FAVORIS`
  ADD CONSTRAINT `FAVORIS_ibfk_1` FOREIGN KEY (`id_page_recette`) REFERENCES `PAGE_RECETTES` (`id_page_recette`),
  ADD CONSTRAINT `FAVORIS_ibfk_2` FOREIGN KEY (`id_pers`) REFERENCES `PERSONNE` (`id_pers`);

--
-- Contraintes pour la table `FRIGO`
--
ALTER TABLE `FRIGO`
  ADD CONSTRAINT `FRIGO_ibfk_1` FOREIGN KEY (`id_pers`) REFERENCES `PERSONNE` (`id_pers`),
  ADD CONSTRAINT `FRIGO_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `INGREDIENTS` (`id_ingredient`);

--
-- Contraintes pour la table `ILLUSTRATIONS`
--
ALTER TABLE `ILLUSTRATIONS`
  ADD CONSTRAINT `ILLUSTRATIONS_ibfk_1` FOREIGN KEY (`id_page_recette`) REFERENCES `PAGE_RECETTES` (`id_page_recette`),
  ADD CONSTRAINT `ILLUSTRATIONS_ibfk_2` FOREIGN KEY (`id_ingredient1`) REFERENCES `INGREDIENTS` (`id_ingredient`),
  ADD CONSTRAINT `ILLUSTRATIONS_ibfk_3` FOREIGN KEY (`id_ingredient2`) REFERENCES `INGREDIENTS` (`id_ingredient`);

--
-- Contraintes pour la table `INGREDIENTS`
--
ALTER TABLE `INGREDIENTS`
  ADD CONSTRAINT `INGREDIENTS_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `LISTE_INGREDIENTS` (`id_ingredient`);

--
-- Contraintes pour la table `LISTE_AVIS`
--
ALTER TABLE `LISTE_AVIS`
  ADD CONSTRAINT `LISTE_AVIS_ibfk_1` FOREIGN KEY (`id_avis`) REFERENCES `AVIS` (`id_avis`),
  ADD CONSTRAINT `LISTE_AVIS_ibfk_2` FOREIGN KEY (`id_liste_avis`) REFERENCES `PAGE_RECETTES` (`id_liste_avis`);

--
-- Contraintes pour la table `LISTE_INGREDIENTS`
--
ALTER TABLE `LISTE_INGREDIENTS`
  ADD CONSTRAINT `LISTE_INGREDIENTS_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `INGREDIENTS` (`id_ingredient`),
  ADD CONSTRAINT `LISTE_INGREDIENTS_ibfk_2` FOREIGN KEY (`id_liste_ingredients`) REFERENCES `PAGE_RECETTES` (`id_liste_ingredents`);

--
-- Contraintes pour la table `LISTE_PLANNING`
--
ALTER TABLE `LISTE_PLANNING`
  ADD CONSTRAINT `LISTE_PLANNING_ibfk_1` FOREIGN KEY (`id_liste_planning`) REFERENCES `PERSONNE` (`id_liste_planning`),
  ADD CONSTRAINT `LISTE_PLANNING_ibfk_2` FOREIGN KEY (`id_planning`) REFERENCES `PLANNING` (`id_planning`);

--
-- Contraintes pour la table `LISTE_RECETTES`
--
ALTER TABLE `LISTE_RECETTES`
  ADD CONSTRAINT `LISTE_RECETTES_ibfk_1` FOREIGN KEY (`id_liste`) REFERENCES `PLANNING` (`id_liste`);

--
-- Contraintes pour la table `PAGE_RECETTES`
--
ALTER TABLE `PAGE_RECETTES`
  ADD CONSTRAINT `PAGE_RECETTES_ibfk_1` FOREIGN KEY (`id_page_recette`) REFERENCES `LISTE_RECETTES` (`id_page_recette`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
