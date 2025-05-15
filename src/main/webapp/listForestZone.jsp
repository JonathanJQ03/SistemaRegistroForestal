<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <title>Listado de Zonas Forestale</title>
    </head>
    <body>
        <h1>Listado de Zonas Forestales</h1>
        <table class="table">
            <thead class="table-light">
                <tr>
                    <th>ID </th>
                    <th>Nombre </th>
                    <th>Ubicación</th>
                    <th>Superficie (m)</th>
                    <th>Tipo de Zona</th>
                    <th>Fecha de Registro</th>
                </tr>
            </thead>

               <tbody>

                <c:forEach var="forestZone" items="${listForestZones}">
                    <tr>
                        <td>${forestZone.id}</td>
                        <td>${forestZone.zoneName}</td>
                        <td>${forestZone.location}</td>
                        <td>${forestZone.area}</td>
                        <td>${forestZone.zoneType}</td>
                        <td>${forestZone.registerDate}</td>

                        <td>
                            <!--El parametro que cambia a option va desde aquí-->
                            <a href="ForestZone?option=update&id=${forestZone.id}">Actualizar</a>
                            <a href="ForestZone?option=delete&id=${forestZone.id}" 
                               onclick="return confirm('¿Seguro que desea eliminar esta zona forestal?');">Eliminar</a>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="ForestZone?option=new" >Agregar Nueva Zona Forestal</a></p>     
    </body>
</html>
