HPING3(8)                                                                         System Manager's Manual                                                                        HPING3(8)

NOM
       hping3 - envoie des paquets TCP/IP (presque) arbitraires  des systmes rseaux

RESUME
       hping3  [  -hvnqVDzZ012WrfxykQbFSRPAUXYjJBuTG  ]  [ -c count ] [ -i wait ] [ --fast ] [ -I interface ] [ -9 signature ] [ -a host ] [ -t ttl ] [ -N ip id ] [ -H ip protocol ] [ -g
       fragoff ] [ -m mtu ] [ -o tos ] [ -C icmp type ] [ -K icmp code ] [ -s source port ] [ -p[+][+] dest port ] [ -w tcp window ] [ -O tcp offset ] [ -M tcp sequence number ] [ -L tcp
       ack  ] [ -d data size ] [ -E filename ] [ -e signature ] [ --icmp-ipver version ] [ --icmp-iphlen length ] [ --icmp-iplen length ] [ --icmp-ipid id ] [ --icmp-ipproto protocol ] [
       --icmp-cksum checksum ] [ --icmp-ts ] [ --icmp-addr ] [ --tcpexitcode ] [ --tcp-mss ] [ --tcp-timestamp ] [ --tr-stop ] [ --tr-keep-ttl ] [ --tr-no-rtt ] [ --rand-dest ] [ --rand-
       source ] ] [ --beep ] hostname

DESCRIPTION
       hping3  est  un  outil  rseau capable d'envoyer des paquets TCP/IP sur commande et d'afficher les rponses de la cible comme le programme ping le fait avec les rponses ICMP. hping3
       traite la fragmentation, les contenus de paquets et les tailles arbitraires, et peut tre utilis dans le but de transfrer des fichiers encapsuls dans les  protocoles  supports.  En
       utilisant hping3 vous tes capable d'effectuer au moins les tches suivantes :

        - Tester les rgles d'un firewall
        - Scanner des ports de faon avance
        - Tester les performances rseau en utilisant diffrents protocoles, tailles de paquets, TOS (type de service) et fragmentation.
        - Dcouverte de "Path MTU"
        - Transfrer des fichiers mme au travers de rgles de firewall vraiment fascistes.
        - Comme traceroute avec diffrents protocoles.
        - Utilisation comme Firewalk.
        - Dtermination d'OS  distance.
        - Audit de pile TCP/IP.
        - Beaucoup d'autres.

       C'est galement un bon outil didactique pour apprendre TCP/IP. hping3 est dvelopp et maintenu par antirez@invece.org et est sous la version 2 de la licence GPL. Le dveloppement est
       ouvert donc vous pouvez m'envoyer des patches, suggestions et affronts sans inhibition.

SITE DE HPING
       site primaire sur http://www.hping.org. Vous pouvez trouver  la fois la version stable et les instructions pour tlcharger le dernier  code  source  sur  http://www.hping.org/down‐
       load.html

