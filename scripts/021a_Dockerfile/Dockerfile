# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/build/building/multi-stage/

FROM node:20.3.0 AS build
RUN npm install -g @angular/cli@16.0.5 && ng new app && cd app && npm install && ng build

FROM nginx:1.22.1
COPY --from=build  /app/dist/app /usr/share/nginx/html
