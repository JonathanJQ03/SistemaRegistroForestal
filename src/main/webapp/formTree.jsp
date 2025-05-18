<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>
            <c:choose>
                <c:when test="${not empty tree.id}">Editar Árbol</c:when>
                <c:otherwise>Nuevo Árbol</c:otherwise>
            </c:choose>
        </title>

        <!-- Bootstrap CSS y JS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              rel="stylesheet"/>

        <!-- Script de validaciones -->
        <script src="JS/validationsTree.js"></script>

        <style>
            :root {
                --verde: hsl(111, 52%, 30%);
                --verde-oscuro: hsl(111, 52%, 20%);
            }
            body {
                background: url('Images/lakeBrackgroundFormTree.jpg') center/cover no-repeat fixed;
                min-height: 100vh;
                font-family: Georgia, 'Times New Roman', Times, serif;
                color: white;
                display: flex;
                flex-direction: column;
            }
            nav {
                background-color: rgba(59,108,53,0.7);
                height: 100px;
                display: flex;
                justify-content: space-around;
                align-items: center;
                font-family: Georgia, 'Times New Roman', Times, serif;
                color: #f4e7d1;
            }
            nav a {
                text-decoration: none;
                color: #f4e7d1;
                font-weight: bold;
                transition: 0.2s;
            }
            nav a:hover {
                opacity: 0.7;
            }
            .form-container {
                background-color: rgba(45,74,34,0.85);
                border-radius: 15px;
                padding: 2rem;
                margin: 2rem auto;
                max-width: 700px;
                box-shadow: 0 0 20px rgba(0,0,0,0.5);
            }
            .error-message {
                color: #ffcccc;
                font-size: .875em;
                margin-top: .25rem;
            }
            footer {
                padding: 40px 20px;
                background-color: rgba(45,74,34,0.6);
                color: #f4f4f4;
                font-family: Georgia, 'Times New Roman', Times, serif;
                margin-top: auto;
            }
        </style>
    </head>
    <body>
        <!-- NAVBAR -->
        <nav>
            <a href="index.jsp">
                <img src="Images/logo.png" alt="Logo" height="60">
            </a>
            <div>
                <a href="ForestZone">Zonas Forestales</a>
                <a href="Tree">Lista de Árboles</a>
                <a href="ConservationActivity">Actividades</a>
            </div>
        </nav>

        <!-- FORMULARIO -->
        <div class="container">
            <div class="form-container">
                <h2 class="text-center mb-4">
                    <i class="fas fa-tree"></i>
                    <c:choose>
                        <c:when test="${not empty tree.id}"> Editar Árbol</c:when>
                        <c:otherwise> Nuevo Árbol</c:otherwise>
                    </c:choose>
                </h2>

                <form id="treeForm" action="${pageContext.request.contextPath}/Tree" method="post" class="needs-validation" novalidate>
                    <!-- Para edición -->
                    <c:if test="${not empty tree.id}">
                        <input type="hidden" name="id" value="${tree.id}" />
                    </c:if>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="species" name="species"
                               value="${tree.species}"
                               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$" required>
                        <label for="species">Especie*</label>
                        <div class="invalid-feedback">Especie válida (solo letras y espacios).</div>
                        <div id="speciesError" class="error-message"></div>
                    </div>
                    <div class="form-floating mb-3">
                        <select class="form-select" id="idZone" name="idZone" required>
                            <option value="">-- Selecciona Zona --</option>
                            <c:forEach var="zone" items="${listZones}">
                                <option value="${zone.id}"
                                        ${tree != null && tree.idZone == zone.id ? 'selected' : ''}>
                                    ${zone.name}
                                </option>
                            </c:forEach>
                        </select>
                        <label for="idZone">Zona*</label>
                        <div class="invalid-feedback">Debes seleccionar una zona.</div>
                        <div id="idZoneError" class="error-message"></div>
                    </div>


                    <div class="form-floating mb-3">
                        <input type="number" step="0.10" class="form-control" id="height" name="height"
                               value="${tree.height}" min="0.10" max="115.72" required>
                        <label for="height">Altura (m)*</label>
                        <div class="invalid-feedback">Altura entre 0.1 y 115.72 metros.</div>
                        <div id="heightError" class="error-message"></div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="age" name="age"
                               value="${tree.age}" min="1" max="4850" required>
                        <label for="age">Edad (años)*</label>
                        <div class="invalid-feedback">Edad entre 1 y 4,850 años.</div>
                        <div id="ageError" class="error-message"></div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="location" name="location"
                               value="${tree.location}"
                               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s\.,\-]+$">
                        <label for="location">Ubicación</label>
                        <div class="invalid-feedback">Ubicación: letras, números, espacios, puntos, comas y guiones.</div>
                        <div id="locationError" class="error-message"></div>
                    </div>

                    <div class="form-floating mb-3">
                        <textarea class="form-control" id="description" name="description" rows="3">${tree.description}</textarea>
                        <label for="description">Descripción</label>
                        <div class="invalid-feedback">Descripción no válida.</div>
                        <div id="descriptionError" class="error-message"></div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="scientificName" name="scientificName"
                               value="${tree.scientificName}"
                               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s\.]+$">
                        <label for="scientificName">Nombre Científico</label>
                        <div class="invalid-feedback">Solo letras, espacios y puntos.</div>
                        <div id="scientificNameError" class="error-message"></div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="origin" name="origin"
                               value="${tree.origin}"
                               pattern="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$">
                        <label for="origin">Origen</label>
                        <div class="invalid-feedback">Solo letras y espacios.</div>
                        <div id="originError" class="error-message"></div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="plantedDate" name="plantedDate"
                               value="${tree.plantedDate}"
                               max="<%= java.time.LocalDate.now().toString() %>">
                        <label for="plantedDate">Fecha de Plantación</label>
                        <div class="invalid-feedback">La fecha no puede ser futura.</div>
                        <div id="plantedDateError" class="error-message"></div>
                    </div>

                    <div class="d-flex justify-content-center gap-3">
                        <button type="submit" class="btn btn-success">
                            <c:choose>
                                <c:when test="${not empty tree.id}">Actualizar</c:when>
                                <c:otherwise>Guardar</c:otherwise>
                            </c:choose>
                        </button>
                        <button type="button" class="btn btn-danger" onclick="window.location.href = 'Tree'">
                            Cancelar
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- FOOTER -->
        <footer>
            <div class="d-flex flex-wrap justify-content-between align-items-center">
                <div class="text-center mb-3">
                    <img src="Images/logo.png" alt="logo" style="width:150px" class="mb-2 rounded">
                    <h2>Sistema de Registro Forestal</h2>
                    <p><i class="fa-solid fa-map-pin"></i> Quito - Ecuador</p>
                    <p><i class="fa-solid fa-phone"></i> +593 998765412</p>
                    <p><i class="fa-solid fa-envelope"></i>
                        <a href="mailto:forestzone@system.com" class="text-light">forestzone@system.com</a>
                    </p>
                </div>
                <div class="text-center mb-3">
                    <div class="mb-2">
                        <a href="https://www.facebook.com/?locale=es_LA" class="mx-2"><i class="fab fa-facebook fa-2x"></i></a>
                        <a href="https://www.instagram.com/" class="mx-2"><i class="fab fa-instagram fa-2x"></i></a>
                        <a href="https://twitter.com/?lang=es" class="mx-2"><i class="fab fa-x-twitter fa-2x"></i></a>
                    </div>
                    <p>&copy; Forest Zone — Hecho por el Grupo 3</p>
                </div>
            </div>
        </footer>
        <script>
            console.log('validationsTree.js cargado');
        </script>
        <script src="${pageContext.request.contextPath}/JS/validationsTree.js"></script>

    </body>
</html>
