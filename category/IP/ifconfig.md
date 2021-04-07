IFCONFIG(8)                                                                  Manuel de l'administrateur Linux                                                                  IFCONFIG(8)

NOM
       ifconfig - Configurer une interface réseau.

SYNOPSIS
       ifconfig [-v] [-a] [-s] [interface]
       ifconfig [-v] interface [aftype] options | adresse ...

DESCRIPTION
       ifconfig  permet  de  configurer les interfaces réseau présentes dans le noyau. On peut les configurer lors du démarrage quand c'est nécessaire. Ensuite, on l'utilise généralement
       pour le débogage ou pour d'éventuels réglages.

       Si aucun argument n'est donné, ifconfig affiche l'état des interfaces actives. Si seul le paramètre interface est donné, il affiche  seulement  l'état  de  l'interface  correspon‐
       dante ; si seul le paramètre -a est fourni, il affiche l'état de toutes les interfaces, même celles qui sont inactives. Autrement, il permet de configurer une interface.

Familles d'Adresses
       Si  le premier argument après le nom d'interface est reconnu comme le nom d'une famille d'adresses prise en charge, alors cette famille d'adresses est utilisée pour décoder et af‐
       ficher toutes les adresses du protocole. Les familles d'adresses actuellement prises en charge comprennent inet (TCP/IP, par défaut), inet6 (IPv6), ax25 (AMPR Packet  Radio),  ddp
       (Appletalk Phase 2), ipx (Novell IPX) et netrom (AMPR Packet Radio).

