
--->Pour voir une vidéo démonstrative : https://drive.google.com/file/d/1XsNfHrS8Xwh-J25i-vyfhb-0cHr3eFdq/view?usp=drive_link 

# 🎓 QR-Absence-Manager
### Système de Gestion d'Assiduité Universitaire Sécurisé par QR Code

![Django](https://img.shields.io/badge/Backend-Django-092E20?style=for-the-badge&logo=django)
![Flutter](https://img.shields.io/badge/Mobile-Flutter-02569B?style=for-the-badge&logo=flutter)
![Security](https://img.shields.io/badge/Security-Network%20Check%20%26%20Time%20Limit-red?style=for-the-badge)

## 📖 Contexte Général
Ce projet vise à moderniser le suivi pédagogique à travers une architecture hybride :
* **Plateforme Web :** Dédiée aux Enseignants et Administrateurs pour la gestion, la génération des codes et la supervision.
* **Application Mobile :** Dédiée aux Étudiants pour l'enregistrement de leur présence.

L'objectif est de remplacer les feuilles d'émargement papier par une solution numérique instantanée, fiable et sécurisée, libérant ainsi du temps précieux pour l'enseignement.

---

## ❓ Problématique
La gestion traditionnelle de la présence souffre de défauts majeurs qui impactent la qualité de l'enseignement :
* **Perte de temps massive :** L'appel prend entre **5 à 10 minutes par séance**, ce qui représente un cumul de **4 à 8 heures perdues par semaine** et par classe.
* **Fiabilité des données :** Risques élevés d'erreurs de saisie manuelle et de perte physique des feuilles d'absence.
* **Suivi difficile :** L'administration manque de visibilité en temps réel sur l'assiduité.

> **Notre défi :** Comment réduire drastiquement le temps administratif tout en garantissant la fiabilité de l'assiduité ?

---

## 🛡️ Sécurité & Fiabilité Anti-Fraude
Pour garantir la présence physique des étudiants et éviter les fraudes (scan à distance, partage de code), nous avons implémenté des contrôles techniques rigoureux :

### 1. 📡 Vérification du Réseau (Géolocalisation par IP)
L'application s'assure que l'étudiant est physiquement présent dans l'établissement au moment du scan.
* **Fonctionnement :** Le système compare l'adresse réseau de l'étudiant avec celle du professeur en appliquant le masque de sous-réseau.
* **Sécurité :** Si l'étudiant n'est pas connecté au même réseau local (Wi-Fi de l'université/classe) que l'enseignant, le scan est refusé.

### 2. ⏳ Validité Temporelle (30 minutes)
Le système impose une fenêtre de temps stricte pour l'émargement.
* **Fonctionnement :** Le QR Code généré par le professeur possède une durée de vie de **30 minutes** à partir du début de la séance.
* **Sécurité :** Passé ce délai, le code devient invalide. Cela empêche les étudiants retardataires excessifs de scanner, ou ceux arrivant pour le cours suivant de valider leur présence rétroactivement en utilisant une photo du code.

### 3. 🔄 QR Code Dynamique
* **Fonctionnement :** Le QR Code affiché se rafraîchit régulièrement avec un nouveau jeton (token) crypté.
* **Avantage :** Une simple photo du code prise et envoyée à un étudiant absent devient rapidement obsolète.

---

## ⚙️ Fonctionnalités par Acteur

### 👨‍💼 Administrateur (Interface Web)
* Gestion globale des utilisateurs (Étudiants, Professeurs).
* Création et gestion des filières, des modules et des emplois du temps.
* Supervision des statistiques d'absence en temps réel pour la prise de décision.

### 👨‍🏫 Enseignant (Interface Web)
* **Génération de séance :** Création et projection du QR Code dynamique en classe.
* **Suivi live :** Visualisation instantanée des étudiants qui scannent le code.
* **Historique :** Consultation et modification des registres de présence.

### 👨‍🎓 Étudiant (Application Mobile)
* **Scan sécurisé :** Validation de la présence via la caméra.
* **Tableau de bord :** Consultation de son propre taux d'assiduité et alertes d'absence.
* **Profil :** Gestion des informations personnelles.

---

## 🛠️ Stack Technique

| Module | Technologie | Rôle |
| :--- | :--- | :--- |
| **Backend API** | **Django (Python)** | Logique métier, Génération QR dynamique, API REST. |
| **Frontend Web** | **Django Templates / HTML5** | Interface de gestion pour Profs et Admins. |
| **Mobile App** | **Flutter (Dart)** | Application scanner pour les étudiants (Android/iOS). |
| **Base de Données** | **SQLite** | Stockage des utilisateurs, logs de présence et configurations. |

---

## 🚀 Installation

### Pré-requis
* Python 3.x
* Flutter SDK
* Git

### 1. Installation du Backend (Django)
```bash
# Cloner le projet
git clone https://github.com/ossame/QRcode-Absence-Manager
cd QRcode-Absence-Manager/django16

# Créer un environnement virtuel
python -m venv venv
source venv/bin/activate  # Sur Windows: venv\Scripts\activate

# Installer les dépendances
pip install -r requirements.txt

# Appliquer les migrations
python manage.py migrate

# Lancer le serveur
python manage.py runserver
