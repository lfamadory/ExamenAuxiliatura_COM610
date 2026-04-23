# Dockerfile
FROM node:18-alpine

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos de dependencias primero (optimización de caché)
COPY api-restful-crud-movies/package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar el código fuente de la API
COPY api-restful-crud-movies/ .

# Exponer el puerto que usa la API
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "app.js"]