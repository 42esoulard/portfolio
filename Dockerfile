FROM node:lts

ENV CHOKIDAR_USEPOLLING=true
ENV NODE_ENV=development

# installe un simple serveur http pour servir un contenu statique
# RUN npm install -g http-server

# définit le dossier 'app' comme dossier de travail
WORKDIR /app

# copie 'package.json' et 'package-lock.json' (si disponible)
COPY package.json /app/package.json

# installe les dépendances du projet
RUN npm install
# RUN npm install @vue/cli@3.7.0 -g

# copie les fichiers et dossiers du projet dans le dossier de travail (par exemple : le dossier 'app')
COPY . .

# construit l'app pour la production en la minifiant
# RUN npm run build

EXPOSE 8080
# CMD ["npm", "run", "serve"]