OPTIONS DE BASE
       -h --help
              Montre l'cran d'aide sur la sortie standard, donc vous pouvez rediriger vers less.

       -v --version
              Montre l'information de version et l'API utilise pour accder au niveau donnes (data link layer), linux sock packet ou libpcap.

       -c --count count
              Arrte  aprs  avoir  envoy  (et reu) count paquets rponse. Aprs que le dernier paquet a t envoy hping3 attend COUNTREACHED_TIMEOUT secondes les rponses du systme cible. Vous
              avez la possibilit de rgler COUNTREACHED_TIMEOUT en ditant hping3.h

       -i --interval
              Attend le nombre spcifi de secondes ou de micro secondes entre l'envoie de chaque paquet. --interval X fixe wait
               X secondes, --interval uX fixe wait
               X micro secondes. Le dfaut est d'attendre une seconde entre chaque paquet. En utilisant hping3 pour transfrer des fichiers fixer cette option est trs important  pour  aug‐
              menter le taux de transfert. Mme en utilisant hping3 pour effectuer des scans passifs/avec usurpation d'adresse vous devriez fixer cette option, voir HPING3-HOWTO pour plus
              d'informations.

       --fast Alias pour -i u10000. Hping enverra 10 paquets par seconde.

       --faster
              Alias pour -i u1. Plus rapide que --fast ;) (mais pas aussi rapide que votre ordinateur peut envoyer des paquets  cause de la conception base sur les signaux).

       --flood
              Envoi les paquets aussi vite que possible sans prendre en compte les rponses de retour. Cette mthode est encore plus rapide que l'option -i u0.

       -n --numeric
              Sortie numrique seulement, aucune tentative ne sera faite pour chercher les noms symboliques pour les adresses systme.

       -q --quiet
              Sortie silencieuse. Rien n'est affiche except les lignes de rsume au moment du dmarrage et quand c'est fini.

       -I --interface interface name
              Par dfaut sur les systmes linux et BSD hping3 utilise l'interface de routage par dfaut. Sur d'autres systmes ou quand il n'y a pas d'interface de routage par  dfaut  hping3
              utilise  la  premire  interface non loopback. Quoi qu'il en soit vous avez la possibilit de forcer hping3  utiliser l'interface dont vous avez besoin en utilisant cette op‐
              tion. Note : vous n'avez pas besoin de spcifier le nom complet, par exemple -I et va correspondre  eth0 ethernet0 myet1 et cetera. Si aucune interface ne correspond  hping3
              essayera d'utiliser lo.

       -V --verbose
              Active la sortie verbeuse. Les rponses TCP seront affiches comme suit :

              len=46 ip=192.168.1.1 flags=RA DF seq=0 ttl=255 id=0 win=0 rtt=0.4 ms tos=0 iplen=40 seq=0 ack=1380893504 sum=2010 urp=0

       -D --debug
              Active  le  mode de dbogage, c'est utile quand vous rencontrez quelques problmes avec hping3. Quand le mode de dbogage est activ vous obtiendrez plus d'informations  propos
              de la dtection des interfaces, de l'accs au niveau donnes, du rglage des interfaces, des options d'analyse, de la fragmentation, du protocole HCMP et d'autres choses.

       -z --bind
              Lie CTRL+Z au time to live (TTL) ainsi vous serez capable d'incrmenter/dcrmenter le ttl des paquets sortant en pressant CTRL+Z une ou deux fois.

       -Z --unbind
              D-lie CTRL+Z ainsi vous serez capable d'arrter hping3

       --beep Emet un  bip  pour tous les paquets correspondants reus (mais pas pour les erreurs ICMP).

