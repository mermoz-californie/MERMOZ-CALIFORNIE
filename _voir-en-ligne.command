#!/bin/bash
# Double-clique ce fichier pour voir la DERNIÈRE version en ligne.
#
# Safari garde les pages en mémoire : juste après une mise en ligne,
# il peut montrer l'ancienne. Ce raccourci ajoute à l'adresse un
# numéro toujours nouveau (l'heure exacte) : pour Safari c'est une
# page qu'il n'a jamais vue, il va donc chercher la dernière.
#
# Le nom commence par un tiret bas : GitHub Pages ignore ces
# fichiers, il ne sera jamais publié.

open -a Safari "https://mermoz-californie.com/index2.html?v=$(date +%s)"
