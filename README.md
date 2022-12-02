# Picolo SIDA

Application pour s'amuser et s'éduquer ! Répondez à des questions intimes ou sur les MSTs pour faire boire vos amis !

Cette application a été réalisée durant la Nuit de l'Info 2022.

![logo nuit de l'info](https://www.nuitdelinfo.com/materiel_communication/2022/visuelSVG/N2I2022-couleurs.svg)

[L'alcool est dangereux pour la santé, à consommer avec modération.](https://solidarites-sante.gouv.fr/prevention-en-sante/addictions/article/l-addiction-a-l-alcool)

## Principe

Nous avons essayé de faire un jeu visant un public de jeunes adultes. Il s'agit d'un jeu à boire constitué de différentes questions ou de défis auxquels il faut répondre.

Nous avons décidé de faire un jeu dans un but de s'amuser en soirée. Les questions autour du sujet du SIDA sont minoritaires, pour garder un esprit ludique tout en évitant d'être trop lourd ou moralisateur sur la question. Chaque carte avec une question de ce genre a un lien vers un site pour donner plus d'informations sur le sujet.

Vous pouvez essayer le jeu en ligne sur [nuit.semapy.xyz]("https://nuit.semapy.xyz").

## Fonctionnalités

 - ajout et retrait de joueurs
 - différents type de questions:
    - à choix
    - response unique
    - défi
 - liens vers les informations à propos du SIDA sur les questions correspondantes
 - 30 questions / défis
    - 20 "classiques"
    - 10 sensibilisations

## Lancement

### Docker

```
docker compose up
```

Rendez-vous sur [localhost:8080](localhost:8080).

### Flutter

```
flutter run -d web-server
```
