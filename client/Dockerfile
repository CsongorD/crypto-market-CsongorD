FROM ghcr.io/cirruslabs/flutter:latest AS build

WORKDIR /app
COPY . .
RUN flutter build web

FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
