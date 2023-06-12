USE esencialDB
GO
SELECT PA.nombre AS Pais, I.name AS Industria ,D.nombre AS Desecho,
    CONVERT(date, MR.fecha) AS Fecha, PT.precioXUni * cantidadDes AS Costo, SUM(V.monto) AS Venta,
    SUM(V.monto) - PT.precioXUni * cantidadDes AS Ganancia
FROM movimientosRecipiente MR
INNER JOIN desechos D ON D.desechoId = MR.desechoId
INNER JOIN productores P ON P.productorId = MR.productorId
INNER JOIN direcciones DIR ON DIR.direccionId = P.direccionId
INNER JOIN codigosPostales CP ON CP.codigoPostalId = Dir.codigoPostalId
INNER JOIN ciudades C ON C.ciudadId = CP.ciudadId
INNER JOIN estados E ON E.estadoId = C.estadoId
INNER JOIN paises PA ON PA.paisId = E.paisId
INNER JOIN industrias I ON I.industriaId = P.industriaId
INNER JOIN preciosTratamientoXPais PT ON PT.tratamientoId = MR.tratamientoId
INNER JOIN inventarioMateriales IM ON IM.movimientoId = MR.movimientoId
INNER JOIN logVentas V ON V.inventarioID = IM.inventarioID
GROUP BY I.name, D.nombre, PA.nombre, CONVERT(date, MR.fecha), PT.precioXUni, MR.cantidadDes
ORDER BY PA.nombre, I.name, D.nombre, Ganancia DESC