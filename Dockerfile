# Utiliser l'image officielle de Jenkins LTS
FROM jenkins/jenkins:lts

# Passer à l'utilisateur root pour installer des dépendances
USER root

# Installer Git, Docker, PHP, et Composer
RUN apt-get update && \
    apt-get install -y git docker.io php-cli unzip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /var/lib/apt/lists/*

# Revenir à l'utilisateur Jenkins
USER jenkins
