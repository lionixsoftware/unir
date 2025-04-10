# Usa una imagen base liviana de Python
FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos al contenedor
COPY . .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto en el que corre Flask
EXPOSE 5000

# Comando para ejecutar la app
CMD ["python", "app.py"]

