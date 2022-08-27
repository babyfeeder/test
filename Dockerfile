FROM node:18 as build-deps
COPY package.json yarn.lock ./
RUN yarn
COPY . ./

FROM nginx:1.22.0-alpine
COPY --from=build-deps /usr/src/app/public /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
