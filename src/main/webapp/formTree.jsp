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
      background-size: cover;  /* Asegura que la imagen cubra todo el body */
      background-position: center; /* Centra la imagen */
      background-attachment: fixed; /* Fija la imagen para que no se desplace al hacer scroll */
      background-repeat: no-repeat; /* Evita que la imagen se repita */
      height: 100vh; /* Hace que el body ocupe toda la altura de la ventana */
    }

    .container-center {
      max-width: 800px; /* Limita el ancho máximo */
      margin: 0 auto; /* Centra el contenido */
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.30); /* Fondo blanco con opacidad para mejorar la visibilidad del texto */
      border-radius: 10px; /* Bordes redondeados */
    }
  </style>
</head>
<body>
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
    <form action="Tree" method="post" class="needs-validation" novalidate>
      <!-- Hidden para option e id -->
      <c:if test="${not empty tree.id}">
        <input type="hidden" name="option" value="update" />
        <input type="hidden" name="id" value="${tree.id}" />
      </c:if>
      <c:if test="${empty tree.id}">
        <input type="hidden" name="option" value="insert" />
      </c:if>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="species" name="species" value="${tree.species}" required />
        <label for="species">Especie</label>
        <div class="invalid-feedback">
          Por favor ingresa la especie.
        </div>
      </div>

      <div class="form-floating mb-3">
        <input type="number" step="0.01" class="form-control" id="height" name="height" value="${tree.height}" required />
        <label for="height">Altura (m)</label>
        <div class="invalid-feedback">
          Ingresa una altura válida.
        </div>
      </div>

      <div class="form-floating mb-3">
        <input type="number" class="form-control" id="age" name="age" value="${tree.age}" required />
        <label for="age">Edad (años)</label>
        <div class="invalid-feedback">
          Ingresa la edad.
        </div>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="location" name="location" value="${tree.location}" />
        <label for="location">Ubicación</label>
      </div>

      <div class="form-floating mb-3">
        <textarea class="form-control" id="description" name="description" rows="3">${tree.description}</textarea>
        <label for="description">Descripción</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="scientificName" name="scientificName" value="${tree.scientificName}" />
        <label for="scientificName">Nombre Científico</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="origin" name="origin" value="${tree.origin}" />
        <label for="origin">Origen</label>
      </div>

      <div class="form-floating mb-3">
        <input type="date" class="form-control" id="plantedDate" name="plantedDate" value="${tree.plantedDate}" />
        <label for="plantedDate">Fecha de Plantación</label>
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
</body>
</html>
