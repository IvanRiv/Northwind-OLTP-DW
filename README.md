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
Tambien se incluye 3 scripts:
  - Para limpiar las tablasa y recuperar los datos de NorthWind para el Northwind_OLTP
  - Para limpiar las tablas, reiniciar los contadores y versiones, e insertar el punto de partida para cada ETL
  - Un ejemplo para poblar datos en el OLTP

5. Tecnologías Utilizadas
* Motor de Base de Datos: SQL Server 22 (Enterprise Developer Edition).
* Herramientas de ETL: SQL Server Integration Services (SSIS).
* IDE: Visual Studio 2022 con SSDT.
* Control de Versiones: Git / GitHub.

6. ETL (Extracción, Transformación y Carga)
Se tiene 6 archivos.dtsx y un archivo main

* Date
  <img width="350" height="282" alt="Captura de pantalla 2026-05-16 092339" src="https://github.com/user-attachments/assets/abe5fac1-f845-4693-afe1-2701b242321f" />

Este permite cargar los datos como las fechas, mes, año

* Customers
<img width="268" height="405" alt="Captura de pantalla 2026-05-16 092353" src="https://github.com/user-attachments/assets/9c013ebb-0691-4d00-8d70-af9888866f8e" />
<img width="541" height="325" alt="Captura de pantalla 2026-05-16 092401" src="https://github.com/user-attachments/assets/1bf90f1d-2b52-4098-8275-02f0db32b7bd" />

  - Get Database Row Version: Se conecta a la base de datos OLTP para verificar la conexión
  - Get Last Row Version: Consulta el último registro que se realizo en el DW
  - Clear-Up: Staging: Limpia las tablas Staging
  - Load Customer: Permite cargar el flujo de datos
    - Get Customer: Permite ver los últimos cambios que se hizo en Customer de OLTP
    - Lookup: Operación de busqueda
    - Load Dim: Inserta los datos nuevos en DimCustomer
    - Load Staging: Se inserta temporalmente los datos del OLTP a las tablas Staging
  - Sin-Staging: Permite ejecutar los procedimientos almacenados como Merge
  - Update Last Row Version: Permite actualizar la tabla DimCustomer

* Product
<img width="294" height="402" alt="Captura de pantalla 2026-05-16 092414" src="https://github.com/user-attachments/assets/e5c58b61-1da1-468b-b8e8-b202f3da80c7" />
<img width="594" height="328" alt="Captura de pantalla 2026-05-16 092423" src="https://github.com/user-attachments/assets/9600a885-d4a8-457a-9544-3b9c19e9d5fa" />

  - Get Database Row Version: Se conecta a la base de datos OLTP para verificar la conexión
  - Get Last Row Version: Consulta el último registro que se realizo en el DW
  - Clear-Up: Staging: Limpia las tablas Staging
  - Load Product: Permite cargar el flujo de datos
    - Get Product: Permite ver los últimos cambios que se hizo en Products de OLTP
    - Lookup: Operación de busqueda
    - Load Dim: Inserta los datos nuevos en DimProduct
    - Load Staging: Se inserta temporalmente los datos del OLTP a las tablas Staging
  - Sin-Staging: Permite ejecutar los procedimientos almacenados como Merge
  - Update Last Row Version: Permite actualizar la tabla DimProduct

* Shippers
<img width="253" height="421" alt="Captura de pantalla 2026-05-16 092434" src="https://github.com/user-attachments/assets/76e69f66-02cc-4564-80cd-afffdfe94bf1" />
<img width="597" height="315" alt="Captura de pantalla 2026-05-16 092440" src="https://github.com/user-attachments/assets/cc93d5e8-8e3f-410a-89f6-2194afff9f23" />


  - Get Database Row Version: Se conecta a la base de datos OLTP para verificar la conexión
  - Get Last Row Version: Consulta el último registro que se realizo en el DW
  - Clear-Up: Staging: Limpia las tablas Staging
  - Load Shipper: Permite cargar el flujo de datos
    - Get Shipper: Permite ver los últimos cambios que se hizo en Shippers de OLTP
    - Lookup: Operación de busqueda
    - Load Dim: Inserta los datos nuevos en DimShipper
    - Load Staging: Se inserta temporalmente los datos del OLTP a las tablas Staging
  - Sin-Staging: Permite ejecutar los procedimientos almacenados como Merge
  - Update Last Row Version: Permite actualizar la tabla DimShipper


* Employee
<img width="289" height="421" alt="Captura de pantalla 2026-05-16 092450" src="https://github.com/user-attachments/assets/c397fd60-f600-426e-9a81-3e398da2b033" />
<img width="552" height="311" alt="Captura de pantalla 2026-05-16 092457" src="https://github.com/user-attachments/assets/1491e57e-442d-4306-b970-258c3fa70328" />

  - Get Database Row Version: Se conecta a la base de datos OLTP para verificar la conexión
  - Get Last Row Version: Consulta el último registro que se realizo en el DW
  - Clear-Up: Staging: Limpia las tablas Staging
  - Load Employee: Permite cargar el flujo de datos
    - Get Employee: Permite ver los últimos cambios que se hizo en Employees de OLTP
    - Lookup: Operación de busqueda
    - Load Dim: Inserta los datos nuevos en DimEmployee
    - Load Staging: Se inserta temporalmente los datos del OLTP a las tablas Staging
  - Sin-Staging: Permite ejecutar los procedimientos almacenados como Merge
  - Update Last Row Version: Permite actualizar la tabla DimEmployee

