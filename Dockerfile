FROM cirrusci/flutter:latest as build

WORKDIR /app

COPY . .
RUN flutter build web

FROM httpd:alpine
COPY --from=build /app/build/web/ /usr/local/apache2/htdocs/
EXPOSE 80
