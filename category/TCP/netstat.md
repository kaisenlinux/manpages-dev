NETSTAT(8)                                                          Linux Administrator's Manual                                                          NETSTAT(8)

NAME
       netstat  -  Affiche  les  connexions  réseau,  les  tables de routage, les statistiques des interfaces, les connexions masquées, les messages netlink, et les
       membres multicast.

SYNOPSIS
       netstat [-venaoc] [--tcp|-t] [--udp|-u] [--udplite|-U] [--sctp|-S] [--raw|-w] [--groups|-g] [--unix|-x] [--inet|--ip] [--ax25] [--ipx] [--netrom]

       netstat [-veenc] [--inet] [--ipx] [--netrom] [--ddp] [--ax25] {--route|-r}

       netstat [-veenpac] {--interfaces|-i} [iface]

       netstat [-enc] {--masquerade|-M}

       netstat [-cn] {--netlink|-N}

       netstat {-V|--version} {-h|--help}

DESCRIPTION
       Netstat affiche les informations du sous-système réseau de Linux

   (no option)
       Vous pouvez voir l'état des connexions réseau en listant les sockets ouvertes. C'est l'option par défaut : si vous ne spécifiez  aucune  famille  d'adresses,
       les  sockets  actives  de  toutes les familles d'adresses seront affichées. Avec le paramètre -e vous obtenez quelques informations supplémentaires (userid).
       Avec le paramètre -v vous pouvez demander à netstat de signaler des familles d'adresses connues non supportées par le noyau. Le paramètre -o affiche des  in‐
       formations  supplémentaires  sur  les  timers réseau. En donnant le paramètre -p vous verrez le PID et le nom du processus à qui appartient la socket. Le pa‐
       ramètre -a affiche toutes les sockets, y compris les sockets d'écoute des serveurs. La famille d'adresses inet affiche les sockets raw, udp et tcp.

   -r, --route
       Avec le paramètre -r, --route vous pouvez visualiser les tables de routage dans le même format qu'avec la commande route -e netstat -er utilisera  le  format
       de la commande route. Veuillez consulter route(8) pour plus de détails.

   -i, --interfaces iface
       Si vous utilisez l'option -i, --interfaces , une table de toutes (ou de l'interface iface spécifiée) les interfaces réseau sera affichée. Le format de sortie
       est le même que celui de la commande ifconfig -e , et est décrit dans ifconfig(8). netstat -ei affiche une table ou une seule  entrée  d'interface  comme  la
       commande ifconfig. Avec le paramètre -a , vous pouvez inclure les interfaces qui ne sont pas configurées (c.a.d qui n'ont pas l'indicateur U=UP armé).

   -M, --masquerade
       Permet  de  voir  les sessions ayant de l'IP-masquerade. Avec le paramètre -e vous pouvez inclure quelques informations concernant les numéros de séquence et
       les deltas causés par des réécritures de données sur des sessions FTP (commande PORT). Le support de l'IP-Masquerade est utilisé pour cacher au  monde  exté‐
       rieur des hôtes appartenant à un réseau (et ayant des adresses) non officiel, tel que décrit dans iptables(8).

   -N, --netlink
       Les  noyaux  récents supportent une communication avec l'utilisateur appelée netlink. Vous pouvez obtenir des messages relatifs à la création, la suppression
       d'interfaces ou de routes à partir de /dev/route (36,0).

OPTIONS
   -v, --verbose
       active le mode verbeux. Affiche quelques informations utiles concernant les familles d'adresses non configurées.

   -n, --numeric
       affiche les adresses en format numérique au lieu d'essayer de déterminer le nom symbolique d'hôte, de port ou d'utilisateur.

   -p, --programs
       affiche le nom et le PID des processus propriétaires de chaque socket décrite. Vous devez être le propriétaire d'un processus pour visualiser les sockets qui
       lui appartiennent ou être l'utilisateur root pour disposer de toutes les informations.

   -A, --af famille
       utilise  une  méthode  différente pour affecter les familles d'adresses. famille est une liste de familles d'adresses séparées par des (',') telles que inet,
       unix, ipx, ax25, netrom et ddp. L'utilisation des options longues suivantes a le même effet --inet, --unix, --ipx, --ax25, --netrom et --ddp.

   -c, --continous
       Demandera à netstat d'afficher la table sélectionnée chaque seconde jusqu'à ce que vous l'interrompiez.

