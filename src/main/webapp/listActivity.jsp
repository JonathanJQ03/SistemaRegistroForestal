<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Actividades</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container mt-4">
        <h1>Listado de Actividades de Conservación</h1>

        <table class="table">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Descripción</th>
                    <th>Tipo de Actividad</th>
                    <th>Fecha</th>
                    <th>Responsable</th>
                    <th>Zona ID</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="activity" items="${activities}">
                    <tr>
                        <td>${activity.id}</td>
                        <td>${activity.description}</td>
                        <td>${activity.activityType}</td>
                        <td>${activity.date}</td>
                        <td>${activity.responsible}</td>
                        <td>${activity.idZone}</td>
                        <td>
                            <a href="ConservationActivity?option=update&id=${activity.id}">Actualizar</a>
                            <a href="ConservationActivity?option=delete&id=${activity.id}"
                               onclick="return confirm('¿Deseas eliminar esta actividad?');">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <p><a href="ConservationActivity?option=new">Agregar Nueva Actividad</a></p>
    </div>
</body>
</html>
