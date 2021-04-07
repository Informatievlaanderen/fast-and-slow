FROM node:lts-alpine

# make the 'app' folder the current working directory
WORKDIR /app

ARG NPM_AUTH_TOKEN
COPY .npmrc .npmrc

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install
RUN rm -f .npmrc

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# build app for production with minification
RUN npm run build

FROM node:lts-alpine
# install simple http server for serving static content
RUN npm install -g http-server

WORKDIR /app
COPY --from=0 /app/dist /app/dist/fast-and-slow-demo
EXPOSE 8080
CMD [ "http-server", "dist" ]