* Orders
<img width="254" height="422" alt="Captura de pantalla 2026-05-16 092506" src="https://github.com/user-attachments/assets/6d2bf29a-9263-45be-996b-497bae4da2af" />
<img width="411" height="438" alt="Captura de pantalla 2026-05-16 092644" src="https://github.com/user-attachments/assets/9f55c8d2-95f2-4501-8e9d-1a1fdc9b5836" />
<img width="364" height="465" alt="Captura de pantalla 2026-05-16 092705" src="https://github.com/user-attachments/assets/958fd613-c3a2-463a-beb2-d6c4f468cae5" />

  - Get Database Row Version: Se conecta a la base de datos OLTP para verificar la conexión
  - Get Last Row Version: Consulta el último registro que se realizo en el DW
  - Clear-Up: Staging: Limpia las tablas Staging
  - Load Orders: Permite cargar el flujo de datos
    - Get Order: Permite ver los últimos cambios que se hizo en Orders de OLTP
    - Lookup Customers: Operación de busqueda para asignar las llaves entre DimCustomer y FactOrders
    - Lookup Employee: Operación de busqueda para asignar las llaves entre DimEmployee y FactOrders
    - Lookup Product: Operación de busqueda para asignar las llaves entre DimProduct y FactOrders
    - Lookup Shipper: Operación de busqueda para asignar las llaves entre DimShipper y FactOrders
    - Data Conversion: Para convertir Date a tipo DT-DBDATE
    - Lookup Date: Operación de busqueda para asignar las llaves entre DimDate y FactOrders
    - Data Conversion 1: Para convertir Date a tipo DT-DBDATE
    - Lookup Date (Required): Operación de busqueda para asignar las llaves entre DimDate y FactOrders
    - Data Conversion 2: Para convertir Date a tipo DT-DBDATE
    - Lookup Date (Shipped): Operación de busqueda para asignar las llaves entre DimDate y FactOrders
    - Derived Colum: Permite que se asigne y permita el NULL si se asignara fechas que no corresponde a los años entre 1996 y 1998
    - Load Staging: Se inserta temporalmente los datos del OLTP a las tablas Staging
  - Sin-Staging: Permite ejecutar los procedimientos almacenados como Merge
  - Update Last Row Version: Permite actualizar la tabla FactOrders

7. Instrucciones de ejecución
Para ejecutar los ETL hay que iniciar el Main.dtsx y este se encargara de hacer ejecutar en orden los ETL
<img width="266" height="489" alt="Captura de pantalla 2026-05-16 092939" src="https://github.com/user-attachments/assets/35085b78-a20d-4f0d-8b63-da7e065f970d" />

Date --> Customers --> Product --> Shippers --> Employee --> Orders

8. Pruebas

Ejecución de los ETL funcionando

<img width="1564" height="512" alt="Captura de pantalla 2026-05-16 102548" src="https://github.com/user-attachments/assets/b64eae38-aae1-412c-9dca-a4b4e1c6255a" />

Datos insertados en el DW

<img width="472" height="387" alt="Captura de pantalla 2026-05-16 102720" src="https://github.com/user-attachments/assets/f46b9739-5c29-4157-b017-4fa2a0a8e78b" />
<img width="1462" height="465" alt="Captura de pantalla 2026-05-16 102736" src="https://github.com/user-attachments/assets/fa610331-6816-4683-80d8-5a2148e6cc09" />
<img width="1470" height="455" alt="Captura de pantalla 2026-05-16 102729" src="https://github.com/user-attachments/assets/90096d9d-63df-438c-b385-f8fad2f6b178" />
<img width="1476" height="463" alt="Captura de pantalla 2026-05-16 102743" src="https://github.com/user-attachments/assets/4a71ac12-aec2-4cfa-b09d-94972a43ec95" />

Insertando varios datos en el OLTP

<img width="1477" height="495" alt="Captura de pantalla 2026-05-16 102804" src="https://github.com/user-attachments/assets/19133efc-cbea-4800-bbe8-5fc79d2ecb9d" />

<img width="1471" height="477" alt="Captura de pantalla 2026-05-16 102819" src="https://github.com/user-attachments/assets/b9bbc908-9e01-476b-b950-b0b5926776af" />
<img width="1477" height="463" alt="Captura de pantalla 2026-05-16 102850" src="https://github.com/user-attachments/assets/018f2e46-4a30-49ef-beb0-7659a942a169" />
<img width="1479" height="462" alt="Captura de pantalla 2026-05-16 102904" src="https://github.com/user-attachments/assets/6834f0ea-7102-435f-bfd6-63ae67f815ac" />
<img width="1480" height="472" alt="Captura de pantalla 2026-05-16 102920" src="https://github.com/user-attachments/assets/fe65595c-59a4-45aa-bee5-c412134029da" />

Verificando los nuevos registros que se añadieron en el OLTP

<img width="491" height="469" alt="Captura de pantalla 2026-05-16 103000" src="https://github.com/user-attachments/assets/5089aeb2-93ab-46f9-a2e5-e9dc4919064a" />
<img width="1471" height="468" alt="Captura de pantalla 2026-05-16 103014" src="https://github.com/user-attachments/assets/afd845ab-b35e-4b5a-8a77-1521a017a6eb" />
<img width="1476" height="462" alt="Captura de pantalla 2026-05-16 103027" src="https://github.com/user-attachments/assets/3d998849-0c05-4679-b127-19dbb6229e39" />
<img width="1477" height="467" alt="Captura de pantalla 2026-05-16 103038" src="https://github.com/user-attachments/assets/72c3447d-6724-4927-a1b4-c224a3851a1b" />



