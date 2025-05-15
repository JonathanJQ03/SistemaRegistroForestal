<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
  <%-- Título dinámico: "Editar Árbol" o "Nuevo Árbol" --%>
  <title>
    <c:choose>
      <c:when test="${not empty tree.id}">Editar Árbol</c:when>
      <c:otherwise>Nuevo Árbol</c:otherwise>
    </c:choose>
  </title>

  <style>
    body {
      background-image: url('Images/lakeBrackgroundFormTree.jpg');
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
    
    .error-message {
      color: rgb(0, 0, 0);
      font-size: 0.875em;
      margin-top: 0.25rem;
    }
  </style>
</head>
<body>
  <!-- Modal de Error -->
  <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title" id="errorModalLabel">Error de Validación</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p id="modalErrorMessage">Por favor complete todos los campos requeridos correctamente.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="container-center">
    <!-- Encabezado dinámico -->
    <h2>
       <c:choose>
      <c:when test="${not empty tree.id}">
        <i class="fas fa-tree"></i> Editar Árbol
      </c:when>
      <c:otherwise>
        <i class="fas fa-tree"></i> Nuevo Árbol
      </c:otherwise>
    </c:choose>
    </h2>

    <!-- Formulario con Floating Labels -->
    <form id="treeForm" action="Tree" method="post" class="needs-validation" novalidate>
      <!-- Hidden para option e id -->
      <c:if test="${not empty tree.id}">
        <input type="hidden" name="option" value="update" />
        <input type="hidden" name="id" value="${tree.id}" />
      </c:if>
      <c:if test="${empty tree.id}">
        <input type="hidden" name="option" value="insert" />
      </c:if>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="species" name="species" 
               value="${tree.species}" 
               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" 
               required />
        <label for="species">Especie*</label>
        <div class="invalid-feedback">
          Por favor ingresa una especie válida (solo letras y espacios).
        </div>
        <div id="speciesError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <input type="number" step="0.01" class="form-control" id="height" name="height" 
               value="${tree.height}" 
               min="0.1" max="150" 
               required />
        <label for="height">Altura (m)*</label>
        <div class="invalid-feedback">
          Ingresa una altura válida (entre 0.1 y 150 metros).
        </div>
        <div id="heightError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <input type="number" class="form-control" id="age" name="age" 
               value="${tree.age}" 
               min="1" max="5000" 
               required />
        <label for="age">Edad (años)*</label>
        <div class="invalid-feedback">
          Ingresa una edad válida (entre 1 y 5000 años).
        </div>
        <div id="ageError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="location" name="location" 
               value="${tree.location}" 
               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s\.,-]+$" />
        <label for="location">Ubicación</label>
        <div class="invalid-feedback">
          Ingresa una ubicación válida (letras, números, espacios y caracteres básicos).
        </div>
        <div id="locationError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <textarea class="form-control" id="description" name="description" 
                  rows="3" 
                  pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s\.,;:!?()-]+$">${tree.description}</textarea>
        <label for="description">Descripción</label>
        <div class="invalid-feedback">
          Ingresa una descripción válida (solo caracteres permitidos).
        </div>
        <div id="descriptionError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="scientificName" name="scientificName" 
               value="${tree.scientificName}" 
               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" />
        <label for="scientificName">Nombre Científico</label>
        <div class="invalid-feedback">
          Ingresa un nombre científico válido (solo letras y espacios).
        </div>
        <div id="scientificNameError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="origin" name="origin" 
               value="${tree.origin}" 
               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" />
        <label for="origin">Origen</label>
        <div class="invalid-feedback">
          Ingresa un origen válido (solo letras y espacios).
        </div>
        <div id="originError" class="error-message"></div>
      </div>

      <div class="form-floating mb-3">
        <input type="date" class="form-control" id="plantedDate" name="plantedDate" 
               value="${tree.plantedDate}" 
               max="<%= java.time.LocalDate.now().toString() %>" />
        <label for="plantedDate">Fecha de Plantación</label>
        <div class="invalid-feedback">
          La fecha no puede ser futura.
        </div>
        <div id="plantedDateError" class="error-message"></div>
      </div>

      <!-- Botón Guardar -->
      <button type="submit" class="btn btn-success">
        <c:choose>
          <c:when test="${not empty tree.id}">Actualizar</c:when>
          <c:otherwise>Guardar</c:otherwise>
        </c:choose>
      </button>

      <!-- Botón Cancelar -->
      <button type="button" class="btn btn-danger ms-2" onclick="window.location.href='Tree'">
        Cancelar
      </button>
    </form>
  </div>

  <script>
    // Validación del formulario antes de enviar
    document.getElementById('treeForm').addEventListener('submit', function(event) {
      event.preventDefault();
      
      // Reiniciar mensajes de error
      clearErrorMessages();
      
      // Validar campos
      let isValid = validateForm();
      
      if (isValid) {
        // Si es válido, enviar el formulario
        this.submit();
      } else {
        // Mostrar modal de error
        const errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
        errorModal.show();
      }
    });
    
    // Función para limpiar mensajes de error
    function clearErrorMessages() {
      const errorElements = document.querySelectorAll('.error-message');
      errorElements.forEach(element => {
        element.textContent = '';
      });
    }
    
    // Función para validar el formulario
    function validateForm() {
      let isValid = true;
      
      // Validar especie (requerido, solo letras y espacios)
      const speciesInput = document.getElementById('species');
      if (!speciesInput.value.trim() || !speciesInput.checkValidity()) {
        document.getElementById('speciesError').textContent = 
          'La especie es requerida y solo puede contener letras y espacios.';
        isValid = false;
      }
      
      // Validar altura (requerido, entre 0.1 y 150)
      const heightInput = document.getElementById('height');
      if (!heightInput.value || parseFloat(heightInput.value) < 0.1 || parseFloat(heightInput.value) > 150) {
        document.getElementById('heightError').textContent = 
          'La altura es requerida y debe estar entre 0.1 y 150 metros.';
        isValid = false;
      }
      
      // Validar edad (requerido, entre 1 y 5000)
      const ageInput = document.getElementById('age');
      if (!ageInput.value || parseInt(ageInput.value) < 1 || parseInt(ageInput.value) > 5000) {
        document.getElementById('ageError').textContent = 
          'La edad es requerida y debe estar entre 1 y 5000 años.';
        isValid = false;
      }
      
      // Validar ubicación (opcional, pero si tiene contenido debe ser válido)
      const locationInput = document.getElementById('location');
      if (locationInput.value.trim() && !locationInput.checkValidity()) {
        document.getElementById('locationError').textContent = 
          'La ubicación solo puede contener letras, números, espacios y caracteres básicos.';
        isValid = false;
      }
      
      // Validar descripción (opcional, pero si tiene contenido debe ser válido)
      const descriptionInput = document.getElementById('description');
      if (descriptionInput.value.trim() && !descriptionInput.checkValidity()) {
        document.getElementById('descriptionError').textContent = 
          'La descripción contiene caracteres no permitidos.';
        isValid = false;
      }
      
      // Validar nombre científico (opcional, pero si tiene contenido debe ser válido)
      const scientificNameInput = document.getElementById('scientificName');
      if (scientificNameInput.value.trim() && !scientificNameInput.checkValidity()) {
        document.getElementById('scientificNameError').textContent = 
          'El nombre científico solo puede contener letras y espacios.';
        isValid = false;
      }
      
      // Validar origen (opcional, pero si tiene contenido debe ser válido)
      const originInput = document.getElementById('origin');
      if (originInput.value.trim() && !originInput.checkValidity()) {
        document.getElementById('originError').textContent = 
          'El origen solo puede contener letras y espacios.';
        isValid = false;
      }
      
      // Validar fecha de plantación (opcional, pero si tiene contenido debe ser válido)
      const plantedDateInput = document.getElementById('plantedDate');
      if (plantedDateInput.value) {
        const today = new Date();
        const plantedDate = new Date(plantedDateInput.value);
        if (plantedDate > today) {
          document.getElementById('plantedDateError').textContent = 
            'La fecha de plantación no puede ser futura.';
          isValid = false;
        }
      }
      
      return isValid;
    }
    
    // Validación en tiempo real para campos de texto
    document.querySelectorAll('input[type="text"], textarea').forEach(input => {
      input.addEventListener('input', function() {
        if (this.value.trim() && !this.checkValidity()) {
          const errorId = this.id + 'Error';
          document.getElementById(errorId).textContent = 
            'Por favor ingresa un valor válido según las reglas de validación.';
        } else {
          document.getElementById(this.id + 'Error').textContent = '';
        }
      });
    });
    
    // Validación en tiempo real para campos numéricos
    document.querySelectorAll('input[type="number"]').forEach(input => {
      input.addEventListener('input', function() {
        if (this.value && !this.checkValidity()) {
          const errorId = this.id + 'Error';
          document.getElementById(errorId).textContent = 
            'Por favor ingresa un valor válido dentro del rango permitido.';
        } else {
          document.getElementById(this.id + 'Error').textContent = '';
        }
      });
    });
    
    // Validación en tiempo real para fecha
    document.getElementById('plantedDate').addEventListener('change', function() {
      if (this.value) {
        const today = new Date();
        const plantedDate = new Date(this.value);
        if (plantedDate > today) {
          document.getElementById('plantedDateError').textContent = 
            'La fecha de plantación no puede ser futura.';
        } else {
          document.getElementById('plantedDateError').textContent = '';
        }
      }
    });
  </script>
</body>
</html>