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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
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
      
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div style="color: red; font-weight: bold; margin-bottom: 10px;"><%= error %></div>
    <% } %>

    <form action="ConservationActivity" method="post" class="needs-validation" novalidate>
      <c:if test="${not empty activity.id}">
        <input type="hidden" name="id" value="${activity.id}" />
      </c:if>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="description" name="description"
               value="${activity.description != null ? activity.description : param.description}" required />
        <label for="description">Descripción</label>
        <div class="invalid-feedback">Por favor ingresa una descripción.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="activityType" name="activityType"
               value="${activity.activityType != null ? activity.activityType : param.activityType}" required />
        <label for="activityType">Tipo de Actividad</label>
        <div class="invalid-feedback">Por favor indica el tipo de actividad.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="date" class="form-control" id="date" name="date"
               value="${activity.date != null ? activity.date : param.date}" required />
        <label for="date">Fecha</label>
        <div class="invalid-feedback">Selecciona una fecha válida.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="responsible" name="responsible"
               value="${activity.responsible != null ? activity.responsible : param.responsible}" required />
        <label for="responsible">Responsable</label>
        <div class="invalid-feedback">Ingresa el nombre del responsable.</div>
      </div>

      <div class="form-floating mb-3">
        <input type="number" class="form-control" id="idZone" name="idZone"
               value="${activity.idZone != null ? activity.idZone : param.idZone}" required />
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

  <!-- Modal de error -->
  <c:if test="${not empty modalError}">
    <div class="modal fade show" id="errorModal" tabindex="-1" style="display: block;" aria-modal="true" role="dialog">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-danger text-white">
            <h5 class="modal-title">Error</h5>
            <button type="button" class="btn-close" onclick="closeModal()"></button>
          </div>
          <div class="modal-body">
            <p>${modalError}</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" onclick="closeModal()">Cerrar</button>
          </div>
        </div>
      </div>
    </div>

    <script>
      function closeModal() {
        document.getElementById('errorModal').style.display = 'none';
        document.querySelector('.modal-backdrop')?.remove();
      }
    </script>
  </c:if>

</body>
</html>
