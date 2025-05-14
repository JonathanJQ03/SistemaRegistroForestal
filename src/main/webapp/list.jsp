<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <title>Listado de Árboles</title>
    </head>
    <body>
        <h1>Listado de Árboles</h1>
        <table class="table">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Especie</th>
                    <th>Altura (m)</th>
                    <th>Edad (años)</th>
                    <th>Ubicación</th>
                    <th>Descripción</th>
                    <th>Nombre Científico</th>
                    <th>Origen</th>
                    <th>Fecha de Plantación</th>
                    <th>Acciones</th>
                </tr>
            </thead>

               <tbody>

                <c:forEach var="tree" items="${listTrees}">
                    <tr>
                        <td>${tree.id}</td>
                        <td>${tree.species}</td>
                        <td>${tree.height}</td>
                        <td>${tree.age}</td>
                        <td>${tree.location}</td>
                        <td>${tree.description}</td>
                        <td>${tree.scientificName}</td>
                        <td>${tree.origin}</td>
                        <td>${tree.plantedDate}</td>
                        <td>
                            <!--El parametro que cambia a option va desde aquí-->
                            <a href="Tree?option=update&id=${tree.id}">Actualizar</a>
                            <a href="Tree?option=delete&id=${tree.id}" 
                               onclick="return confirm('¿Seguro que desea eliminar este árbol?');">Eliminar</a>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="Tree?option=new" >Agregar Nuevo Árbol</a></p>     
    </body>
</html>