RESULTATS
   Connexions Internet actives (TCP, UDP, RAW)
   Proto
       Le protocole (TCP, UDP, RAW) utilisé par la socket.

   Recv-Q
       Le nombre d'octets non encore lus par le programme utilisateur connecté à cette socket.

   Send-Q
       Le nombre d'octets non encore acquittés par l'hôte distant.

   Local Address (Adresse locale)
       L'adresse locale (nom d'hôte local) et numéro de port de la socket. Sauf si l'option -n est donnée, l'adresse de la prise est traduite en nom d'hôte,  et  le
       numéro de port est traduit en nom de service correspondant.

   Foreign Address (Adresse distante)
       L'adresse  distante  (nom d'hôte distant) et le numéro de port de la prise. Comme pour l'adresse locale et le numéro de port, l'option -n invalide la traduc‐
       tion du nom d'hôte et de service.

   State (Etat)
       L'état de la socket. Puisqu'il n'y a pas d'état dans le mode RAW et généralement pas d'état utilisé en UDP, cette colonne peut se  trouver  vierge.  Normale‐
       ment, on trouvera une des valeur suivante:

       ESTABLISHED
              La socket a une connexion établie.

       SYN_SENT
              La socket attend activement d'établir une connexion.

       SYN_RECV
              Une requête de connexion a été reçue du réseau.

       FIN_WAIT1
              La socket est fermée, et la connexion est en cours de terminaison.

       FIN_WAIT2
              La connexion est fermée, et la socket attend une terminaison du distant.

       TIME_WAIT
              La socket attend le traitement de tous les paquets encore sur le réseau avant d'entreprendre la fermeture.

       CLOSE  La socket n'est pas utilisée.

       CLOSE_WAIT
              Le distant a arrêté, attendant la fermeture de la socket.

       LAST_ACK
              Le distant termine, et la socket est fermée. Attente d'acquittement.

       LISTEN La socket est à l'écoute de connexions entrantes. Ces sockets ne sont affichées que si le paramètre -a,--listening est fourni.

       CLOSING
              Les deux prises sont arrêtées mais toutes les données locales n'ont pas encore été envoyées.

       UNKNOWN
              L'état de la prise est inconnu.

   User (Utilisateur)
       Le nom d'utilisateur ou l'UID du propriétaire de la socket.

   PID/Program name (PID/Nom de Programme)
       Le  PID  et  le  nom du programme (séparés par un slash) propriétaire de la socket. Le paramètre -p active l'affichage de cette colonne. Vous devez avoir les
       droits de root puisque vous devez avoir les droits d'accès aux processus pour visualiser les sockets qui lui correspondent. Ces informations ne sont pas dis‐
       ponibles avec les sockets IPX.

   Timer
       (Ceci doit être rédigé)

   Sockets actives du domaine UNIX
   Proto
       Le protocole (habituellement UNIX) utilisé par la socket.

   RefCnt
       Le nombre de références (i.e. processus attachés via cette socket).

   Flags (indicateurs)
       Les  indicateurs  affichée sont SO_ACCEPTON (affiché ACC), SO_WAITDATA (W) ou SO_NOSPACE (N). SO_ACCECPTON est utilisé pour les sockets non-connectées si les
       processus correspondant sont en attente de demande de connexion. Les autres indicateurs sont d'un intérêt limité.

   Type
       Il y a différents types d'accès aux sockets :

       SOCK_DGRAM
              La prise est utilisée en mode Datagram (sans connexion).

       SOCK_STREAM
              C'est une socket `stream' (connexion).

       SOCK_RAW
              La prise est utilisée en mode `raw'.

       SOCK_RDM
              Celle-ci est utilisée pour les messages délivrée de manière fiable.

       SOCK_SEQPACKET
              C'est une socket en mode paquets séquentiels.

       SOCK_PACKET
              Prise d'accès à l'interface RAW.

       UNKNOWN
              Qui sait ce que l'avenir nous réserve - Juste à remplir ici :-)

   State (Etat)
       Ce champ contient un des mots clés suivants :

       FREE   La socket n'est pas allouée

       LISTENING
              La socket est à l'écoute de demandes de connexions. Ces sockets ne sont affichées que si le paramètre -a,--listening est fourni.

       CONNECTING
              La prise est en cours d'établissement de connexion.

       CONNECTED
              La socket est connectée.

       DISCONNECTING
              La socket est en cours de déconnexion.

       (empty)
              La socket n'est connectée à aucune autre.

       UNKNOWN
              Cet état ne devrait pas apparaître.

   PID/Program name (PID/Nom de programme
       Le PID et le nom du programme propriétaire de la socket. Plus d'informations sont disponibles dans la section Connexions Internet actives ci-dessus.

   Path (chemin)
       Affiche le chemin correspondant à l'attachement des processus à la socket.

   Sockets IPX actives
       (à faire par quelqu'un qui connaît)

   Sockets NET/ROM actives
       (à faire par quelqu'un qui connaît)

   Sockets AX.25 actives
       (à faire par quelqu'un qui connaît)

NOTES
       Depuis la version 2.2 du noyau, netstat -i n'affiche plus les statistiques des interfaces alias. Pour obtenir les compteurs par interface alias,  vous  devez
       définir des règles spécifiques à l'aide de la commande iptables(8).

FICHIERS
       /etc/services -- Le fichier de correspondance des services

       /proc/net/dev -- informations périphériques

       /proc/net/raw -- informations sockets RAW

       /proc/net/tcp -- informations sockets TCP

       /proc/net/udp -- informations sockets UDP

       /proc/net/igmp -- informations multicast IGMP

       /proc/net/unix -- informations sockets domaine UNIX

       /proc/net/ipx -- informations sockets IPX

       /proc/net/ax25 -- informations sockets AX25

       /proc/net/appeltalk -- informations sockets DDP (appeltalk)

       /proc/net/nr -- informations sockets NET/ROM

       /proc/net/route -- informations routage IP du noyau

       /proc/net/ax25_route -- informations routage AX25 du noyau

       /proc/net/ipx_route -- informations routage IPX du noyau

       /proc/net/nr_nodes -- informations routage NET/ROM du noyau

       /proc/net/nr_neigh -- Voisinage NET/ROM noyau

       /proc/net/ip_masquerade -- Connexion avec masquerade noyau

VOIR AUSSI
       route(8), ifconfig(8), iptables(8)

BUGS
       Des informations étranges peuvent apparaitre occasionnellement si une socket change d'état au moment ou elle est visualisée. Ceci est peut probable.
       Le paramètre netstat -i est décrit tel qu'il fonctionnera lorsque le code de la version BETA du paquetage net-tools aura été nettoyé.

AUTEURS
       L'interface  utilisateur de netstat a été développée par Fred Baumgarten <dc6iq@insu1.etec.uni-karlsruhe.de>. Les pages du manuel essentiellement écrites par
       Matt Welsh <mdw@tc.cornell.edu>. Mis à jour par Alan Cox <Alan.Cox@linux.org>.
       La page de manuel et la commande incluse dans le paquetage net-tools a été totallement réécrite par Bernd Eckenfels <ecki@linux.de>.

TRADUCTION
       Jean Michel VANSTEENE (vanstee@worldnet.fr)

net-tools                                                                    2007-12-02                                                                   NETSTAT(8)
