#!/bin/bash
# Double-clique ce fichier pour ouvrir le site en local.
#
# Il lance un petit serveur sur http://localhost:8742 puis ouvre la
# page dans ton navigateur. Garde la fenêtre du Terminal ouverte tant
# que tu travailles : la fermer arrête le serveur.
#
# Pourquoi un serveur et pas un double-clic sur index2.html : ouverte
# depuis le Finder, la page ne peut pas lire les pixels de ses propres
# images, c'est une règle de sécurité des navigateurs. Les pastilles
# s'afficheraient, mais on ne pourrait pas les attraper.
#
# Le nom commence par un tiret bas : GitHub Pages ignore ces
# fichiers, il ne sera jamais publié.

cd "$(dirname "$0")"
PORT=8742
PAGE="http://localhost:$PORT/index2.html"

# un serveur tourne déjà sur ce port : on ouvre simplement la page
if lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  echo "Le serveur tourne déjà. Ouverture de $PAGE"
  open "$PAGE"
  exit 0
fi

( sleep 1; open "$PAGE" ) &
echo "Serveur lancé. Laisse cette fenêtre ouverte, ferme-la pour l'arrêter."
python3 .claude/serveur-dev.py "$PORT" "$PWD"
