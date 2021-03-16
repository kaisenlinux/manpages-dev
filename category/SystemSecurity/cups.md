cups(1)                                                                      Apple Inc.                                                                      cups(1)

NOM
       cups - Système d’impression au code source ouvert, basé sur les standards

DESCRIPTION
       CUPS  est le logiciel utilisé pour imprimer à partir d’applications telles que traitement de texte, lecteur de courriels, éditeur d’images et navigateur web.
       Il convertit les descriptions de page (mettre un paragraphe ici, dessiner une ligne là, etc.) en quelque chose que l’imprimante puisse comprendre, et ensuite
       envoie l’information vers l’imprimante.

       Maintenant, comme chaque fabricant fait les choses à sa manière, une impression peut être très compliquée. CUPS fait au mieux pour dissimuler cela à l’appli‐
       cation comme à l’utilisateur de façon que celui-ci se concentre sur l’impression sans se soucier de la manière de faire.  Généralement,  la  seule  fois  que
       l’utilisateur se soucie de son imprimante, c’est lors de sa première utilisation, et même alors, CUPS peut faire les choses de lui-même.

   COMMENT ÇA MARCHE ?
       Lors  de  la  première  impression,  CUPS  crée  une  file d’attente pour conserver une trace de l’état actuel de l’imprimante (toutes choses OK, plus de pa‐
       pier, etc.) et de toutes les pages imprimées. La plupart du temps la file d’attente concerne l’imprimante connectée à votre ordinateur sur la prise USB.  Ce‐
       pendant,  elle peut concerner une imprimante du réseau, une imprimante sur Internet ou plusieurs imprimantes suivant la configuration. Quelque soit l’endroit
       concerné par la file d’attente, celles-ci seront semblables à n’importe quelle autre imprimante pour les applications et l’utilisateur.

       Chaque fois qu’une impression est réalisée, CUPS crée un travail qui contient la file d’attente à laquelle l’impression est envoyée, le nom du document à im‐
       primer,  et les descriptions de page. Les travaux sont numérotés (queue-1, queue-2, etc.) pour pouvoir contrôler l’impression du travail ou son annulation en
       cas d’erreur. Lorsque CUPS accepte un travail d’impression, il détermine les meilleurs programmes (filtres, pilotes d’imprimante, écoute  de  ports  et  pro‐
       grammes de transmission) pour convertir les pages dans un format imprimable et les exécuter pour réellement réaliser l’impression.

       Lorsque  le  travail d’impression est complètement terminé, CUPS retire le travail de la file d’attente et commence tout autre travail demandé. Une notifica‐
       tion peut être aussi faite lorsque le travail est terminé, ou si une erreur s’est produite, de différentes manières.

   OÙ COMMENCER ?
       Le moyen le plus facile est de commencer avec l’interface web pour configurer l’imprimante. Allez à l’adresse « http://localhost:631 »,  choisissez  l’onglet
       Administration au haut de la page, cliquez sur le bouton « Add Printer » (ajouter une imprimante) et suivez les indications.

       Lorsqu’un  identifiant et un mot de passe sont demandés, entrez votre identifiant de connexion et votre mot de passe, ou l’identifiant et mot de passe du su‐
       perutilisateur.

       Après l’ajout de l’imprimante, les options par défaut de l’imprimante sont demandées (taille de papier, mode de sortie, etc.). Faites  tous  les  changements
       nécessaires  et  cliquez  sur  le bouton « Set Default Options » pour les enregistrer. Quelques imprimantes peuvent aussi s’auto-configurer — cliquez sur les
       boutons « Query Printer » (recherche imprimante) puis « Default Options » (options par défaut) pour mettre à jour les options automatiquement.

       Une fois l’imprimante ajoutée, elle peut être utilisée à partir de n’importe quelle application. Le bouton « Print Test Page » du menu de maintenance  permet
       d’imprimer une page simple de test et de vérifier le bon fonctionnement général.

       Les  commandes lpadmin(8) et lpinfo(8) permettent d’ajouter des imprimantes à CUPS. De plus, le système d’exploitation peut comporter une interface graphique
       ou automatiquement créer une file d’attente d’impression lors de la connexion de l’imprimante.

   COMMENT OBTENIR DE L’AIDE ?
       Le site web de CUPS (<URL:http://www.CUPS.org>) permet d’accéder aux listes de diffusion cups et cups-devel, à  des  informations  et  ressources  complémen‐
       taires,  et  à  la base de données des rapports de bogue. La plupart des fournisseurs maintiennent des forums de discussion en ligne, permettant de poser des
       questions pour votre système d’exploitation.

ENVIRONNEMENT
       Les commandes de CUPS utilisent les variables d’environnement suivantes pour outrepasser les emplacements de fichier, etc. Pour des raisons de sécurité,  ces
       variables sont ignorées par les programmes setuid :

       CUPS_ANYROOT
            Autoriser tout certificat racine X.509 (Oui ou Non).

       CUPS_CACHEDIR
            Le répertoire où se trouvent les fichiers cache semi-persistant.

       CUPS_DATADIR
            Le répertoire où se trouvent les fichiers de données.

       CUPS_ENCRYPTION
            Le niveau de chiffrement par défaut (Always, IfRequested, Never, Required).

       CUPS_EXPIREDCERTS
            Autoriser les certificats X.509 périmés (Oui ou Non).

       CUPS_GSSSERVICENAME
            Le nom de service Kerberos utilisé pour authentification.

       CUPS_SERVER
            Le nom d’hôte ou adresse IP et le numéro de port de l’ordonnanceur CUPS (nom_hôte:port ou adresse_ip:port).

       CUPS_SERVERBIN
            Le répertoire où trouver les programmes d’assistance du serveur, les filtres, les programmes de transmission, etc.

       CUPS_SERVERROOT
            Le répertoire racine du serveur.

       CUPS_STATEDIR
            Le répertoire où trouver les fichiers d’état.

       CUPS_USER
            Indiquer le nom d'utilisateur pour les requêtes d’impression.

       HOME Définir le répertoire personnel (home) de l’utilisateur actuel.

       IPP_PORT
            Indiquer le numéro de port par défaut pour les requêtes IPP.

       LOCALEDIR
            Définir l’emplacement des fichiers d’internationalisation.

       LPDEST
            Indiquer la file d’attente par défaut (standard System V).

       PRINTER
            Indiquer la file d’attente par défaut (standard Berkeley).

       TMPDIR
            Définir l’emplacement des fichiers temporaires.

FICHIERS
       ~/.cups/client.conf
       ~/.cups/lpoptions

CONFORMITÉ
       CUPS se conforme au protocole « Internet Printing Protocol » version 2.1 et met en œuvre les commandes d’impression des systèmes UNIX Berkeley et System V.

NOTES
       CUPS  printer  drivers, backends, and PPD files are deprecated and will no longer be supported in a future feature release of CUPS. Printers that do not sup‐
       port IPP can be supported using applications such as ippeveprinter(1).

VOIR AUSSI
       cancel(1), client.conf(7), cupsctl(8), cupsd(8), lp(1), lpadmin(8), lpinfo(8), lpoptions(1), lpr(1), lprm(1),  lpq(1),  lpstat(1),  aide  en  ligne  de  CUPS
       <URL:http://localhost:631/help>, site web de CUPS <URL:http://www.CUPS.org>, PWG Internet Printing Protocol Workgroup <URL:h://www.pwg.org/ipp>

COPYRIGHT
       Copyright 2007-2019 par Apple Inc.

26 avril 2019                                                                   CUPS                                                                         cups(1)
