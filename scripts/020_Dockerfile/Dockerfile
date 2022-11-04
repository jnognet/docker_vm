# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/build/building/multi-stage/

FROM node:14.21.0-buster-slim AS build
RUN npm install -g @angular/cli && ng new app && cd app && npm install && ng build

FROM nginx:1.22.1
COPY --from=build  /app/dist/app /usr/share/nginx/html
