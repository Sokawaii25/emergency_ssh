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

# VARIABLES
ngrok_directory="~/bin/"


# check ssh server
if [ -f /etc/ssh/sshd_config ]; then
    echo "Un serveur SSH est déjà installé !"
else
    echo "Aucun serveur SSH détecté !"
    echo "Téléchargement du serveur SSH..."
    sudo apt-get install openssh-server
    echo "Serveur SSH installé !"
    # setup temp key
    ssh-keygen -f ssh_temp_key -t rsa -N ""
    # copy key to authorized_keys
    sudo cp ssh_temp_key.pub /etc/ssh/authorized_keys
    echo "Clé publique ajoutée au serveur SSH !"
fi

# download ngrok
if [ ! -f $ngrok_directory/ngrok ]; then
    cd $ngrok_directory
    wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
    unzip ngrok-stable-linux-amd64.zip
    rm ngrok-stable-linux-amd64.zip
fi


# after sending the mail : 
# remove temp key
sudo rm ssh_temp_key*