# Documentation Chronicle Of The Sacred Sword

## Cas d'utilisation de l'application

Pour définir l'architecture de notre application, nous avons tout d'abord défini un cas d'utilisation typique utilisant toutes les fonctionnalités de l'application.
Il s'agit de l'utilisation du jeux, de la création du compte, jusqu'à la sauvegarde et la fermeture du jeu :

### Utilisation typique 

Un utilisateur arrive sur le site, il se créer un compte.

- `POST /user` (identifiant, mot de passe) dans un service `User`.

Il se connecte.

- `POST /auth` (identifiant, mot de passe) dans un service `Authentification`

Il créer un héros.

- `POST /hero` (idUser, nom héros, type héros) dans un service `Heros`
- `POST /save` (idhero, idEcran, idCase) dans un service `Sauvegarde`

Il récupère sa liste de héros.

- `GET /hero/:idUser` dans le service `Heros`

Il choisit son héros (sauvegarde).

- `GET /save/:idhero` dans le service `Sauvegarde`

Il arrive sur la carte.

- `GET /inventory/hero/:idhero` pour récupérer l'inventaire du héros depuis un service `Inventaire`
- `GET /map/:idEcran` afin de charger la carte depuis un service `Map`
- `GET /map/mob` retourne les mobs pouvant apparaître sur cette écran.

Il se déplace.

- Que du front

Un monstre apparaît.

- `GET /mob/:idMob` récupère un ennemi depuis le service `Mob`

Un combat se lance.

- que du front

Il gagne le combat.

- front

Il gagne de l'expérience, de l'or et une potion.

On envoi à un Broker les actions à réaliser dans une Queue :

- `POST /inventaire` (id objet, id hero, amount) ajoute un objet à l'inventaire du héro dans le service `Inventaire`.
- `PUT /hero` pour mettre à jour les informations du héros
- `PUT /save` pour mettre à jour la position du hero dans la sauvegarde.

Ajout d'un service `Combat` qui enverra des messages au broker.

Il utilise la potion.

- `DELETE /inventaire?user=x&object=y` supprime l'objet de l'inventaire.
on pourrai aussi simplement mettre à jour avec un `PUT` si le joueur possède l'objet en plusieurs exemplaires.

Il change d'écran.

- `GET /map/:id` pour charger le prochain écran.
-  `GET /map/mob` retourne les mobs pouvant apparaître sur cette écran.

Il sauvegarde sa partie avant de quitter la page.

- `PUT /save` pour mettre à jour la position du hero dans la sauvegarde.

Un utilisateur arrive sur le site, il se créer un compte.

- `POST /user` (identifiant, mot de passe) dans un service `User`.

Il se connecte.

- `POST /auth` (identifiant, mot de passe) dans un service `Authentification`

Il créer un héros.

- `POST /hero` (idUser, nom héros, type héros) dans un service `Heros`
- `POST /save` (idhero, idEcran, idCase) dans un service `Sauvegarde`

Il récupère sa liste de héros.

- `GET /hero/:idUser` dans le service `Heros`

Il choisit son héros (sauvegarde).

- `GET /save/:idhero` dans le service `Sauvegarde`

Il arrive sur la carte.

- `GET /inventory/hero/:idhero` pour récupérer l'inventaire du héros depuis un service `Inventaire`
- `GET /map/:idEcran` afin de charger la carte depuis un service `Map`
- `GET /map/mob` retourne les mobs pouvant apparaître sur cette écran.

Il se déplace.

- Que du front

Un monstre apparaît.

- `GET /mob/:idMob` récupère un ennemi depuis le service `Mob`

Un combat se lance.

- que du front

Il gagne le combat.

- front

Il gagne de l'expérience, de l'or et une potion.

On envoi à un Broker les actions à réaliser dans une Queue :

- `POST /inventaire` (id objet, id hero, amount) ajoute un objet à l'inventaire du héro dans le service `Inventaire`.
- `PUT /hero` pour mettre à jour les informations du héros
- `PUT /save` pour mettre à jour la position du hero dans la sauvegarde.

Ajout d'un service `Combat` qui enverra des messages au broker.

Il change d'écran.

- `GET /map/:id` pour charger le prochain écran.
-  `GET /map/mob` retourne les mobs pouvant apparaître sur cette écran.

Il sauvegarde sa partie avant de quitter la page.

- `PUT /save` pour mettre à jour la position du hero dans la sauvegarde.

### Conclusion

par le biais de ce cas d'utilisation nous avons pu determiné les services de notre application avec l'architecture en micro-services mais 
aussi les routes utilisées.

## Architecture de l'application




## Répartition des tâches

- Thomas : `Authentification` et `User`

- Valentine : `Inventaire`, `Mob` et `Map`

- Louis : `Héros` et `Sauvegarde`
