FROM node:12

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8083

CMD ["npm", "run", "dev"]