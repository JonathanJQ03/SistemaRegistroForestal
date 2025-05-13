<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <%-- Título dinámico: "Editar Árbol" o "Nuevo Árbol" --%>
  <title>
    <c:choose>
      <c:when test="${not empty tree.id}">Editar Árbol</c:when>
      <c:otherwise>Nuevo Árbol</c:otherwise>
    </c:choose>
  </title>
</head>
<body>
  <%-- Encabezado dinámico --%>
  <h2>
    <c:choose>
      <c:when test="${not empty tree.id}">Editar Árbol</c:when>
      <c:otherwise>Nuevo Árbol</c:otherwise>
    </c:choose>
  </h2>
<!-- indicaremos el controlador que disparamemos cuando usemos el boton de guardar de modo que 
    esto solo es disponible dentro de mi form-->
  <form action="Tree" method="post">
    <!-- 1) Hidden para el id, si estamos editando -->
    <c:if test="${not empty tree.id}">
      <input type="hidden" name="option" value="update" />
      <input type="hidden" name="id" value="${tree.id}" />
    </c:if>
    <!-- si no hay id, será un insert -->
    <c:if test="${empty tree.id}">
      <input type="hidden" name="option" value="insert" />
    </c:if>

    <!-- 2) Campos para cada propiedad -->
    <label>Especie:</label><br/>
    <input type="text" name="species"
           value="${tree.species}" required /><br/><br/>

    <label>Altura (m):</label><br/>
    <input type="number" step="0.01" name="height"
           value="${tree.height}" required /><br/><br/>

    <label>Edad (años):</label><br/>
    <input type="number" name="age"
           value="${tree.age}" required /><br/><br/>

    <label>Ubicación:</label><br/>
    <input type="text" name="location"
           value="${tree.location}" /><br/><br/>

    <label>Descripción:</label><br/>
    <textarea name="description" rows="3" cols="30">${tree.description}</textarea><br/><br/>

    <label>Nombre Científico:</label><br/>
    <input type="text" name="scientificName"
           value="${tree.scientificName}" /><br/><br/>

    <label>Origen:</label><br/>
    <input type="text" name="origin"
           value="${tree.origin}" /><br/><br/>

    <label>Fecha de Plantación:</label><br/>
    <input type="date" name="plantedDate"
           value="${tree.plantedDate}" /><br/><br/>

    <!-- 3) Botón con texto según sea insert o update -->
    <button type="submit">
      <c:choose>
        <c:when test="${not empty tree.id}">Actualizar</c:when>
        <c:otherwise>Guardar</c:otherwise>
      </c:choose>
    </button>
  </form>

  <p><a href="Tree">Volver al listado de árboles</a></p>
</body>
</html>