SELECTION DE PROTOCOLE
       Le protocole par dfaut est TCP, par dfaut hping3 enverra des enttes TCP sur le port 0 du systme cible avec une winsize (ndt : taille de fentre) de 64 sans aucun drapeau TCP activ.
       Souvent  c'est  la meilleure manire de faire un 'ping cach', utile quand la cible est derrire un firewall qui jette ICMP. De plus un paquet TCP null-flag (ndt : sans drapeau) vers
       le port 0 a de bonnes probabilits de ne pas tre journalis.

       -0 --rawip
              Mode RAW IP, dans ce mode hping3 enverra une entte IP avec les donnes ajoutes avec --signature et/ou --file, voir galement --ipproto qui vous autorise  fixer le champ  pro‐
              tocole IP.

       -1 --icmp
              Mode ICMP, par dfaut hping3 enverra un paquet ICMP echo-request, vous pouvez fixer un autre type/code ICMP en utilisant les options --icmptype --icmpcode

       -2 --udp
              Mode UDP, par dfaut hping3 enverra des paquets UDP vers le port 0 du systme cible. Les options rglables des enttes UDP sont les suivantes : --baseport, --destport, --keep.

       -8 --scan
              Mode  scan, l'option attend un argument qui dcrit des groupes de ports scanner. Les groupes de ports sont spars par des virgules : un nombre dcrit seulement un port unique,
              donc 1,2,3 signifie ports 1, 2 et 3. Les intervalles sont spcifis en utilisant une notation dbut-fin, comme 1-1000, qui dit  hping de scanner les ports entre 1 et 1000 (in‐
              clus). Le mot spcial all est un alors pour 0-65535, pendant que le mot spcial known inclut tous les ports lists dans /etc/services.
              Les  groupes  peuvent  tre  combins,  donc  la  commande  suivante  scannera  les  ports entre 1 et 1000 ET le port 8888 ET les ports lists dans /etc/services: hping --scan
              1-1000,8888,known -S target.host.com
              Les groupes peuvent tre nis (soustraits) en utilisant un caractre ! comme prfix, donc la ligne de commande suivante scannera tous les ports  NON  lists  dans  /etc/services
              dans l'intervalle 1-1024 : hping --scan '1-1024,!known' -S target.host.com
              Gardez   l'esprit que pendant que hping apparat beaucoup plus comme un scanneur de ports dans ce mode, la plupart des options sont toujours honores, donc pour effectuer par
              exemple un scan SYN vous avez besoin de spcifier l'option -S, vous pouvez changer la taille de la fentre TCP, le TTL, contrler la fragmentation IP comme habituellement,  et
              ainsi de suite. La seule diffrence relle est que le comportement standard de hping est encapsul dans un algorithme de scan.
              Note  technique  :  Le mode scan utilise une conception base sur deux processus, avec de la mmoire partage pour la synchronisation. L'algorithlme de scan n'est toujours pas
              optimal, mais dj assez rapide.
              Conseil :  la diffrence de la plupart des scanneurs, hping montre quelques informations intressantes  propos des paquets reus, les champs IP ID, TCP win, TTL, et  ainsi  de
              suite, n'oubliez pas de regarder ces informations additionnelles quand vous effectuez un scan! Quelques fois elles montrent des dtails intressants.

       -9 --listen signature
              Mode d'coute de HPING3, en utilisant cette option hping3 attend les paquets qui contiennent signature et exporte de la fin de la signature
               la fin du paquet. Par exemple si hping3 --listen TEST lit un paquet qui contient 234-09sdflkjs45-TESThello_world il affichera hello_world.

