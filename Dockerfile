FROM scratch AS stage1
# dodanie minimalnego systemu plików
ADD alpine-minirootfs-3.21.3-x86_64.tar /

# ustawienie katalogu roboczego
WORKDIR /app

# dodanie plików aplikacji do kontenera
COPY ./package.json serwer.js ./


FROM nginx:alpine AS stage2

# Ustawienie zmiennej środowiskowej dla wersji
ARG VERSION
ENV VERSION=${VERSION:-BETA}

# skopiowanie aplikacji ze stage'a 1
COPY --from=stage1 /app /app
 
# skopiowanie pliku konfiguracyjnego nginx
COPY nginx.conf /etc/nginx/nginx.conf

# ustawienie katalogu roboczego
WORKDIR /app 

# wystawienie portu
EXPOSE 8083

# instalacja nodejs i npm oraz zainstalowanie zależności
RUN apk add --no-cache nodejs npm && npm install 

# sprawdzenie stanu zdrowia aplikacji
HEALTHCHECK --interval=10s --timeout=1s \
  CMD curl -f http://localhost:8083/ || exit 1

# uruchomienie aplikacji
CMD ["sh", "-c", "npm start & nginx -g 'daemon off;'"]
