-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Már 21. 12:15
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zarodolgozat`
--
CREATE DATABASE IF NOT EXISTS `zarodolgozat` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `zarodolgozat`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `forum`
--

CREATE TABLE `forum` (
  `k_id` int(11) NOT NULL,
  `k_nev` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `k_szoveg` varchar(300) COLLATE utf8_hungarian_ci NOT NULL,
  `k_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `forum`
--

INSERT INTO `forum` (`k_id`, `k_nev`, `k_szoveg`, `k_datum`) VALUES
(10, 'Artúr', 'Has gyakorlatok nincsenek', '2022-03-02'),
(12, 'Ádám', 'Nem tetszik a dizájn', '2022-03-06'),
(19, 'Balázs', 'nagy izzadt férfiak like', '2022-03-18');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyakorlatok`
--

CREATE TABLE `gyakorlatok` (
  `id_gyakorlatok` int(11) NOT NULL,
  `gyakorlat_nev` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `gyakorlat_kep` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `gyakorlat_leiras` text COLLATE utf8_hungarian_ci NOT NULL,
  `izom_gyakorlat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `gyakorlatok`
--

INSERT INTO `gyakorlatok` (`id_gyakorlatok`, `gyakorlat_nev`, `gyakorlat_kep`, `gyakorlat_leiras`, `izom_gyakorlat_id`) VALUES
(1, 'Mell gyakorlat: Fekvenyomás', '1.png', 'Kiinduló helyzet:\r\nFeküdj le a padra, és csúsztasd be a testedet úgy, hogy a szemeid nagyjából a rúd magasságában legyenek. Lábaiddal támaszkodj meg stabilan a talajon. Fogd meg a rudat vállszélességnél valamelyest nagyobb (nagyjából 10-15 cm-es) fogástávolsággal és emeld ki a rudat a mellkasod fölé.\r\n\r\nA végrehajtás\r\nA lapockákat kissé hátraszorítva, lassan engedd le a rudat a mellkasodig. Az alsó holtponton tartsd meg egy pillanatig, majd az oly népszerű pattintós mozdulat nélkül nyomd vissza a kiinduló helyzetbe. A felső holtponton a mellizom feszülésére koncentrálj rá, ezáltal nem is tudod majd (és nem is kell) kiakasztani a könyöködet.', 1),
(2, 'Mell gyakorlat: Fekvenyomás ferde padon egykezes súlyzókkal', '2.png', 'Kiinduló helyzet: \r\nÁllítsd a fekpadot 30-45 fokos magasságra. Ha megvan a kívánt magasság, akkor üljünk le a padra, és helyezzük a térdünkre a súlyt. Feküdjünk hanyatt a padon, majd a súlyokat emeljük fel mellmagasságba, párhuzamos karokkal, úgy hogy a tenyerünk kifelé nézzen.\r\n\r\nA végrehajtás\r\n Engedjük le mindkét súlyt a mellkasunk külső, felső részéhez, tartsuk meg a mozdulatot egy pillanatra, majd a mellizmok erejével nyomjuk fel ismét a súlyt a kiinduló helyzetig. A mozgás során a könyök és a váll maradjon egy vonalban, az alkar pedig legyen végig függőleges.', 1),
(3, 'Mell gyakorlat: Tárogatás gépen', '3.png', 'Kiinduló helyzet: \r\nHátra nyúlsz, megragadod mindkét kezeddel a gép fogantyúit, a könyökeidet behajlítod 10 - 15fokos szögbe, és ez így is kell, hogy maradjon a gyakorlat során.\r\n\r\nA végrehajtás\r\nÖsszenyomod előre és befelé, félkörívben a gép karjait, amíg össze nem érnek, és itt megtartod egy pillanatig, ezáltal a mellizom teljesen összehúzódik\r\nUtána lassan félkörívben visszaengeded, a kiinduló helyzetbe, amíg a mellizmok nyújtott állapotba nem kerülnek', 1),
(4, 'Mell gyakorlat: Gépes mell nyomás', '4.png', 'Kiinduló helyzet: \r\nÜlj be a gépbe, használj a vállszélességnél valamivel szélesebb fogást, és tartsd feszesen a hátadat.\r\n\r\nA végrehajtás\r\nA fejed és a csípődet tartsd a gép támlájához szorítva, koncentrálj a mellizom megfeszítésére, emeld ki a mellkasodat, a vállakat ne engedd előre. Így nyomd ki a kart, állítsd meg a könyék kiakasztása előtti ponton, majd engedd vissza kontrolláltan.', 1),
(5, 'Hát gyakorlat: Mellhez húzás csigán, szűk fogással ', '5.png', 'Kiinduló helyzet: \r\nElsőként is szereld fel a csigás gépre a gyakorlathoz szükséges V-alakú fogantyút. Ülj le ezután a padra, a támasz alá helyezve a térded. Az ülőkét olyan magasra állítsd, hogy a talpak stabilan a talajon legyenek és teljesen kinyújtott karral a fogantyú tartása közben a súlyok már elemelkedjenek a tartóról. \r\n\r\nA végrehajtás \r\nKissé homorított háttal a hátizmok erejére koncentrálva húzd le a fogantyút a mellkasodhoz. A könyökeidet hátrafelé, befelé mozgasd, úgy, hogy a lapockák kellőképpen össze tudjanak húzódni. Az alsó ponton tartsd meg egy rövid pillanatra a súlyt a lapockák maximális összehúzódására koncentrálva. Végül engedd vissza lassan a fogantyút, a kiindulópontig, hogy a hátizmaid szépen kinyúljanak.', 2),
(6, 'Hát gyakorlat: Evezés T-rúddal ', '6.png', 'Kiinduló helyzet: \r\nAmennyiben olyan szerencsés helyzetben vagyunk, hogy a terem rendelkezik T-rudas evezéshez szükséges szerkezettel, akkor nincs más dolgunk, mint ráállni kis terpeszben a lábtartó részre, mellkasunkat megtámasztani a támlán és megfogni a rudat a fogantyúknál. T-rudas gép híján mi magunk is összeeszkábálhatunk egyet: egy rúd, némi tárcsa és egy V-fogantyú segítségével. Ebben az esetben is hasonló a kiindulás: kis terpeszállás, és a térdeidet enyhén behajlítva dőlj előre (nagyjából 45 fokig). \r\n\r\nA végrehajtás\r\nA lapockák összehúzásával indítva a mozdulatot, húzd a fogantyút a mellkasod aljáig, miközben enyhén kidomborítod a hátad és kiemeled a mellkasod. A könyökök végig a test mellett, hátrafelé haladnak. A felső holtponton tartsd meg pár másodpercig a mozdulatot, a lapockák maximális összehúzódása érdekében. Lassan ereszd vissza a súlyt, a hátizmok teljes kinyúlásáig. ', 2),
(7, 'Hát gyakorlat: Húzódzkodás ', '7.png', 'Kiinduló helyzet: \r\nKeressünk egy húzódzkodásra alkalmas keretet a teremben. Kapaszkodjunk meg a rúdban széles fogással (a fogástávolság nagyjából 30 cm-el legyen szélesebb a válladnál, mind a két oldalon), és a lábainkat összekulcsolva függeszkedjünk.\r\n\r\nA végrehajtás\r\nHúzzuk fel magunkat az állunk magasságáig, úgy hogy közben a könyökünket hátrahúzva a lapockákat próbáljuk maximálisan összepréselni. A felső ponton tartsuk meg magunkat egy pillanatra, koncentráljunk a teljes összehúzódásra, majd lassan - a gravitációval megküzdve - eresszük le magunkat a kiinduló helyzetbe. A testtartásunk legyen végig enyhén homorítva.\r\nA helyes légzéstechnika: Amikor felhúzzuk magunkat, kifújjuk a levegőt, amikor leereszkedünk, akkor pedig mély lélegzetet veszünk.', 2),
(8, 'Hát gyakorlat: Evezés ülve, csigán ', '8.png', 'Kiinduló helyzet: \r\nTedd a talpadat az evezőpad lábtámaszára, úgy hogy a lábad a térdednél maradjon enyhén behajlítva. Hajolj előre a fogantyúért. Kiinduláskor tehát a törzs egyenes, karunkkal kinyújtva tartjuk a súlyt.\r\n\r\nA végrehajtás\r\nA lapockák összehúzásával indítva a mozdulatot, húzd a fogantyút a hasadhoz, miközben enyhén kidomborítod a hátad és kiemeled a mellkasod. A könyökök végig a test mellett, enyhén kifelé haladnak. A végponton tartsd meg pár másodpercig a mozdulatot, a lapockák maximális összehúzódása érdekében.\r\nVégül, lassan engedd vissza a fogantyút addig, amíg a karod kinyúlik. Csak a felső vállöv területe jöhet kissé előre a súly visszaengedését követően, de a törzsünk a függőleges vonalnál ne dőljön előrébb.', 2),
(9, 'Váll gyakorlat: Mellről nyomás állva', '9.png', 'Kiinduló helyzet\r\nVállszélességű fogást vegyél fel a kétkezes súlyzón úgy, hogy a tenyered kifelé mutat, és a rúd keresztben fekszik vállad elülső részén.\r\n\r\nA végrehajtás\r\nNyomd egyenesen fel a súlyzót az arcod előtt, egészen addig, míg a karod kiegyenesedik, és a súlyzó közvetlenül a fejed fölött van. Lassan engedd vissza a kiinduló helyzetbe a súlyzót, és ismételd meg a mozgást az előírt ismétlésszámmal.', 3),
(10, 'Váll gyakorlat: Oldalemelés állva', '10.png', 'Kiinduló helyzet\r\nÁllj kiegyenesedve, tarts hajlított könyökkel egy-egy egykezes súlyzót mindkét kezedben.\r\n\r\nA végrehajtás\r\nA súlyzókat egyszerre emeld ki oldalra a tested mellől addig, amíg vállmagasságnál egy kicsit fentebb nem kerül a súly. Engedd vissza lassan, és ismételd meg a gyakorlatot.', 3),
(11, 'Váll gyakorlat: Előreemelés', '11.png', 'Kiinduló helyzet\r\nÁllj egyenesen, mindkét kezedben egy-egy egykezes súlyzót vagy egy egyenes rudat tartva kartávolságnyira, keresztben a combközépen.\r\n\r\nA végrehajtás\r\nEmeld a kézisúlyzókat szemmagasságig akár egyenként, akár együtt, könyöködet enyhén behajlítva. Lassan ereszd vissza és ismételj. Ugyanezt végezheted rúddal is.', 3),
(12, 'Váll gyakorlat: Állig húzás', '12.png', 'Kiinduló helyzet\r\nÁllj egyenesen, szűk fogást véve (a mutatóujjak kb. 15 cm-re legyenek egymástól a rúdon) a kétkezes súlyzó közepén, tenyerekkel a test felé. A mozgás elején a súlyzónak keresztbe kell feküdnie felső combodon, karod pedig legyen egyenes.\r\n\r\nA végrehajtás\r\nLassan húzd a súlyzót felfelé tested közelében egy vonal mentén, könyöködet felfelé emelve és mindig a kezed vonala fölött tartva. Amint a rúd nyakmagasságba ér, tarts szünetet, és ereszd le a súlyzót lassan ugyanezen vonalon, egészen addig, míg a combodhoz ér. Ismételd meg a gyakorlatot az előírt ismétlésszámban.', 3),
(13, 'Tricepsz gyakorlat: Csigás letolás', '13.png', 'Kiinduló helyzet\r\nKiinduláskor úgy fogd meg a készülék rúdját, hogy kezeid 5-20 cm-re legyenek egymástól.\r\n\r\nA végrehajtás\r\nNyomd le a rudat egészen addig, amíg a karjaid ki nem egyenesednek. Engedd vissza a súlyt, és ismételd meg a mozdulatot. A legtöbben e gyakorlat során a könyöküket szorosan az oldalukhoz szorítják, de néhányan viszont oldalt kinyomják és \"belehajolnak\" a mozdulatba. Fontos azonban, hogy a könyök mozdulatlan legyen.', 5),
(14, 'Tricepsz gyakorlat: Tricepsznyújtás fekve', '14.png', 'Kiinduló helyzet\r\nVedd fel ugyanazt a kiinduló helyzetet, mint a fekvenyomásnál, azonban ennél közeli fogást alkalmazz (15 cm a mutatóujjak között) a kétkezes súlyzórúd közepén.\r\n\r\nA végrehajtás\r\nFelkarodat mozdulatlanul tartva, hajlítsd be könyöködet, és mozgasd a súlyzót félkörívben egészen addig, amíg a homlokodhoz nem ér, vagy a fejed felett túl nem megy a padon. Emeld vissza a súlyzót ugyanezen félkörív mentén a kiinduló helyzetbe, és ismételd meg a gyakorlatot az előírt számban.', 5),
(15, 'Tricepsz gyakorlat: Tolódzkodás', '15.png', 'Kiinduló helyzet\r\nAmikor a tricepszedet edzed a korláton, a lábaid legyenek a test alatt, álladat szegd le a melledre, könyökeidet tartsd magad mellett, és a test, amennyire lehet, legyen egyenes.\r\n\r\nA végrehajtás\r\nEngedd le magad olyan mélyre, amennyire csak bírod, a kinyomás végén pedig teljesen nyújtsd ki a karodat, és feszíts rá a tricepszedre a felső holtponton.', 5),
(16, 'Tricepsz gyakorlat: Kábeles tricepsznyújtás kötéllel', '16.png', 'Kiinduló helyzet\r\nVegyél fel a hátgépnek háttal döntött törzsű, jól kiegyensúlyozott helyzetet, és fogd meg a hátizom gépre erősített tricepsz kötelet.\r\n\r\nA végrehajtás\r\nFelsőkarjaid állandó mozdulatlan helyzetére nagyon ügyelve nyújtsd ki az alkarodat. Lassan, rángatás nélkül kezdd el a mozdulatot. Ez a gyakorlat kiválóan edzi a tricepsz külső fejét.', 5),
(17, 'Bicepsz gyakorlat: Bicepsz állva francia rúddal', '17.png', 'Kiinduló helyzet\r\nFogd meg a franciarudat tetszőleges fogással az ujjaiddal felfelé, és tartsd a rudat a combod előtt kinyújtott karokkal. Szűkebb fogással a bicepsz külső feje kap nagyobb szerepet, szélesebb fogás esetén a belső fej kapja a terhelés nagyobbik részét.\r\n\r\nA végrehajtás\r\nFélkörívben emeld fel a rudat a karjaid behajlításával addig, míg a bicepszed el nem éri a csúcsösszehúzódás pontját. Figyelj rá hogy olyan pozícióban fejezd be a mozgást, amikor a bicepsz még dolgozik - ha túl magasra emeled a súlyt, azzal tehermentesítheted a célizmot. A könyöködet tartsd a testedhez minél közelebb, és lehetőleg mozdulatlanul.', 4),
(18, 'Bicepsz gyakorlat: Bicepsz Scott-padon ', '18.png', 'Kiinduló helyzet\r\nHelyezkedj el a Scott-pad (bicepsz-pad) mögött kényelmesen (ehhez a gyakorlathoz célszerű, ha van edzőpartner a közelben, hogy segíthessen a súlyt elvenni a gyakorlat végén).\r\n\r\nA végrehajtás\r\nMindkét karoddal egyszerre emeld fel a súlyt addig, míg az alkarod a bicepszedhez nem ér. Lassan engedd vissza a súlyokat, kihasználva a teljes mozgástartományt.', 4),
(19, 'Bicepsz gyakorlat: Kábeles bicepsz kötéllel', '19.png', 'Kiinduló helyzet\r\nKalapács fogással fogd meg az alsó csigára rögzített kötelet, a hátad maradjon egyenes.\r\n\r\nA végrehajtás\r\nHa lehet, könyöködet egy helyben tartva, lassan és egyenletesen emeld a kötél végét a válladhoz, majd ereszd vissza. Ügyelj a lassú negatív szakaszra és arra, hogy a könyököd ne mozogjon ki oldalra.', 4),
(20, 'Bicepsz gyakorlat: Bicepsz állva váltott karral', '20.png', 'Kiinduló helyzet\r\nÁllj egyenesen egy-egy egykezes súlyzóval a kézben, kis terpeszállásban. A hátadat és a fejedet tartsd egyenesen, a csípődet és a lábaidat tartsd mozdulatlanul. A kiinduló pozícióban a karjaid a tested mellett lógnak, a hüvelykujjakkal befelé fordítva, de végezheted végig kifordított hüvelykujjakkal is a gyakorlatot - mindkét módszernek megvan az előnye.\r\n\r\nA végrehajtás\r\nLélegezz be, majd kilégzés közepette kezdd el behajlítani a jobb karodat. A hüvelykujjadat, miután a súlyzó elhagyta a combodat, lassan forgasd felfelé és emeld fel egészen addig, míg az alkarod a bicepszedhez nem ér, ebben a pozícióban pár pillanatig próbáld meg megtartani a súlyt. Ez után lassan engedd vissza a súlyt, miközben a hüvelykujjadat újra befelé fordítod. Hogy már eközben elkezded-e emelni a másik karoddal a súlyt, vagy megvárod amíg visszaérkezel a kiinduló pozícióba, és utána látsz neki a másik karral a munkának, a te döntésed. Jobban fogsz tudni koncentrálni a mozdulatra, ha megvárod, míg az egyik kar végigér a mozdulaton. Ismételd meg a mozgást a bal kezeddel is.', 4),
(21, 'Comb gyakorlat: Lábtolás', '21.png', 'Kiinduló helyzet\r\nHelyezd a lábaidat egymástól mintegy harminc centiméterre a készülék taposólemeze alá.\r\n\r\nA végrehajtás\r\nNyomd ki a lábaidat, amíg a lábad ki nem egyenesedik, de a térdedet ne akaszd ki. Engedd vissza a súlyt, és ismételd a gyakorlatot.', 6),
(22, 'Comb gyakorlat: Lábnyújtás gépen', '22.png', 'Kiinduló helyzet\r\nÜlj a lábgépbe úgy, hogy térdhajlatód a pad emelőkar felőli oldalának végéhez simuljon. Akaszd be lábfejedet a görgőpárna alá, és fogd meg a pad oldalát a kezeddel, egyenes helyzetben tartva felsőtestedet.\r\n\r\nA végrehajtás\r\nA quadricepsz erejét használva, lassan egyenesítsd ki lábadat. Tartsd ki a csúcsösszehúzódást 1-2 másodpercig, majd lassan engedd vissza a lábadat. Ismételd a mozgást az előírt számban.', 6),
(23, 'Comb gyakorlat: Lábhajlítás ülve', '23.png', 'Kiinduló helyzet\r\nÜlj a gépbe, támaszd ki a hátadat és tartsd is a támlához szorítva végig a gyakorlat ideje alatt. Akaszd be sarkad a görgőpárnák alá, és nyújtsd ki teljesen a lábad. Fogd meg a pad széleit, és tartsd a csípődet a párnázott felülethez szorítva.\r\n\r\nA végrehajtás\r\nA láb kétfejű izmait használva hajlítsd be a lábadat, amennyire csak tudod. Tartsd ki ezt a leginkább összehúzott helyzetet 1-2 másodpercig, majd ereszkedj vissza a kiinduló pontig. Ismételd a mozgást az előírt számban.', 6),
(24, 'Comb gyakorlat: Guggolás', '24.png', 'Kiinduló helyzet\r\nÁllj kiegyenesedve egy kétkezes súlyzó rúdját egyensúlyozva a nyakad mögött a hátadon keresztben, és a recézett rúdrészt a súlytárcsák közelében fogva. Tedd sarkaidat egymástól 30-50 cm-re úgy, hogy lábfejeid kissé kifelé mutassanak.\r\n\r\nA végrehajtás\r\nSzemeddel nézz egy pontra magad elé, szemmagasságnál kicsit feljebb, és tartsd tekintetedet azon a ponton az egész mozgás során. Ezután lassan hajlítsd be térdedet, és ereszd le tested teljes guggolásba. Tartsd a törzsedet kihúzva, a hátadat egyenesen, és fejedet felfelé (a szem egy ponton való rögzítése segíti ezt) az egész mozgás folyamán. Ha combjaid a padlóval való vízszintes helyzeten túlhaladtak már, akkor lassan emelked fel a kiinduló helyzetbe. Igyekezz a sarkadat mindig a padlón tartani.', 6),
(25, 'Vadli gyakorlat: Álló vádligép', '25.png', 'Kiinduló helyzet\r\nÁll a vádligépbe úgy, hogy csak a talppárnáidon támaszkodj.\r\n\r\nA végrehajtás\r\nEmelkedj lábujjhegyre és ereszkedj vissza, anélkül, hogy nagyon behajlítanád a térdedet vagy visszarugóznál az alsó holtpontról.', 7),
(26, 'Vadli gyakorlat: Ülő vádligép', '26.png', 'Kiinduló helyzet\r\nÜlj be a gépbe, a térdedet szorítsd be a támasz alá úgy, hogy a vádlid megnyújtott állapotban legyen.\r\n\r\nA végrehajtás\r\nAkaszd ki a rögzítő kart. Emeld meg a vádlidat amennyire tudod, feszíts rá a felső ponton, majd lassan engedd vissza. Ügyelj rá, hogy ne rugózz az alsó ponton!', 7),
(58, 'Vadli gyakorlat: Lábtológépen', 'vadli.png', 'Kiinduló helyzet \r\nÜlj be a lábtoló gépbe, és csak a talppárnáidon támaszkodj meg a gépen.\r\n  \r\nA végrehajtás \r\nA térdeidet tartsd összezárva. A lábfejeddel told ki a súlyt, amennyire csak tudod, majd engedd vissza, amennyire csak lehetséges.', 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `izomcsoport`
--

CREATE TABLE `izomcsoport` (
  `izom_id` int(11) NOT NULL,
  `izom_nev` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `izom_kep` varchar(150) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `izomcsoport`
--

INSERT INTO `izomcsoport` (`izom_id`, `izom_nev`, `izom_kep`) VALUES
(1, 'Mell', '1.1.png'),
(2, 'Hát', '2.1.png'),
(3, 'Váll', '3.1.png'),
(4, 'Bicepsz', '4.1.png'),
(5, 'Tricepsz', '5.1.png'),
(6, 'Comb', '6.1.png'),
(7, 'Vádli', '7.1.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `video_nev` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `video_link` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `video_telo` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `video`
--

INSERT INTO `video` (`video_id`, `video_nev`, `video_link`, `video_telo`) VALUES
(1, 'BOHOS KORNÉL - A Harcos útja', 'https://www.youtube.com/embed/rO0sYlpxWrU', 'rO0sYlpxWrU'),
(2, 'Bodybuilding Motivation - KATHI \"BÉCI\" BÉLA', 'https://www.youtube.com/embed/rsWw-JN46Xw', 'rsWw-JN46Xw'),
(3, 'Bohos Kornél – „Mindig állj fel!”', 'https://www.youtube.com/embed/VZjO_uaFdV0', 'VZjO_uaFdV0'),
(4, 'Best Workout Music Mix 2022 Gym Motivation Music 2022 Workout Mix 2022', 'https://www.youtube.com/embed/wtFPIOV2bWM', 'wtFPIOV2bWM'),
(5, 'Kathi Béla és Bohos Kornél legjobb közös sztorijai', 'https://www.youtube.com/embed/OVRNmeuE88E', 'OVRNmeuE88E');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`k_id`);

--
-- A tábla indexei `gyakorlatok`
--
ALTER TABLE `gyakorlatok`
  ADD PRIMARY KEY (`id_gyakorlatok`),
  ADD KEY `izom_gyakorlat_id` (`izom_gyakorlat_id`);

--
-- A tábla indexei `izomcsoport`
--
ALTER TABLE `izomcsoport`
  ADD PRIMARY KEY (`izom_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A tábla indexei `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `forum`
--
ALTER TABLE `forum`
  MODIFY `k_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `gyakorlatok`
--
ALTER TABLE `gyakorlatok`
  MODIFY `id_gyakorlatok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT a táblához `izomcsoport`
--
ALTER TABLE `izomcsoport`
  MODIFY `izom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `gyakorlatok`
--
ALTER TABLE `gyakorlatok`
  ADD CONSTRAINT `gyakorlatok_ibfk_1` FOREIGN KEY (`izom_gyakorlat_id`) REFERENCES `izomcsoport` (`izom_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
