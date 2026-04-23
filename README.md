# 🎬 API CRUD Movies - Infraestructura Docker

Este proyecto despliega una arquitectura escalable para una API de películas, utilizando un balanceador de carga Nginx, tres instancias de la API en Node.js y una base de datos MariaDB persistente.

##  Requisitos Previos
- [Docker Desktop](https://docker.com) instalado y en ejecución.
- Terminal (PowerShell, CMD o Bash).

##  Cómo Ejecutar el Proyecto

1. **Clonar o descargar** este repositorio en tu máquina local.
2. Abrir una terminal en la carpeta raíz del proyecto (`movies-infra`).
3. Ejecutar el siguiente comando para construir e iniciar todos los servicios:
   ```bash
   docker-compose up --build
   ```
4. Esperar a que el contenedor `movies_db` muestre el estado `(healthy)` en Docker Desktop.

##  Puertos Utilizados
- **Puerto 80 (Nginx):** Punto de entrada principal (Balanceador).
- **Puertos 3000, 3001, 3002:** Acceso directo a las instancias API 1, 2 y 3.
- **Puerto 3306:** Acceso a la base de datos MariaDB.

##  Pruebas de Funcionamiento

### 1. Acceso a la API
Puedes probar las rutas principales a través del balanceador (Puerto 80):
- **Listar películas:** [http://localhost/api/movies](http://localhost/api/movies)
- **Ver película por ID:** [http://localhost/api/movies/1](http://localhost/api/movies/1)
- **Estado de salud (Health):** [http://localhost/api/health](http://localhost/api/health)

## Endpoints disponibles

| Método | URL | Descripción |
|--------|-----|-------------|
| GET | http://localhost/api/movies | Listar películas |
| GET | http://localhost/api/movies/:id | Obtener película |
| POST | http://localhost/api/movies | Crear película |
| PUT | http://localhost/api/movies/:id | Reemplazar película |
| PATCH | http://localhost/api/movies/:id | Actualizar película |
| DELETE | http://localhost/api/movies/:id | Eliminar película |

### 2. Verificación del Balanceo de Carga
Para confirmar que el tráfico se reparte mediante **Round-Robin**, ejecuta este comando en PowerShell:
```powershell
1..6 | ForEach-Object { 
    (Invoke-WebRequest -Uri "http://localhost/api/health" -UseBasicParsing).Content 
}
```
*Deberías ver cómo responden de forma alternada la API-1, API-2 y API-3.*

##  Estructura del Proyecto
- `/db`: Script de inicialización SQL (`init.sql`).
- `/nginx`: Configuración del proxy inverso (`nginx.conf`).
- `docker-compose.yml`: Definición de la infraestructura.
- `Dockerfile`: Configuración de la imagen de la API.
