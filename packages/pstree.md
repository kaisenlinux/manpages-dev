PSTREE(1)                                                                          Commandes de l'utilisateur                                                                         PSTREE(1)

NOM
       pstree - afficher un arbre des processus

SYNOPSIS
       pstree [-a, --arguments] [-c, --compact-not] [-C, --color attr] [-g, --show-pgids] [-h, --highlight-all, -H pid, --highlight-pid pid] [-l, --long] [-n, --numeric-sort]
       [-N, --ns-sort ns] [-p, --show-pids] [-s, --show-parents] [-S, --ns-changes] [-t, --thread-names] [-T, --hide-threads] [-u, --uid-changes] [-Z, --security-context] [-A, --as‐
       cii, -G, --vt100, -U, --unicode] [pid, user]
       pstree -V, --version

DESCRIPTION
       pstree montre les processus en cours d'exécution sous forme d'arbre. L'arbre est ancré soit au pid ou soit à init si pid est omis. Si un nom d'utilisateur est spécifié, tous les arbres
       de processus partant d'un processus de cet utilisateur sont montrés.

       pstree fusionne visuellement les branches identiques en les mettant entre crochets et en les préfixant avec le compteur de répétitions, par exemple,

           init-+-getty
                |-getty
                |-getty
                `-getty

       devient

           init---4*[getty]

       Les threads enfants d'un processus sont trouvés sous le processus parent et sont montrés avec le nom du processus entre accolades, par exemple,

           icecast2---13*[{icecast2}]

       Si pstree est appelé en tant que pstree.x11, alors, il demande à l'utilisateur d'appuyer sur « retour » à la fin de la ligne et ne retournera pas tant que  cela  n'aura  pas  eu  lieu.
       C'est utile quand pstree est exécuté dans un xterminal.

       Certains  noyaux ou paramètres de montage tels que l'option hidepid de procfs cacheront les informations de certains processus. Dans ces cas, pstree essayera de construire l'arbre sans
       ces informations. Les noms de processus seront remplacés par des points d'interrogation.

OPTIONS
       -a     Montrer les arguments de la ligne de commande. Si la ligne de commande du processus est placée dans le fichier d'échange, ce processus est affiché entre parenthèses.  -a  désac‐
              tive implicitement le compactage pour les processus mais pas pour les threads.

       -A     Utiliser des caractères ASCII pour dessiner l'arbre.

       -c     Désactiver le compactage de sous-arbres identiques. Par défaut, les sous-arbres sont compactés dès que possible.

       -C     Color the process name by given attribute. Currently pstree only accepts the value age which colors by process age. Processes newer than 60 seconds are green, newer than an hour
              yellow and the remaining red.

       -g     Montrer les PGID. Les ID de groupes de processus sont montrés sous forme de nombres décimaux entre parenthèses après le nom du processus. -g désactive implicitement  le  compac‐
              tage. Si les PID et les PGID sont affichés, alors, les PID sont affichés en premier.

       -G     Utiliser les caractères de dessin de lignes du VT100.

       -h     Mettre  en  évidence le processus courant et ses ancêtres. Cette option ne fait rien si le terminal ne supporte pas la mise en évidence ou si ni le processus courant ni aucun de
              ses ancêtres est affiché.

       -H     Comme -h mais met en évidence le processus spécifié. Contrairement à -h, pstree échoue si la mise en évidence n'est pas disponible quand -H est utilisé.

       -l     Afficher les lignes longues. Par défaut, les lignes sont tronquées à la largeur définie par la variable d'environnement COLUMNS ou la largeur de l'affichage. Si  aucune  de  ces
              méthodes fonctionne, 132 colonnes sont utilisées par défaut.

       -n     Trier les processus avec le même parent par PID au lieu du nom. (Tri numérique.)

       -N     Montrer les arbres individuels pour chaque espace de noms du type spécifié. Les types disponibles sont: ipc, mnt, net, pid, time, user, uts. Les utilisateurs réguliers n'ont pas
              accès aux informations des processus des autres utilisateurs, donc, la sortie sera limitée.

       -p     Montrer les PID. Les PID sont montrés sous forme de nombre décimaux entre parenthèses après le nom du processus. -p désactive implicitement le compactage.

       -s     Montrer les processus parents du processus spécifié.

       -S     Montrer les transitions d'espaces de noms. Comme -N, la sortie est limitée quand la commande est exécutée par un utilisateur régulier.

       -t     Montrer les noms complets des threads si disponibles.

       -T     Cacher les threads et montrer uniquement les processus.

       -u     Montrer les transitions de uid. Quand le uid d'un processus diffère du uid de son parent, le nouvel uid est montré entre parenthèses après le nom du processus.

       -U     Utiliser les caractères de dessin de lignes de UTF-8 (Unicode). Sous Linux 1.1-54 et suivants, la console entre en mode UTF-8 avec echo -e  ' 33%8'  et  en  sort  avec  echo  -e
              ' 33%@'.

       -V     Afficher les informations de version.

       -Z     Show the current security attributes of the process. For SELinux systems this will be the security context.

FICHIERS
       /proc  emplacement du système de fichiers proc

BOGUES
       Certains jeux de caractères peuvent être incompatibles avec les caractères VT100.

VOIR AUSSI
       ps(1), top(1), proc(5).

psmisc                                                                                     2021-01-05                                                                                 PSTREE(1)
