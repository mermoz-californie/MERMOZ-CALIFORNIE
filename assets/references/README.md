# Section Références — Auto-découverte

Le site détecte automatiquement les dossiers présents ici. **Tu n'as rien à éditer dans le code.**

## Comment ça marche

Tu balances un dossier `babolat/`, `nike/`, `yoplaut/`… avec la bonne structure, refresh la page, et il apparaît. Le nom du dossier peut être ce que tu veux.

```
assets/references/
├── nike/
│   ├── texte/
│   │   ├── title.txt          ← titre (chaque ligne = nouvelle ligne dans la carte)
│   │   └── description.txt    ← petit texte gris en dessous
│   ├── image-fond/
│   │   └── background.jpg     ← image qui remplit la zone derrière la carte
│   └── logo/
│       └── logo.svg           ← logo dans le rond (SVG ou PNG)
├── babolat/
│   └── (idem)
└── yoplaut/
    └── (idem)
```

## Workflow

1. **Ajouter une référence** → créer un dossier avec la structure ci-dessus, refresh la page
2. **Renommer une référence** → renommer le dossier, refresh la page
3. **Supprimer une référence** → supprimer le dossier, refresh la page
4. **Mettre à jour image / logo / textes** → remplacer les fichiers, refresh la page

L'ordre d'apparition est **alphabétique** (par nom de dossier).

## Si l'auto-découverte ne marche pas

L'auto-découverte dépend du fait que ton serveur de dev expose le contenu des dossiers (la plupart le font : Python `http.server`, `http-server` npm, etc.). Si ce n'est pas le cas, il y a un fallback automatique sur un fichier `references.json` que tu peux régénérer en lançant :

```bash
./bin/sync-refs.sh
```

Ou en double-cliquant dessus depuis le Finder. Ça liste tous les dossiers présents et les écrit dans `references.json`. À refaire après chaque ajout/renommage si l'auto-découverte échoue.

## Astuces

- Les dossiers commençant par `.` ou `_` sont **ignorés** (utile pour mettre des brouillons : `_old-ref/`)
- Les fichiers `title.txt` et `description.txt` sont chargés à chaque visite — pas besoin de hard reload
- Le logo placeholder gris s'affiche si `logo.svg` est absent
