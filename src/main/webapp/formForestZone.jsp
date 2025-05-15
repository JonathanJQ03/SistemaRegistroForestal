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
        body {
  font-family: Arial, sans-serif;
  background-color: #f4f7f8;
  color: #333;
  padding: 30px;
}

h2 {
  text-align: center;
  color: #2c3e50;
  margin-bottom: 30px;
}

form {
  background: #fff;
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
}

button:hover {
  background-color: #27ae60;
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

    </style>
    </head>
    <body>
        <nav>
            <figure class="logo">
              <img src="Images/logo.png" alt="Logo">
            </figure>

            <div class="links">
              <a href="formForestZone.jsp">Zona Forestal</a>
              <a href="formTree.jsp">Árbol</a>
              <a href="formConservationActivity.jsp">Actividad de Conservación</a>
            </div>
          </nav>

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
    <footer>
  <div class="infoFooter">
    <div class="logoFooter">
      <img src="Images/logo.png" alt="Logo" class="fotoFooter" />
      <p>&copy; 2025 Sistema de Registro Forestal</p>
    </div>
    <div class="infoDerecha">
      <h2>Contáctanos</h2>
      <p>Email: info@registroforestal.ec</p>
      <p>Teléfono: +593 2 345 6789</p>

      <div class="redesSociales">
        <div class="icono"><a href="#"><img src="Images/facebook.png" alt="Facebook" /></a></div>
        <div class="icono"><a href="#"><img src="Images/Instagram.webp" alt="Instagram" /></a></div>
        <div class="icono"><a href="#"><img src="Images/x.jpg" alt="Twitter" /></a></div>
      </div>
    </div>
  </div>
</footer>

</html>

