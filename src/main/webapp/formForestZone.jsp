<%-- 
    Document   : formForestZone
    Created on : May 14, 2025, 7:31:43 PM
    Author     : Stefy^^
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="CSS/forestZone.css">
        <link rel="stylesheet" href="Header_Footer_Style.css">

  <%-- Título dinámico: "Editar Zona Forestal" o "Nueva Zona Forestal" --%>
    <title>
      <c:choose>
        <c:when test="${not empty forestZone.id}">Editar Zona Forestal</c:when>
        <c:otherwise>Nueva Zona Forestal</c:otherwise>
      </c:choose>
    </title>
    <style>

.titulo {
  text-align: center;
  color: var(--verde);
  margin-bottom: 30px;
    background-color: rgba(240, 233, 175, 0.8);
      border-radius: 10px;

}

form {
    color: var(--verde);
    background-color: rgba(240, 233, 175, 0.8);
  padding: 25px 40px;
  margin: 0 auto;
  width: 100%;
  max-width: 500px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

label {
  display: block;
  margin-bottom: 6px;
  font-weight: bold;
  margin-top: 15px;
}

input[type="text"],
input[type="number"],
input[type="date"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
  box-sizing: border-box;
}

button {
  margin-top: 20px;
  width: 100%;
  padding: 12px;
  background-color: #2ecc71;
  color: white;
  font-size: 16px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  background-color: var(--verde-oscuro);
}

button:hover {
  background-color: var(--verde);
}

p {
  text-align: center;
  margin-top: 20px;
}

a {
  color: #3498db;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

    :root {
      --verde: hsl(111, 52%, 30%);
      --verde-oscuro: hsl(111, 52%, 20%);
      --verde-oscuro-tr: hsla(111, 53%, 20%, 0.534);
      --verde-oscuro-tr-2: hsla(111, 53%, 20%, 0.75);
    }
    
    body {
        background-image: url('Images/formForestZone.jpg');
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
    
    .boton-volver {
  display: inline-block;
  margin-top: 20px;
  padding: 12px 20px;
  background-color: #68975a;
  color: white;
  font-size: 16px;
  text-align: center;
  border-radius: 6px;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.boton-volver:hover {
  background-color: #2980b9;
  text-decoration: none;
}


    </style>
    
      <!-- FontAwesome for icons -->
  <link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    rel="stylesheet"
  />

    </head>
    <body>
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

        <%-- Encabezado dinámico --%>
       
        <h2 class="titulo">
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
            <input type="text" step="0.01" name="location"
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

        <p><a href="ForestZone" class="boton-volver">Volver al listado de Zonas Forestales</a></p>
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

