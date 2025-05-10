FROM node:18
RUN apt-get update && \
    apt-get install -y git imagemagick && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /ecs-app

COPY package*.json ./
RUN npm install
COPY . .

RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]
