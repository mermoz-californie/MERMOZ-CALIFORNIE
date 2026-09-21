"""Serveur de développement local du site.

Identique à « python3 -m http.server », avec une seule différence :
chaque réponse porte l'en-tête Cache-Control: no-cache.

Sans cet en-tête, le serveur de base ne donne aucune consigne, et le
navigateur décide seul de réutiliser ses copies. Safari le fait
volontiers : une page ou une pastille réexportée sous le même nom
restait affichée dans son ancienne version, même après un
rechargement normal.

no-cache n'interdit pas le cache, il oblige à le revalider : pour un
fichier inchangé, le serveur répond « 304 inchangé » et rien n'est
retéléchargé. Le développement reste donc aussi rapide.

Ce fichier est dans .claude/ : GitHub Pages ne publie pas les
dossiers qui commencent par un point, il ne sera donc jamais en
ligne.

Usage : python3 serveur-dev.py <port> <dossier>
"""
import functools
import http.server
import sys


class SansCache(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-cache")
        super().end_headers()


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8742
    dossier = sys.argv[2] if len(sys.argv) > 2 else "."
    gestionnaire = functools.partial(SansCache, directory=dossier)
    with http.server.ThreadingHTTPServer(("", port), gestionnaire) as serveur:
        print(f"Serveur sans cache sur http://localhost:{port}/ ({dossier})")
        serveur.serve_forever()
