ARP(8)                                                              Linux Administrator's Manual                                                              ARP(8)

NOM
       arp - manipule la table ARP du système

SYNOPSIS
       arp [-vn] [-H type] [-i if] -a [nom_hôte]

       arp [-v] [-i if] -d nom_hôte [pub]

       arp [-v] [-H type] [-i if] -s nom_hôte hw_addr [temp]

       arp [-v] [-H type] [-i if] -s nom_hôte hw_addr [netmask nm] pub

       arp [-v] [-H type] [-i if] -Ds nom_hôte ifa [netmask nm] pub

       arp [-vnD] [-H type] [-i if] -f nom_fichier

DESCRIPTION
       Arp  manipule  la  table ARP du noyau de différentes façons. Les options principales permettent d'effacer une correspondance d'adresses   et d'en définir une
       manuellement. Pour les besoins de débogage, le programme arp permet aussi d'effectuer un dump complet de la table ARP.

OPTIONS
       -v, --verbose
              Dit à l'utilisateur ce qui se passe en étant verbeux.

       -n, --numeric
              Affiche les adresses numériques au lieu d'essayer de déterminer les nom d'hôtes symboliques.

       -H type, --hw-type type
              En positionnant ou lisant les entrées ARP, ce paramètre optionnel indique à arp les classes d'entrées qu'il doit contrôler. La valeur par défaut de ce
              paramètre  est  ether  (i.e.  code de matériel 0x01 pour IEEE 802.3 10Mbps Ethernet . D'autres valeurs doivent correspondre à des technologies réseaux
              telles que ARCnet (arcnet) , PROnet (pronet) , AX.25 (ax25) and NET/ROM (netrom).

       -a [nom_d_hôte], --display [nom_d_hôte]
              Affiche les entrées concernant l'hôte spécifié. Si le paramètre nom_d_hôte n'est pas utilisé, toutes les entrées seront affichées.

       -d nom_d_hôte, --delete nom_d_hôte
              Enlève une entrée pour l'hôte spécifié. Ceci peut être utilisé si l'hôte concerné ne fonctionne plus, par exemple.

       -D, --use-device
              Utilise l'adresse matérielle de l'interface ifa

       -i If, --device If
              Sélectionne une interface. Lors du dump du cache ARP, seules les entrées correspondant à l'interface spécifiée seront affichées. Lorsque l'on  définit
              une  entrée permanente ou une entrée temp , cette interface lui sera associée; si cette option n'est pas utilisée, le noyau fera des tentatives de ré‐
              solution selon la table de routage. Pour les entrées pub l'interface spécifiée est celle pour laquelle les requêtes ARP auront trouvé une réponse.
              NOTE: Ceci est différent de l'interface vers laquelle les datagrammes IP seront routés.

       -s nom_d_hôte hw_addr, --set hostname hw_addr
              Crée manuellement une correspondance d'adresses ARP pour l'hôte nom_d_hôte avec l'adresse matérielle positionnée à hw_addr. Le format de l'adresse ma‐
              térielle  est  dépendant  de  la classe du matériel, mais pour la plupart on peut considérer que la présentation classique peut être utilisée. Pour la
              classe Ethernet, c'est 6 octets en hexadécimal, séparés par des double-points. Pour ajouter des entrées proxy-arp (Ce sont  celles  avec  l'indicateur
              publish  positionné) un masque réseau ( netmask ) peut être spécifié au proxy-arp pour le sous-réseau entier. Ceci n'est pas très recommandé, mais est
              supporté par les anciens noyaux, car c'est utile dans certains cas. Si l'indicateur temp n'est pas fourni, les entrées ARP seront permanentes.
              NOTE: A partir du noyau 2.2.0 il n'est plus possible de définir des entrées ARP pour un sous réseau entier.

       -f nom_de_fichier, --file nom_de_fichier
              Similaire à l'option -s , mais cette fois les informations d'adresses sont prises dans le fichier nom_de_fichier. Ceci peut être utilisé  si  les  en‐
              trées ARP à configurer sont nombreuses. Le nom du fichier de données est très souvent nommé /etc/ethers , mais ce n'est pas officiel.

              Le  format du fichier est simple; Il contient seulement des lignes de texte ASCII avec sur chaque ligne un nom d'hôte et une adresse matérielle, sépa‐
              rés par des espaces. Les indicateurs pub, temp et netmask peuvent également être utilisés.

       A tous les endroits où un nom d'hôte est attendu, on peut aussi entrer une addresse IP en notation décimale pointée.

       Chaque entrée complète se trouvant dans le cache ARP est marquée de l'indicateur C. Les entrées permanentes sont marquées de l'indicateur M  et  les  entrées
       'pub' ont l'indicateur P

FICHIERS
       /proc/net/arp,
       /etc/networks
       /etc/hosts
       /etc/ethers

VOIR AUSSI
       rarp(8), route(8), ifconfig(8), netstat(8)

AUTEUR
       Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org> avec les améliorations apportées par le mainteneur des net-tools Bernd Eckenfels <net-tools@lina.inka.de>.

TRADUCTION
       Jean Michel VANSTEENE (vanstee@worldnet.fr)

net-tools                                                                    5 Jan 1999                                                                       ARP(8)