OPTIONS
       -a     Afficher toutes les interfaces actuellement disponibles, même celles qui sont inactives.

       -s     Afficher un résumé (comme netstat -i).

       -v     Mode volubile pour certains types d'erreurs.

       interface
              Correspond  au  nom de l'interface de réseau. C'est généralement un nom de pilote suivi d'un chiffre, comme eth0 pour la première interface Ethernet. Si votre noyau accepte
              les alias d'interfaces, vous pouvez les spécifier avec eth0:0 pour le premier alias de eth0. On peut les utiliser pour les affecter à une seconde adresse. Pour supprimer un
              alias d'interface, utilisez ifconfig eth0:0 down. Note : pour chaque groupe (un même noeud donné par une combinaison adresse/masque de réseau), si vous supprimez le premier
              alias (le principal), tous les alias sont supprimés.

       up     Activer l'interface donnée. Cette option est implicite si une adresse est affectée à l'interface.

       down   Désactiver le pilote pour l'interface donnée.

       [-]arp Activer ou désactiver l'utilisation du protocole ARP sur une interface.

       [-]promisc
              Activer ou désactiver le mode promiscuous. S'il est activé, tous les paquets circulant sur le réseau seront reçus par l'interface.

       [-]allmulti
              Activer ou désactiver le mode all-multicast. S'il est activé, l'interface recevra tous les paquets de multidiffusion circulant sur le réseau.

       metric N
              Définir la métrique de l'interface.

       mtu N  Définir l'unité de transfert maximum ou MTU (« Maximum Transfer Unit ») d'une interface.

       dstaddr adresse
              Définir l'adresse IP distante dans le cas d'un lien point-à-point (comme PPP). Cette option est obsolète ; utilisez à la place l'option pointopoint.

       netmask adresse
              Définir le masque de réseau IP pour cette interface. La valeur par défaut correspond au masque de réseau usuel pour les classes A, B ou C (déduite de  l'adresse  IP),  mais
              une autre valeur peut être définie.

       add adresse/long_préfixe
              Ajouter une adresse IPv6 à une interface.

       del adresse/long_préfixe
              Supprimer une adresse IPv6 d'une interface.

       tunnel aa.bb.cc.dd
              Créer un nouveau périphérique SIT (IPv6-dans-IPv4), fonctionnant en mode tunnel jusqu'à la destination donnée.

       irq adresse
              Définir la ligne d'interruption utilisée par un périphérique. Certains périphériques ne sont pas capables de changer dynamiquement d'IRQ.

       io_addr adresse
              Définir l'adresse de début dans l'espace d'entrée-sortie pour un périphérique.

       mem_start adresse
              Définir l'adresse de début de la mémoire partagée utilisée par un périphérique. Peu de périphériques ont besoin de ce paramètre.

       media type
              Définir  le  port physique ou le type de médium utilisé par le périphérique. Tous les périphériques ne peuvent pas changer cette configuration et les types acceptés varient
              de l'un à l'autre. Les valeurs habituelles du type sont 10base2 (Ethernet fin), 10baseT (Ethernet 10Mbps en paire torsadée), AUI (émetteur-récepteur externe), etc.  Le  mé‐
              dium spécial de type auto permet d'indiquer au pilote de détecter automatiquement le médium utilisé. Une fois de plus, tous les pilotes n'acceptent pas cette option.

       [-]broadcast [adresse]
              Si l'adresse est donnée, elle définit l'adresse de diffusion du protocole pour cette interface. Autrement, on arme (ou désarme) l'indicateur IFF_BROADCAST de l'interface.

       [-]pointopoint [adresse]
              Valider le mode point-à-point d'une interface, signifiant qu'il existe un lien direct entre 2 machines, sans que personne d'autre ne puisse être à l'écoute.
              Si l'adresse est également donnée, cela définit l'adresse de protocole de l'autre machine, de la même manière que l'option obsolète dstaddr. Autrement, il arme (ou désarme)
              l'indicateur IFF_POINTOPOINT de l'interface.

       hw classe adresse
              Définir l'adresse matérielle de l'interface, si le pilote du périphérique accepte cette opération. L'option doit être suivie du nom de la classe matérielle et de  l'adresse
              matérielle  en  caractères  ASCII affichables. Les classes matérielles actuellement prises en charge comprennent ether (Ethernet), ax25 (AMPR AX.25), ARCnet et netrom (AMPR
              NET/ROM).

       multicast
              Positionner l'indicateur de multidiffusion sur l'interface. Ce n'est généralement pas nécessaire puisque les pilotes positionnent correctement l'option eux-mêmes.

       adresse
              Correspond à l'adresse IP affectée à cette interface.

       txqueuelen longueur
              Définir la longueur de la file d'attente de transmission du périphérique. Il est utile de la fixer à des valeurs faibles pour les périphériques lents avec  un  temps  d'at‐
              tente important (modems, ISDN), pour empêcher d'être perturbé par de rapides transferts de masse issus des trafics interactifs, comme telnet.

NOTES
       Depuis  la version 2.2 du noyau, il n'y a plus de statistiques d'interface explicites pour les alias d'interfaces. Les statistiques affichées pour la véritable adresse sont parta‐
       gées avec toutes les adresses d'alias du même périphérique. Pour avoir des statistiques par adresse, il faut ajouter des règles de comptabilité  particulières  pour  l'adresse  en
       utilisant la commande ipchains(8) ou iptables(8).

       Depuis net-tools 1.61, ifconfig affiche les compteurs d'octets et ceux lisibles par un utilisateur en unités IEC 60027-2. Ainsi, 1 KiB vaut 2^10 octets. Notez que les nombres sont
       tronqués à la première décimale (ce qui peut être une erreur importante si vous considérez que 0,1 PiB vaut 112.589.990.684.262 octets :)

       Des problèmes d'interruption avec les pilotes de périphériques Ethernet apparaissent avec EAGAIN (SIOCSIIFLAGS : Ressource temporairement indisponible)  il  s'agit  sûrement  d'un
       conflit d'interruptions. Voir http://www.scyld.com/expert/irq-conflict.html pour plus d'informations.

FICHIERS
       /proc/net/socket
       /proc/net/dev
       /proc/net/if_inet6

BOGUES
       Même si les adresses appletalk DDP et IPX peuvent être affichées, elles ne peuvent être modifiées avec cette commande.

VOIR AUSSI
       route(8), netstat(8), arp(8), rarp(8), ipchains(8), iptables(8)
       http://physics.nist.gov/cuu/Units/binary.html - Préfixes pour les multiples binaires.

AUTEURS
       Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
       Alan Cox, <Alan.Cox@linux.org>
       Phil Blundell, <Philip.Blundell@pobox.com>
       Andi Kleen,
       Bernd Eckenfels, <net-tools@lina.inka.de>

TRADUCTION
       Ce  document  est  une  traduction  réalisée  par  Jean  Michel  Vansteene  <vanstee AT worldnet DOT fr> en août 1997, mise à jour par Guillaume Audirac en août 2004 et révisée le
       17 août 2006.

       L'équipe de traduction a fait le maximum pour réaliser une adaptation française de qualité. La version anglaise la plus à jour de ce document est toujours consultable via la  com‐
       mande : « LANG=C man 8 ifconfig ». N'hésitez pas à signaler à l'auteur ou au traducteur, selon le cas, toute erreur dans cette page de manuel.

net-tools                                                                              30 juin 2005                                                                            IFCONFIG(8)
