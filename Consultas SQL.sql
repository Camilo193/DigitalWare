--1. Obtener la lista de precios de todos los productos
SELECT Nombre, Precio
FROM Productos

--2. Obtener la lista de productos cuya existencia en el inventario haya llegado al mínimo permitido (5 unidades)
SELECT Nombre, Stock
FROM Productos
WHERE Stock <= 5
--3. Obtener una lista de clientes no mayores de 35 años que hayan realizado compras entre el 1 de febrero de 2000 y el 25 de mayo de 2000
SELECT *
FROM Clientes cl, facturas fa
WHERE DATEDIFF(YEAR, cl.FechaNacimiento, SYSDATETIME() ) < 35 AND fa.Fecha BETWEEN '2000-02-01' AND '2000-05-25' AND cl.Identificacion = fa.Cliente
--4. Obtener el valor total vendido por cada producto en el año 2000
SELECT pr.Nombre, Sum(De.Precio) AS Total
FROM Productos pr, Detalles de, Facturas fa
WHERE fa.Fecha BETWEEN '2000-01-01' AND '2000-12-31' AND pr.Codigo = de.Producto AND fa.Codigo = de.Factura
GROUP BY pr.Nombre

--5. Obtener la última fecha de compra de un cliente y según su frecuencia de compra, estimar en qué fecha podría volver a comprar.

--Obtener la última fecha de compra de un cliente, en este caso del cliente con cedula 41896155
SELECT TOP 1 fa.Fecha
FROM facturas fa, Clientes cl
WHERE cl.Identificacion = '41896155' AND cl.Identificacion = fa.cliente
ORDER BY Fecha DESC

--**Calculo la frecuencia de compra en días
--Con la última fecha de compra, calculo el promedio en días de cada cuanto compra el cliente

--Si el cliente tiene más de 2 compras, se calcula la frecuencia de la siguiente manera:
SELECT DATEDIFF(DAY, AVG(CAST(fa.fecha AS FLOAT)), '2020-06-06 00:00:00.000')  AS FrecuenciaDias
FROM Facturas fa, Clientes cl
WHERE cl.Identificacion = '41896155' AND cl.Identificacion = fa.cliente

--Si el cliente tiene 2 compras (Como es el caso del cliente 1040752310), se calcula la frecuencia de la siguiente manera:
SELECT DATEDIFF(DAY, fa.fecha, '2021-04-14 00:00:00.000')  AS FrecuenciaDias
FROM Facturas fa, Clientes cl
WHERE cl.Identificacion = '1040752310' AND cl.Identificacion = fa.cliente
GROUP BY fa.fecha
HAVING DATEDIFF(DAY, fa.fecha, '2021-04-14 00:00:00.000') > 0

--Si el cliente tiene 1  compra, no es posible predecir su comportamiento.

--**Estimar en qué fecha podría volver a comprar.
--Ahora le sumo a la última fecha de compra, el promedio en días o la frecuencia de compra
SELECT DATEADD(DAY, 1827, '2021-04-20 00:00:00.000') AS PrediccionProximaCompra
--Próxima compra para el cliente que tiene 2 compras (Como es el caso del cliente 1040752310)
SELECT DATEADD(DAY, 7670, '2021-04-20 00:00:00.000') AS PrediccionProximaCompra
