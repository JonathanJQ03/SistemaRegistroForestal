<%-- 
    Document   : formForestZone
    Created on : May 13, 2025, 10:48:14 AM
    Author     : Stefy^^
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
  <%-- Título dinámico: "Editar Zona Forestal" o "Nueva Zona Forestal" --%>
    <title>
      <c:choose>
        <c:when test="${not empty forestZone.id}">Editar Zona Forestal</c:when>
        <c:otherwise>Nueva Zona Forestal</c:otherwise>
      </c:choose>
    </title>
    </head>
    <body>
            <%-- Encabezado dinámico --%>
      <h2>
        <c:choose>
          <c:when test="${not empty forestZone.id}">Editar zona Forestal</c:when>
          <c:otherwise>Nueva zona Forestal</c:otherwise>
        </c:choose>
      </h2>
    <!-- indicaremos el controlador que disparamemos cuando usemos el boton de guardar de modo que 
        esto solo es disponible dentro de mi form-->
      <form action="ZonaForestal" method="post">
        <!-- 1) Hidden para el id, si estamos editando -->
        <c:if test="${not empty forestZone.id}">
          <input type="hidden" name="option" value="update" />
          <input type="hidden" name="id" value="${forestZone.id}" />
        </c:if>
        <!-- si no hay id, será un insert -->
        <c:if test="${empty forestZone.id}">
          <input type="hidden" name="option" value="insert" />
        </c:if>

        <!-- 2) Campos para cada propiedad -->
        <label>Nombre de la Zona</label><br/>
        <input type="text" name="zoneName"
               value="${forestZone.zoneName}" required /><br/><br/>

        <label>Ubicación</label><br/>
        <input type="number" step="0.01" name="location"
               value="${forestZone.location}" required /><br/><br/>

        <label>Superficie:</label><br/>
        <input type="number" name="area"
               value="${forestZone.area}" required /><br/><br/>

        <label>Tipo de Zona:</label><br/>
        <input type="text" name="zoneType"
               value="${forestZone.zoneType}" /><br/><br/>

        <label>Fecha de Registro:</label><br/>
        <input type="date" name="registerDate"
               value="${forestZone.registerDate}" /><br/><br/>

        <!-- 3) Botón con texto según sea insert o update -->
        <button type="submit">
          <c:choose>
            <c:when test="${not empty forestZone.id}">Actualizar</c:when>
            <c:otherwise>Guardar</c:otherwise>
          </c:choose>
        </button>
      </form>

      <p><a href="ForestZone">Volver al listado de Zonas Forestales</a></p>
    </body>
</html>
