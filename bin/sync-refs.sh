#!/bin/bash
# Génère assets/references/references.json à partir des dossiers présents.
# À lancer si l'auto-découverte par le serveur ne fonctionne pas.
#
# Usage : ./bin/sync-refs.sh
#         (ou double-clic depuis le Finder Mac)

set -e
cd "$(dirname "$0")/.." || exit 1

DIR="assets/references"
OUT="$DIR/references.json"

if [ ! -d "$DIR" ]; then
  echo "❌ Dossier $DIR introuvable"
  exit 1
fi

# Liste alphabétique des sous-dossiers (hors fichiers cachés)
folders=()
for d in "$DIR"/*/; do
  [ -d "$d" ] || continue
  name=$(basename "$d")
  [[ "$name" == .* ]] && continue
  [[ "$name" == _* ]] && continue
  folders+=("$name")
done

# Écrit le JSON
{
  echo "["
  count=${#folders[@]}
  for i in "${!folders[@]}"; do
    if [ "$i" -lt $((count - 1)) ]; then
      echo "  \"${folders[$i]}\","
    else
      echo "  \"${folders[$i]}\""
    fi
  done
  echo "]"
} > "$OUT"

echo "✓ $OUT mis à jour avec ${#folders[@]} référence(s):"
printf '  - %s\n' "${folders[@]}"
