# Northwind-OLTP-DW
Proyecto Northwind

# Proyecto de Inteligencia de Negocios: Northwind ETL & Data Warehouse
Este proyecto implementa una solución completa de Gestión de Datos y BI utilizando la base de datos Northwind. Se abarca desde el diseño de una base de datos transaccional (OLTP) hasta la creación de un modelo analítico (Data Warehouse) con procesos de carga incremental (ETL) y automatización.

1. Descripción del Proyecto
El objetivo es transformar los datos operativos de una empresa de importación/exportación de alimentos en información estratégica. El sistema permite analizar el rendimiento de ventas por empleado, producto, cliente y tiempo.

2. Modelos de Datos

Modelo OLTP (Normalizado)
Se diseñó un esquema relacional siguiendo la 3ra Forma Normal (3FN) para garantizar la integridad de las transacciones
* Entidades principales: Clientes, Empleados, Productos, Transportistas y Órdenes
* Control de cambios: Se implementó la columna rowversion en todas las tablas para permitir la extracción incremental de datos

<img width="722" height="607" alt="Northwind_OLTP" src="https://github.com/user-attachments/assets/0447d8b6-ddf0-41e5-a797-d43708970ff4" />

Modelo de Data Warehouse (Esquema Estrella)
El modelo analítico se estructuró en un esquema estrella para optimizar las consultas de BI.
* Tabla de Hechos: FactOrders (contiene métricas de cantidad, precio unitario y descuentos)
* Dimensiones: DimCustomer, DimEmployee, DimProduct, DimShipper y DimDate
* Integridad: Se incluyó una "Fila 0" (ID 0) en las dimensiones para manejar registros con datos faltantes o nulos, evitando fallos en la carga

<img width="533" height="606" alt="Northwind_DW" src="https://github.com/user-attachments/assets/4e9caa53-960e-4857-853d-ae1d50d7284e" />

3. Proceso ETL (Extracción, Transformación y Carga)
La carga de datos se realiza mediante SQL Server Integration Services (SSIS).
* Carga Incremental: Los paquetes utilizan procedimientos almacenados (Get...ChangesByRowVersion) para traer solo la información nueva desde la última ejecución
* Transformaciones clave:
  - Búsquedas (Lookups): Mapeo de llaves de negocio a llaves subrogadas (SK)
  - Manejo de Nulos: Uso de Columnas Derivadas para sustituir fechas inexistentes por el valor 0, asegurando que el proceso no se detenga por restricciones de integridad
* Paquetes incluidos: Customers.dtsx, Employee.dtsx, Product.dtsx, Shippers.dtsx, Date.dtsx y Orders.dtsx

4. Instrucciones de Despliegue
Para replicar este entorno, siga estos pasos:

* Bases de Datos: Ejecute los scripts SQL proporcionados para crear Northwind_OLTP y Northwind_DW
* DACPAC: Implemente el archivo .dacpac incluido para asegurar que el esquema coincida con el entorno de desarrollo SSISDB:
  - Cree el catálogo de Integration Services en su servidor
  - Realice el Deploy del proyecto desde Visual Studio hacia el catálogo recién creado.
* Automatización: Configure un Job en el Agente de SQL Server para ejecutar los paquetes en el orden lógico (Dimensiones -> Hechos)

5. Tecnologías Utilizadas
* Motor de Base de Datos: SQL Server 22 (Enterprise Developer Edition).
* Herramientas de ETL: SQL Server Integration Services (SSIS).
* IDE: Visual Studio 2022 con SSDT.
* Control de Versiones: Git / GitHub.
