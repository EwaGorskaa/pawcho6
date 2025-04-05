# Multi-stage Build with SSH
Sprawozdanie z Laboratorium 6 
Ewa Górska

- Zbudowanie obrazu:
  
  ```
   DOCKER_BUILDKIT=1 docker build --ssh default --build-arg VERSION=BETA -t ghcr.io/ewagorskaa/lab6:v6 .

  ```
- Wypchnięcie obrazu do repo:
  
  ```
  docker push ghcr.io/ewagorskaa/lab6:v6
  
  ```
  
- Test działania:
  1. Uruchomienie serwera:
    ```
    docker run -p 8083:8083 ghcr.io/ewagorskaa/lab6:v6
    ```
  2. Przeglądarka:
    
    ```
    http://localhost:8083
    ```
  3. Konsola:
    
    ```
    curl -v http://localhost:8083
    ```
