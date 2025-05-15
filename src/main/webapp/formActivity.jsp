<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>
    <c:choose>
      <c:when test="${not empty activity.id}">Editar Actividad</c:when>
      <c:otherwise>Nueva Actividad</c:otherwise>
    </c:choose>
  </title>

  <!-- Bootstrap & FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <!-- Estilo personalizado -->
  <style>
    body {
      background-image: url('Images/conservationActivity.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      background-repeat: no-repeat;
      height: 100vh;
    }

    .container-center {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.30);
      border-radius: 10px;
    }
  </style>
</head>
<body>
  <div class="container-center mt-4">
    <h2>
      <i class="fas fa-leaf"></i>
      <c:choose>
        <c:when test="${not empty activity.id}"> Editar Actividad</c:when>
        <c:otherwise> Nueva Actividad</c:otherwise>
      </c:choose>
    </h2>

    <form action="ConservationActivity" method="post" class="needs-validation" novalidate>
      <c:if test="${not empty activity.id}">
        <input type="hidden" name="id" value="${activity.id}" />
      </c:if>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="description" name="descripcion" value="${activity.description}" required />
        <label for="description">Descripción</label>
        <div class="invalid-feedback">Por favor ingresa una descripción.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="activityType" name="activityType" value="${activity.activityType}" required />
        <label for="activityType">Tipo de Actividad</label>
        <div class="invalid-feedback">Por favor indica el tipo de actividad.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="date" class="form-control" id="date" name="date" value="${activity.date}" required />
        <label for="date">Fecha</label>
        <div class="invalid-feedback">Selecciona una fecha válida.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="responsible" name="responsible" value="${activity.responsible}" required />
        <label for="responsible">Responsable</label>
        <div class="invalid-feedback">Ingresa el nombre del responsable.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="number" class="form-control" id="idZone" name="idZone" value="${activity.idZone}" required />
        <label for="idZone">Zona ID</label>
        <div class="invalid-feedback">Ingresa un ID de zona válido.</div>
      </div>

      <button type="submit" class="btn btn-success">
        <c:choose>
          <c:when test="${not empty activity.id}">Actualizar</c:when>
          <c:otherwise>Guardar</c:otherwise>
        </c:choose>
      </button>

      <button type="button" class="btn btn-danger ms-2" onclick="window.location.href='ConservationActivity'">
        Cancelar
      </button>
    </form>
  </div>
</body>
</html>
