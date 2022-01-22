#!/bin/bash

# Script permettant à n'importe qui de me demander un dépannage sous linux
# Etapes : 
# 1) Mise en place d'un serveur ssh (avec un mot de passe)
# 1.1) Vérifier qu'il y a bien un sshd ou le télécharger
# 1.2) Configurer le serveur ssh
# 1.3) Configurer le mot de passe
# 2) Mise en place de ngrok (ouverture de port sous réseau privé pour ssh)
# 2.1) Vérifier présence de ngrok et le télécharger au besoin
# 2.2) Configurer ngrok
# 3) Envoi d'un mail avec identifiants SSh et détails du demandeur (nom, machine, version ...)
# 3.1) Vérifier qu'il y a bien un outil d'envoi de mail et télécharger un au besoin
# 3.2) Configurer l'envoi de mail
# 4) Envoi d'un mail de confirmation


