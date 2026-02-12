🎓 UniScan-Presence
Système de Gestion d'Assiduité Universitaire Sécurisé par QR Code
📖 Contexte Général
Ce projet vise à moderniser le suivi pédagogique à travers une architecture hybride :

Plateforme Web : Dédiée aux Enseignants et Administrateurs pour la gestion et la supervision.

Application Mobile : Dédiée aux Étudiants pour l'enregistrement de leur présence.

L'objectif est de remplacer les feuilles d'émargement papier par une solution numérique instantanée, fiable et sécurisée.

❓ Problématique
La gestion traditionnelle de la présence souffre de défauts majeurs qui impactent la qualité de l'enseignement :

Perte de temps massive : L'appel prend entre 5 à 10 minutes par séance, ce qui représente un cumul de 4 à 8 heures perdues par semaine et par classe.

Fiabilité des données : Risques élevés d'erreurs de saisie manuelle et de perte physique des feuilles d'absence.

Fraude : Difficulté de vérifier l'identité réelle des étudiants présents dans les grands amphithéâtres.

Notre défi : Comment réduire drastiquement le temps administratif tout en garantissant la fiabilité de l'assiduité ?

🛡️ Sécurité & Fiabilité du Système
Pour garantir la présence physique des étudiants et éviter les fraudes, nous avons implémenté des contrôles techniques rigoureux :

1. Vérification du Réseau (Géolocalisation par IP)
Fonctionnement : L'application vérifie que l'étudiant est bien connecté au réseau de l'établissement (Wi-Fi de l'université).

Technique : Le système compare l'adresse réseau de l'étudiant avec celle du professeur en appliquant le masque de sous-réseau. Si l'étudiant n'est pas sur le même réseau local (c'est-à-dire physiquement dans l'établissement), le scan est refusé.

2. Validité Temporelle du QR Code
Fonctionnement : Le QR Code généré par le professeur possède une durée de vie stricte de 30 minutes à partir du début de la séance.

Sécurité : Passé ce délai, le code devient invalide. Cela empêche les étudiants retardataires excessifs de scanner, ou ceux arrivant pour le cours suivant de valider leur présence rétroactivement en utilisant une photo du code prise par un ami.

⚙️ Fonctionnalités par Acteur
👨‍💼 Administrateur (Interface Web)
Gestion globale des utilisateurs (Étudiants, Professeurs).

Création et gestion des filières et des modules.

Supervision des statistiques d'absence en temps réel pour prendre des décisions éclairées.

👨‍🏫 Enseignant (Interface Web)
Génération de séance : Création et projection du QR Code dynamique en classe.

Suivi live : Visualisation instantanée des étudiants qui scannent le code.

Historique : Consultation et modification des registres de présence.

👨‍🎓 Étudiant (Application Mobile)
Scan sécurisé : Validation de la présence via la caméra.

Tableau de bord : Consultation de son propre taux d'assiduité et alertes d'absence.

Authentification unique : Connexion sécurisée liée à l'appareil physique.

