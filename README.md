# LemonLdap::NG Quick Starter

Bouchon pour démarrer rapidement des développements avec LemonLdap::NG.

Permet l'authentification des utilisateurs, puis la transmission dans le header (`Auth-mail`) du mail de l'utilisateur connecté à une appli fictive.

Contient :

- SSO LemonLdap:NG
- Annuaire OpenLdap
- Gestionnaire d'annuaire PhpLdapAdmin

En ajoutant la configuration du serveur SMTP, il est possible de bénéficier de la fonctionnalité de création des utisateurs.

## Installation

### Redirection avec le fichier host

Ajouter au fichier hosts de windows, en mode administrateur C:\Windows\System32\drivers\etc\hosts la ligne

```config
127.0.0.1 manager.my-appli.com auth.my-appli.com app.my-appli.com
```

### Configurer l'URL de l'application

Par défaut, le nginx redirige l'utilisateur authentifié vers une page statique. Vous pouvez modifier ce comportement en modifiant le fichier `nginx.conf`, l24-25.

### Configurer le serveur SMTP (indispensable pour la création de compte)

Dans le fichier `lmconf.json`, remplacer à la ligne 5 `SMTP_SERVER` par l'url de votre serveur SMTP (indispensable pour la création de compte).

Remplacez également les valeurs `SMTPAuthUser` et `SMTPAuthPass` avec les login et mots de passe pour votre serveur smtp.

### Démarrer le bouchon

Jouez la commande :

```bash
docker compose up
```

## Administrer l'annuaire

- Naviguer vers `localhost:5000`
- S'identifier avec l'identifiant `cn=admin,dc=my-appli,dc=com` et le mot de passe `myAppliAdminPassword!`

## Connection au portail

### Utilisateur de l'application

Il est possible de se connecter à l'appli `my-appli` avec l'utilisateur `agranet`/`agranet123`

Pour ajouter un utilisateur à l'annuaire, il est nécessaire de chiffrer le mot de passe. Vous pouvez le faire en utilisant l'utilitaire `hash_pwd.sh`

Lancez la commande :

```bash
./hash_pwd MOT_DE_PASSE_A_CHIFFRER
```

### Administrateur de LLNG

Il est possible de se connecter au manager (`http://manager.my-appli.com`) de `LemonLdap:NG` avec l'utilisateur `admin_llng` mot de passe `admin`.
