FROM node:latest

WORKDIR /app

COPY ./ReactTest/liste-courses .

RUN npm install
EXPOSE 5173

CMD ["npm", "run", "dev"]