# Conciliador de Pagos con IA

Este proyecto es una aplicación web que permite procesar archivos de movimientos bancarios para identificar posibles pares conciliables mediante técnicas de inteligencia artificial. Utiliza clustering y medidas de similitud para detectar coincidencias, y muestra al usuario los resultados junto con métricas de rendimiento del proceso.

---

## 💡 Tecnologías utilizadas

- **Backend**: Python, Flask
- **Frontend**: HTML, CSS, JavaScript
- **Machine Learning**: scikit-learn, XGBoost
- **Procesamiento de texto**: TfidfVectorizer, cosine_similarity
- **Clustering**: KMeans, Agglomerative Clustering

---

## 🔄 Flujo de funcionamiento

1. El usuario carga un archivo CSV de movimientos.
2. El sistema muestra opciones de configuración.
3. Se selecciona una opción de procesamiento:
   - **Opcion F**: Clustering con KMeans
   - **Opcion G**: Clustering combinado (KMeans + Jerárquico)
4. El backend procesa los datos, encuentra pares conciliables y calcula métricas.
5. Los resultados se muestran en tabla, junto con un panel de métricas y botones para ver detalles fila a fila.

---

## 🌐 Frontend

### Secciones principales:
- **Carga de archivo**: selector de archivo + barra de progreso
- **Parámetros de configuración**: colapsables para pesos, métodos y umbrales
- **Opciones de procesamiento**: radio buttons para seleccionar la opción F o G
- **Resultados**:
  - Tabla con los pares conciliables
  - Botón "Ver Detalles" (reutiliza la función `fetchRowDetails`)
  - Panel visual con métricas de performance

---

## 🎓 Métricas de performance

Se muestran automáticamente al finalizar el procesamiento.

| Métrica                               | Descripción                                                                 |
|---------------------------------------|-----------------------------------------------------------------------------|
| **Total de registros**                | Cantidad total de movimientos en el archivo cargado                        |
| **Registros ya conciliados (CO)**     | Número de movimientos marcados como `Estatus = CO`                        |
| **Registros pendientes (PE)**         | Número de movimientos con `Estatus = PE` o `Total - Conciliados`          |
| **Total de pares conciliables**       | Cantidad de pares identificados como potencialmente conciliables           |
| **% conciliables sobre pendientes**   | Porcentaje = (pares conciliables * 2) / pendientes * 100                   |
| **Tiempo de procesamiento**           | Tiempo total en segundos desde inicio a fin del procesamiento              |

---

## 📁 Backend

### Funciones principales:

#### `run_option_f(filepath, ...)`
- Aplica clustering con KMeans.
- Calcula pesos de similitud con referencia, fecha y monto.
- Devuelve los pares conciliables y las métricas detalladas.

#### `run_option_g(filepath, ...)`
- Realiza clustering mixto (KMeans + clustering jerárquico).
- Evalúa referencia y monto como criterio de similitud.
- Devuelve resultados similares en estructura a la opción F.

Ambas funciones retornan:

```json
{
  "message": "...",
  "resultados": [...],
  "columnOrder": [...],
  "metricas": {
    "total_registros": int,
    "total_conciliados": int,
    "total_pendientes": int,
    "total_conciliables": int,
    "porcentaje_conciliables": float,
    "tiempo_procesamiento": float
  }
}
```

---

## 📊 Estilos CSS

Se agregó una clase `.results-metrics` para resaltar el bloque de métricas:

```css
.results-metrics {
    margin-top: 20px;
    padding: 15px;
    background-color: #f6f8fa;
    border-left: 5px solid #0d8862;
    border-radius: 8px;
    font-size: 14px;
    color: #333;
}
```

---

## 🚀 Futuras mejoras sugeridas

- Exportación de métricas y resultados
- Paginación de la tabla de resultados
- Comparativa entre ejecuciones
- Integración con bases de datos
- Panel de configuración persistente por usuario

---

## 📄 Archivo esperado (CSV)

El archivo cargado debe tener columnas como:
- Id movimiento
- Tipo movimiento
- Cuenta
- Fecha
- Tipo operación
- Signo
- Monto
- Referencia
- Adicionales
- Estatus (`CO` o `PE`)
- Id Conciliación
- Tipo Regla

---

## 👍 Autor

Este proyecto fue desarrollado como parte de una solución de conciliación de pagos automatizada con IA.

Gracias por usar esta herramienta ✨


