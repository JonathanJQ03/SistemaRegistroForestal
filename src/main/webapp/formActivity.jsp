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
    
     nav {
    background-color: rgba(59, 108, 53, 0.7);
    font-family: Georgia, 'Times New Roman', Times, serif;
    text-align: center;
    height: 100px;
    width: 100%;
    display: flex;
    justify-content: space-around;
}

    nav figure.logo {
    margin-top: 18px;
    }
    
    nav .links {
    display: flex;
    gap: 30px;
    justify-content: center;
    align-items: center;
    height: 100%;
    }
    
    nav h1 {
    font-size: 2.5rem;
}

    nav a {
        text-decoration: none;
        color: #f4e7d1;
        font-weight: bold;
        transition: 0.2s all ease-in-out;
    }

    nav a:hover {
        scale: 1.05;
        opacity: 0.7;
        text-decoration: none;
        color: wheat;
    }
    
   footer{
    padding: 40px 20px;
    text-align: center;
    background-color: rgba(45, 74, 34, 0.6);
    color: #f4f4f4;
    font-family: Georgia, 'Times New Roman', Times, serif;
}

.infoFooter {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}

.logoFooter, .infoDerecha {
    flex: 1;
    margin: 20px;
}

.fotoFooter {
    width: 150px;
    margin-bottom: 20px;
    background-color: #f4e7d1;
    padding: 10px;
    border-radius: 10px;
}

footer p {
    font-size: 14px;
    margin: 10px;
    color: #d1d1d1;
}

footer h2 {
    font-size: 24px;
    color: #f4e7d1;
    margin-bottom: 10px;
}

footer a {
    color: #f4e7d1;
    text-decoration: none;
}

footer .redesSociales {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

footer .icono {
    margin: 0 10px;
}

footer .icono img {
    width: 25px;
    height: 25px;
    border-radius: 10px;

}

footer .icono:hover img {
    transform: scale(1.1);
    transition: transform 0.3s ease;
}

    @media (max-width: 600px) {
      .cards-container {
        flex-direction: column;
        align-items: center;
      }

      .card-custom {
        width: 90%;
      }
    }
  </style>
  
    <!-- FontAwesome for icons -->
  <link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    rel="stylesheet"
  />
</head>
<body>
                 <!-- HEADER -->
  <nav>
        <a href="index.jsp">
           <figure class="logo">
              <img src="Images/logo.png" alt="Logo" height="60">
            </figure> 
        </a>

      <div class="links">
        <a href="ForestZone">Zonas Forestales</a>
        <a href="Tree">Lista de Árboles</a>
        <a href="ConservationActivity">Actividades</a>
      </div>
    </nav>
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

<footer>
    <section class="infoFooter">
        <section class="logoFooter">
            <img src="Images/logo.png" alt="logo" class="fotoFooter">
            <h2>Sistema de Registro Forestal</h2>
            <p> <i class="fa-solid fa-map-pin"></i> Quito - Ecuador </p>
            <p> <i class="fa-solid fa-phone"></i> +593 998765412</p>
            <p><i class="fa-solid fa-envelope"></i><a href="mailto:forestzone@system.com">forestzone@system.com</a></p>
        </section>
        <section class="infoDerecha">
            <section class="redesSociales">
                <a href="https://www.facebook.com/?locale=es_LA" class="icono"><img src="Images/facebook.png" alt="Facebook" ></a>
                <a href="https://www.instagram.com/" class="icono"><img src="Images/Instagram.webp" alt="Ig" ></a>
                <a href="https://twitter.com/?lang=es" class="icono"><img src="Images/x.jpg" alt="X" ></a>
            </section>  
            &copy; Forest Zone
            <p><i class="fa-solid fa-people-group"></i>Hecho por el Grupo 3</p>              
        </section>
    </section>
</footer>
</html>