OPTIONS IP
       -a --spoof hostname
              Utiliser  cette  option  dans le but de fixer une fausse adresse source, cette option assure que le systme cible n'obtiendra pas votre adresse relle. Quoi qu'il en soit les
              rponses seront envoyes  l'adresse usurpe, ainsi vous ne serez pas capable de les voir. Afin de voir comment  il  est  possible  d'effectuer  des  scans  avec  des  adresses
              usurpes/passifs voir le fichier HPING3-HOWTO.

       --rand-source
              Cette  option  active  le  mode  source alatoire. hping enverra des paquets avec des adresses sources alatoires. Il est intressant d'utiliser cette option pour stresser les
              tables d'tt d'un firewall, et d'autres tables dynamiques bases sur les IP dans les piles TCP/IP et les firewall logiciels.

       --rand-dest
              Cette option active le mode destination alatoire. hping enverra des paquets  des adresses alatoires obtenues en suivant la rgle que vous avez spcifie  comme  systme  cible.
              Vous  avez  besoin  de  spcifier  une adresse IP numrique en tant que systme cible comme 10.0.0.x. Toutes les occurrences de x seront remplaces avec un nombre alatoire dans
              l'intervalle 0-255. Ainsi pour obtenir des adresses IP internet dans l'espace IPv4 complet utilisez quelque chose comme hping x.x.x.x --rand-dest. Si vous n'tes pas srs  du
              genre d'adresses que votre rgle gnre essayez d'utiliser l'option --debug pour afficher chaque nouvelle adresse destination gnre.
              Attention : quand cette option est active hping ne peut pas dtecter la bonne interface de sortie pour les paquets, ainsi vous devez utiliser l'option --interface pour slec‐
              tionner l'interface de sortie.

       -t --ttl time to live
              En utilisant cette option vous pouvez fixer le TTL (time to live) des paquets sortant, il est vraisemblable que vous utiliserez ceci avec les options --traceroute ou --bind
              Dans le doute essayez `hping3 some.host.com -t 1 --traceroute'.

       -N --id
              Fixe  le  champ  ip->id  . La valeur du champ id par dfaut est alatoire mais si la fragmentation est active et que le champ id n'est pas spcifi alors il sera gal getpid() &
              0xFF, mettre en oeuvre une meilleure solution est dans la liste TODO (ndt :  faire).

       -H --ipproto
              Fixe le protocole IP dans le mode RAW IP.

       -W --winid
              Le champ id des systmes Windows* avant Win2k ont un byte ordering (ndt : ordre des octets) diffrent, si cette option est active hping3 affichera proprement  les  champs  id
              des rponses de ces Windows.

       -r --rel
              Affiche  les incrments du champ id au lieu du champ id. Voir le fichier HPING3-HOWTO pour plus d'informations. Les incrments ne sont pas calculs comme id[N]-id[N-1] mais en
              utilisant une compensation de pertes de paquets. Voir le fichier relid.c pour plus d'informations.

       -f --frag
              Dcoupe les paquets en fragments, ceci peut tre utile afin de tester les performances de la fragmentation des piles IP et de tester si certains filtres de  paquets  sont  si
              faibles  qu'ils  peuvent  tre passs en utilisant de petits fragments (anachronique). Par dfaut le 'mtu virtuel' (ndt : taille des fragments) est de 16 octets. Voir galement
              l'option --mtu.

       -x --morefrag
              Fixe le drapeau IP "more fragments" (ndt : d'autres fragments), utilisez cette option si vous voulez que le systme cible envoie un paquet ICMP time-exceeded during reassem‐
              bly (ndt : dlai dpass durant le r-assemblage).

       -y --dontfrag
              Fixe  le  drapeau  IP  "don't  fragment"  (ndt  : ne pas fragmenter), ceci peut tre utilis pour effectuer un MTU path discovery (ndt : dcouverte de la valeur minimale de la
              "taille maximale des paquets" sur le chemin).

       -g --fragoff fragment offset value
              Fixe l'offset du fragment.

       -m --mtu mtu value
              Fixe un 'mtu virtuel' diffrent de 16 quand la fragmentation est active. Si la taille des paquets est suprieure au 'mtu virtuel' alors la fragmentation  est  automatiquement
              active.

       -o --tos hex_tos
              Fixe Type Of Service (TOS) (ndt : le type de service), pour plus d'informations essayez --tos help.

       -G --rroute
              Enregistrer  la route. Inclut l'option RECORD_ROUTE dans chaque paquet envoy et affiche la route prsente dans le tampon du paquet retourn. Notez que l'entte IP n'est suffi‐
              samment large que pour neuf routes. Beaucoup de systmes ignorent ou suppriment cette option. Notez galement qu'en utilisant hping vous tes capable d'utiliser  l'enregistre‐
              ment  de  la route mme si le systme cible filtre ICMP. Enregistrer la route est une option IP, non pas une option ICMP, ainsi vous pouvez utiliser l'option d'enregistrement
              de la route mme dans les modes TCP et UDP.

OPTIONS ICMP
       -C --icmptype type
              Fixe le type ICMP, le dfaut est ICMP echo request.

       -K --icmpcode code
              Fixe le code ICMP, le dfaut est 0 (implique --icmp).

       --icmp-ipver
              Fixe la version IP de l'entte IP contenue dans les donnes ICMP, le dfaut est 4.

       --icmp-iphlen
              Fixe la longueur de l'entte IP contenue dans les donnes ICMP, le dfaut est 5 (5 mots de 32 bits).

       --icmp-iplen
              Fixe la longueur du paquet IP de l'entte IP contenue dans les donnes ICMP, le dfaut est la taille relle.

       --icmp-ipid
              Fixe le champ IP id de l'entte IP contenue dans les donnes ICMP, le dfaut est alatoire.

       --icmp-ipproto
              Fixe le protocole IP de l'entte IP contenue dans les donnes ICMP, le dfaut est TCP.

       --icmp-cksum
              Fixe la somme de contrle ICMP, le dfaut est la somme de contrle valide.

       --icmp-ts
              Alias pour --icmptype 13 (pour envoyer des requtes ICMP timestamp).

       --icmp-addr
              Alias pour --icmptype 17 (pour envoyer des requtes ICMP masque rseau).

OPTIONS TCP/UDP
       -s --baseport source port
              hping3 utilise le port source afin de deviner les numros de squence des rponses. Il commence avec un numro de port source de base, et incrmente ce numro pour chaque  paquet
              envoy.  Quand  un paquet est reu alors le numro de squence peut tre calcul comme port.source.rponse - port.source.de.base. Le port source de base par dfaut est alatoire, en
              utilisant cette option vous tes capable de fixer un numro diffrent. Si vous avez besoin que le port source ne soit pas incrment pour chaque paquet envoy  utilisez  l'option
              -k --keep.

       -p --destport [+][+]dest port
              Fixe  le  port  destination, le dfaut est 0. Si le caractre '+' prcde le numro de port destination (i.e. +1024) le port destination sera incrment pour chaque paquet reu. Si
              deux '+' prcdent le numro de port destination (i.e. ++1024), le port destination sera incrment pour chaque paquet envoy. Par dfaut le port destination peut tre  modifi  in‐
              teractivement en utilisant CTRL+z.

       --keep Garde constant le port source, voir --baseport pour plus d'informations.

       -w --win
              Fixe la taille de la fentre TCP. Le dfaut est 64.

       -O --tcpoff
              Fixe un faux offset (ndt : dcalage) des donnes TCP. L'offset normal des donnes est tcphdrlen / 4.

       -M --tcpseq
              Fixe le numro de squence TCP.

       -L --tcpack
              Fixe le drapeau TCP ack.

       -Q --seqnum
              Cette  option  peut  tre  utilise  afin  de collecter les numros de squence gnrs par le systme cible. Ceci peut tre utile quand vous avez besoin d'analyser si les numros de
              squence TCP sont prvisibles. Exemple de sortie :

              #hping3 win98 --seqnum -p 139 -S -i u1 -I eth0
              HPING uaz (eth0 192.168.4.41): S set, 40 headers + 0 data bytes
              2361294848 +2361294848
              2411626496 +50331648
              2545844224 +134217728
              2713616384 +167772160
              2881388544 +167772160
              3049160704 +167772160
              3216932864 +167772160
              3384705024 +167772160
              3552477184 +167772160
              3720249344 +167772160
              3888021504 +167772160
              4055793664 +167772160
              4223565824 +167772160

              La premire colonne reporte les numros de squence, la seconde la diffrence entre le numro de squence courant et le dernier. Comme vous pouvez le voir les numros  de  squence
              du systme cible sont prvisibles.

       -b --badcksum
              Envoie des paquets avec une mauvaise somme de contrle UDP/TCP

       --tcp-mss
              Active l'option TCP MSS et la fixe avec la valeur donne.

       --tcp-timestamp
              Active l'option TCP timestamp, et essaye de deviner la frquence de mise jour du timestamp et l'uptime du systme distant.

       -F --fin
              Fixe le drapeau TCP FIN.

       -S --syn
              Fixe le drapeau TCP SYN.

       -R --rst
              Fixe le drapeau TCP RST.

       -P --push
              Fixe le drapeau TCP PUSH.

       -A --ack
              Fixe le drapeau TCP ACK.

       -U --urg
              Fixe le drapeau TCP URG.

       -X --xmas
              Fixe le drapeau TCP Xmas.

       -Y --ymas
              Fixe le drapeau TCP Ymas.

OPTIONS COMMUNES
       -d --data data size
              Fixe  la  taille du corps du paquet. Attention, en utilisant --data 40 hping3 ne gnrera pas des paquets de 0 octet mais de entte_de_protocole+40 octets. hping3 affichera en
              information la taille des paquets comme premire ligne de sortie, comme ceci : HPING www.yahoo.com (ppp0 204.71.200.67): NO FLAGS are set, 40 headers + 40 data bytes

       -E --file filename
              Utilise le contenu du  fichier filename pour remplir les donnes du paquet.

       -e --sign signature
              Remplit d'abord longueur de signature octets de donnes avec signature. Si longueur de signature est plus grand que la taille des donnes alors un message d'erreur  sera  af‐
              fich.  Si  vous ne spcifiez pas la taille des donnes hping utilisera la taille de la signature comme taille des donnes. Cette option peut tre utilise sans risque avec l'op‐
              tion --file filename, l'espace de donnes restant sera rempli en utilisant le fichier filename.

       -j --dump
              Affiche les paquets en hexadcimal.

       -J --print
              Affiche les caractres imprimables des paquets reus.

       -B --safe
              Active le protocole safe, en utilisant cette option les paquets perdus dans un transfert de fichier seront renvoys. Par exemple afin d'envoyer le fichier /etc/passwd depuis
              le systme A au systme B vous pouvez utiliser ce qui suit :
              [host_a]
              # hping3 host_b --udp -p 53 -d 100 --sign signature --safe --file /etc/passwd
              [host_b]
              # hping3 host_a --listen signature --safe --icmp

       -u --end
              Si  vous  utilisez  l'option  --file filename, cela vous dit quand la fin du fichier a t atteinte. D'ailleurs cela prvient que l'autre ct accepte plus de paquets. S'il vous
              plat, pour plus d'informations voir le fichier HPING3-HOWTO.

       -T --traceroute
              Mode traceroute. En utilisant cette option hping3 incrmentera le ttl pour chaque paquet ICMP time to live 0 during transit reu. Essayez hping3 host --traceroute. Cette  op‐
              tion  implique  --bind  et  --ttl  1. Vous pouvez l'emporter sur le ttl 1 en utilisant l'option --ttl. Depuis 2.0.0 stable il affiche les informations de RTT. --tr-keep-ttl
              garde le ttl fixe en mode traceroute, ainsi vous pouvez contrler simplement un noeud sur la route. Par exemple, pour contrler comment le 5me noeud change ou comment son RTT
              change vous pouvez essayer hping3 host --traceroute --ttl 5 --tr-keep-ttl.

       --tr-stop
              Si cette option est spcifie hping quittera ds que le premier paquet qui n'est pas un ICMP time exceeded est reu. Ceci mule mieux le comportement de traceroute.

       --tr-no-rtt
              Ne montre pas l'information RTT en mode traceroute. L'information du RTT des ICMP time exceeded n'est mme pas calcule si cette option est positionne.

       --tcpexitcode
              Quitte avec le champ tcp->th_flag du dernier paquet reu comme code de retour. Utile pour les scripts qui ont besoin, par exemple, de savoir si le port 999 de quelque systme
              rpond avec SYN/ACK ou avec RST en rponse  un SYN, i.e. le service est lanc ou arrt.

FORMAT DE SORTIE TCP
       Le format standard de sortie TCP est le suivant :

       len=46 ip=192.168.1.1 flags=RA DF seq=0 ttl=255 id=0 win=0 rtt=0.4 ms

       len est la taille, en octets, des donnes captures dans la couche liaison de donnes en excluant la taille de l'entte de liaison de donnes. Ceci peut ne pas correspondre  la  taille
       du datagramme IP  cause du rembourrage bas niveau de la couche liaison de donnes.

       ip est l'adresse ip source.

       flags sont les drapeaux TCP, R pour RESET, S pour SYN, A pour ACK, F pour FIN, P pour PUSH, U pour URGENT, X pour 0x40 non standard, Y pour 0x80 non standard.

       Si la rponse contient DF l'entte IP possde le bit don't fragment (ndt : ne pas fragmenter) positionn.

       seq est le numro de squence du paquet, obtenu en utilisant le port source pour les paquets TCP/UDP, le champ squence pour les paquets ICMP.

       id est le champ IP ID.

       win est la taille de la fentre TCP

       rtt est le "round trip time" (ndt : temps aller-retour) en millisecondes.

       Si vous excutez hping en utilisant l'option -V de la ligne de commande il affichera des informations supplmentaires propos du paquet, par exemple :

       len=46 ip=192.168.1.1 flags=RA DF seq=0 ttl=255 id=0 win=0 rtt=0.4 ms tos=0 iplen=40 seq=0 ack=1223672061 sum=e61d urp=0

       tos est le champ type de service de l'entte IP.

       iplen est le champ IP longueur totale.

       seq et ack sont les numros de squence et d'acquittement sur 32 bits dans l'entte TCP.

       sum est la valeur de la somme de contrle de l'entte TCP.

       urp est la valeur du pointeur urgent TCP.

FORMAT DE SORTIE UDP
       Le format standard de sortie est :

       len=46 ip=192.168.1.1 seq=0 ttl=64 id=0 rtt=6.0 ms

       La signification des champs est la mme que celle de la sortie TCP pour les champs de mme nom.

FORMAT DE SORTIE ICMP
       Un exemple de sortie ICMP est :

       ICMP Port Unreachable from ip=192.168.1.1 name=nano.marmoc.net

       Il  est  trs facile  comprendre. Il commence avec la chane "ICMP" suivie par la description de l'erreur ICMP, dans l'exemple Port Unreachable (ndt : port non accessible). Le champ
       ip est l'adresse IP source du datagramme IP contenant l'erreur ICMP, le champ name est simplement l'adresse numrique rsolue en un nom (une requte dns PTR) ou UNKNOWN si la  rsolu‐
       tion a chou.

       Le format ICMP de Time exceeded during ou de reassembly est un peu diffrent :

       TTL 0 during transit from ip=192.168.1.1 name=nano.marmoc.net

       TTL 0 during reassembly from ip=192.70.106.25 name=UNKNOWN

       La seule diffrence est la description de l'erreur, elle commence avec TTL 0.

AUTEUR
       Salvatore Sanfilippo <antirez@invece.org>, avec l'aide des personnes mentionnes dans le fichier AUTHORS et sur http://www.hping.org/authors.html

BOGUES
       Mme en utilisant les options --end et --safe pour transfrer des fichiers, le paquet final sera rembourr avec des octets 0x00.

       Les  donnes  sont lues sans tenir compte de l'alignement, mais l'alignement est impos dans les structures de donnes. Ceci ne sera pas un problme sous i386 mais, alors que normale‐
       ment les enttes TCP/IP sont naturellement alignes, cela peut crer des problmes avec divers processeurs et des paquets mal-forms si il y a des accs non aligns quelque part dans  le
       code (aucun avec un peu de chance).

       Sur  Solaris hping ne fonctionne pas sur l'interface loopback. Ceci semble tre un problme solaris, comme expos dans la liste de diffusion tcpdump-workers, ainsi la libpcap ne peut
       rien faire pour la supporter correctement.

VOIR AUSSI
       ping(8), traceroute(8), ifconfig(8), nmap(1)

TRADUCTEUR
       Denis Ducamp <Denis.Ducamp@groar.org>

                                                                                        2001 Aug 14                                                                              HPING3(8)
