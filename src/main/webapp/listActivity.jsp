<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Actividades</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <style>
    :root {
      --verde: hsl(111, 52%, 30%);
      --verde-oscuro: hsl(111, 52%, 20%);
      --verde-oscuro-tr: hsla(111, 53%, 20%, 0.534);
      --verde-oscuro-tr-2: hsla(111, 53%, 20%, 0.75);
    }
    
    body {
        background-image: url('Images/listActivity.jpg');
        background-size: cover;  /* Asegura que la imagen cubra todo el body */
        background-position: center; /* Centra la imagen */
        background-attachment: fixed; /* Fija la imagen para que no se desplace al hacer scroll */
        background-repeat: no-repeat; /* Evita que la imagen se repita */
        height: 100vh;
        font-family: Georgia, 'Times New Roman', Times, serif;
        color: white;
        display: flex;
        flex-direction: column;
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
    
       .text-success{
        background-color:rgba(235, 229, 182, 0.7);
        border-radius: 10px;
        margin: 10px
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
<div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="text-success" >
            <i class="fas fa-leaf me-2";
"></i>Listado de Actividades de Conservación
        </h1>
        <a href="ForestZone?option=new" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Nueva Actividad
        </a>
    </div>
    
    <!-- Tabla -->
    <div class="card shadow-sm border-success">
        <div class="card-header bg-success text-white">
            <i class="fas fa-list me-1"></i> Registros de Actividades
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-success">
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
                                <td><strong>${activity.description}</strong></td>
                                <td>${activity.activityType}</td>
                                <td>${activity.date}</td>
                                <td>${activity.responsible}</td>
                                <td>${activity.idZone}</td>
                                <td class="action-btns">
                                    <div class="d-flex flex-column gap-2">
                                        <a href="ForestZone?option=update&id=${activity.id}" 
                                           class="btn btn-sm btn-outline-success">
                                            <i class="fas fa-edit me-1"></i> Editar
                                        </a>
                                        <a href="ForestZone?option=delete&id=${activity.id}" 
                                           class="btn btn-sm btn-outline-danger"
                                           onclick="return confirm('¿Seguro que desea eliminar esta actividad?');">
                                            <i class="fas fa-trash-alt me-1"></i> Eliminar
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
<!-- FOOTER -->
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
