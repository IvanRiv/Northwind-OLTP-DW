# Northwind-OLTP-DW
Proyecto Northwind

# Sistema de Gestión de Ventas Northwind (OLTP & Data Warehouse)

Este proyecto implementa una solución completa de gestión de datos para una empresa de distribución de alimentos (E-commerce), siguiendo los requisitos de diseño transaccional y analítico en **SQL Server**.

## 1. Descripción del Proyecto
El sistema se divide en dos arquitecturas principales:
*   **Modelo OLTP:** Diseñado para soportar las operaciones diarias de ventas, asegurando la integridad de los datos mediante la normalización hasta la **Tercera Forma Normal (3FN)**.
*   **Data Warehouse (DW):** Un modelo dimensional tipo **Estrella** optimizado para el análisis de rendimiento de ventas y reportes gerenciales.

## 2. Dominio de Negocio y Reglas
El dominio elegido es **Ventas y Distribución**. Algunas reglas de negocio implementadas son:
*   Los productos discontinuados no se incluyen en las listas activas de ventas.
*   El cálculo del precio total de venta (`ExtendedPrice`) considera el precio unitario, la cantidad y los descuentos aplicados.
*   Las ventas se agrupan por categorías y periodos de tiempo (trimestres/años) para análisis analítico.

## 3. Modelos de Datos

### Modelo Entidad-Relación (OLTP)
<img width="776" height="495" alt="Diagrama Entidad-Relación (OLTP)" src="https://github.com/user-attachments/assets/770c8503-c5cb-41e1-970b-2edf476d944f" />
*Descripción: Estructura normalizada que incluye tablas de Clientes, Productos, Órdenes y sus detalles.*

### Modelo Estrella (Data Warehouse)
<img width="812" height="513" alt="Diagrama de Modelo Estrella (Data Warehouse)" src="https://github.com/user-attachments/assets/68873b41-ab18-46c8-916a-7339e2026669" />
*Descripción: Tabla de hechos `Fact_Sales` rodeada por las dimensiones `Dim_Product` y `Dim_Time`.*

## 4. Estructura del Repositorio
Siguiendo las buenas prácticas, el repositorio está organizado de la siguiente manera:
*   `/Scripts_SQL`: Scripts de creación de esquemas y carga de datos (mínimo 20 registros por tabla).
*   `/Proyecto_Visual_Studio`: Solución de Visual Studio con los proyectos de base de datos.
*   `/DACPACs`: Archivos `.dacpac` listos para el despliegue técnico.

## 5. Instrucciones de Despliegue
Para replicar este entorno:
1.  **Mediante Scripts:** Ejecutar los archivos `.sql` en el orden: Esquema OLTP -> Carga Datos -> Esquema DW -> Proceso ETL.
2.  **Mediante DACPAC:** Utilizar SQL Server Management Studio para "Publicar Aplicación de Capa de Datos" seleccionando los archivos `.dacpac` incluidos en este repositorio.

## 6. Tecnologías Utilizadas
*   **Motor de BD:** SQL Server (TSQL 100%).
*   **Herramientas:** Visual Studio Community / SSDT, SQL Server Management Studio.
