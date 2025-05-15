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
  <%-- T�tulo din�mico: "Editar Zona Forestal" o "Nueva Zona Forestal" --%>
    <title>
      <c:choose>
        <c:when test="${not empty forestZone.id}">Editar Zona Forestal</c:when>
        <c:otherwise>Nueva Zona Forestal</c:otherwise>
      </c:choose>
    </title>
    </head>
    <body>
        <nav>
            <figure class="logo">
              <img src="Images/logo.png" alt="Logo">
            </figure>

            <div class="links">
              <a href="formForestZone.jsp">Zona Forestal</a>
              <a href="formTree.jsp">�rbol</a>
              <a href="formConservationActivity.jsp">Actividad de Conservaci�n</a>
            </div>
          </nav>

            <%-- Encabezado din�mico --%>
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
        <!-- si no hay id, ser� un insert -->
        <c:if test="${empty forestZone.id}">
          <input type="hidden" name="option" value="insert" />
        </c:if>

        <!-- 2) Campos para cada propiedad -->
        <label>Nombre de la Zona</label><br/>
        <input type="text" name="zoneName"
               value="${forestZone.zoneName}" required /><br/><br/>

        <label>Ubicaci�n</label><br/>
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

        <!-- 3) Bot�n con texto seg�n sea insert o update -->
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
      <h2>Cont�ctanos</h2>
      <p>Email: info@registroforestal.ec</p>
      <p>Tel�fono: +593 2 345 6789</p>

      <div class="redesSociales">
        <div class="icono"><a href="#"><img src="Images/facebook.png" alt="Facebook" /></a></div>
        <div class="icono"><a href="#"><img src="Images/Instagram.webp" alt="Instagram" /></a></div>
        <div class="icono"><a href="#"><img src="Images/x.jpg" alt="Twitter" /></a></div>
      </div>
    </div>
  </div>
</footer>

</html>

