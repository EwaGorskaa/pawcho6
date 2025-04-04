# Multi-stage Build
Sprawozdanie z Laboratorium 5  
Ewa Górska

- Zbudowanie obrazu:
  
  ```
   docker build --build-arg VERSION=BETA -t local/lab5_EG:v2 .
  ```
- Uruchomienie serwera:
  
  ```
  docker run -p 8083:8083 local/lab5_EG:v2
  ```
- Test działania:
  - Przeglądarka:
    
    ```
    http://localhost:8083
    ```
  - Konsola:
    
    ```
    curl -v http://localhost:8083
    ```
