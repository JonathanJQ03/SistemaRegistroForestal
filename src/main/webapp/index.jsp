<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Sistema de Registro Forestal</title>

  <link rel="stylesheet" href="CSS/Header_Footer_Style.css" />
  <link rel="stylesheet" href="CSS/forestZone.css" />

  <style>
    :root {
      --verde: hsl(111, 52%, 30%);
      --verde-oscuro: hsl(111, 52%, 20%);
      --verde-oscuro-tr: hsla(111, 53%, 20%, 0.534);
      --verde-oscuro-tr-2: hsla(111, 53%, 20%, 0.75);
    }
    
    header {
    position: sticky;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
    background-color: white;
    color: var(--verde);
    transition: 0.3s all ease-in-out;
}


    body {
        background-image: url('Images/lakeBrackgroundFormTree.jpg');
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
                font-family: Georgia, 'Times New Roman', Times, serif;
    text-align: center;
    height: 85px;
    width: 100%;
    display: flex;
    justify-content: space-around;
}

    nav figure.logo {
    margin-top: -10px;
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
        color: var(--verde);
        font-weight: bold;
        transition: 0.2s all ease-in-out;
    }

    nav a:hover {
        scale: 1.05;
        opacity: 0.7;
        text-decoration: none;
        color: wheat;
    }
    
    
    main section.hero .container {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px;
}

.hero h2{
    color: rgb(43, 85, 8);
    text-shadow: 0 0 10px black;
    font-size: 1.2rem;
}

main section.hero .center {
    background-color: rgba(235, 229, 182, 0.7);
    padding: 50px;
    color: white;
    text-shadow: 0 0 10px black;
    font-size: 1.2rem;
}

.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
}

.typewriter h1 {
    overflow: hidden; /* Ensures the content is not revealed until the animation */
    border-right: .15em solid orange; /* The typwriter cursor */
    white-space: nowrap; /* Keeps the content on a single line */
    margin: 0 auto; /* Gives that scrolling effect as the typing happens */
    letter-spacing: .15em; /* Adjust as needed */
    animation: 
        typing 3.5s steps(40, end),
        blink-caret .75s step-end infinite;
    }

/* The typing effect */
@keyframes typing {
    from { width: 0 }
    to { width: 100% }
}

/* The typewriter cursor effect */
@keyframes blink-caret {
    from, to { border-color: transparent }
    50% { border-color: orange; }
}

main section.hero figure.logo {
    width: 100%;
    display: flex;
    justify-content: center;
    padding-bottom: 50px;
}


    /* Cards container */
    .cards-container {
      max-width: 900px;
      margin: 4rem auto;
      display: flex;
      justify-content: center;
      gap: 2rem;
      flex-wrap: wrap;
      padding: 0 1rem;
    }

    .card-custom {
      background-color: rgba(235, 229, 182, 0.7);
      box-shadow: 0 8px 20px var(--verde-oscuro-tr);
      border-radius: 1rem;
      color: var(--verde-oscuro-tr);
      width: 280px;
      cursor: pointer;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      text-align: center;
      padding: 2rem 1.5rem;
      user-select: none;
      text-decoration: none;
    }

    .card-custom:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 30px var(--verde-oscuro-tr-2);
      background: var(--verde);
    }

    .card-custom i {
      font-size: 3rem;
      margin-bottom: 1rem;
      color: #a9d18e;
    }

    .card-custom h3 {
      font-weight: 700;
      margin-bottom: 0.5rem;
      color: rgb(85, 133, 46)
    }

    .card-custom p {
      font-weight: 400;
      font-size: 0.95rem;
      color: rgb(43, 85, 8);
    }
    
    footer{
    padding: 40px 20px;
    text-align: center;
    background-color: rgba(45, 74, 34, 0.6);
    color: #f4f4f4;
    font-family: Arial, Helvetica, sans-serif;
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

  <!-- TITULO Y SUBTITULO -->
  <main>
      <section class="hero">
    <div class="container">
        <div class="center">
            <figure class="logo">
                <img src="Images/logo.png" height="100" alt="Logo">
            </figure>
            <div class="typewriter">
                <h1>Sistema de Registro Forestal</h1>
                <h2>Gestión completa de árboles, actividades y zonas forestales</h2>
            </div>
        </div>
    </div>
</section>
  </main>
  


  <!-- Cards para navegación rápida -->
  <main class="cards-container">
    <a href="Tree" class="card-custom">
      <i class="fas fa-tree"></i>
      <h3>Lista de Árboles</h3>
      <p>Consulta y administra los árboles registrados</p>
    </a>

    <a href="ConservationActivity" class="card-custom">
      <i class="fas fa-leaf"></i>
      <h3>Actividades de Conservación</h3>
      <p>Visualiza y controla las actividades realizadas</p>
    </a>

    <a href="ForestZone" class="card-custom">
      <i class="fas fa-map-marker-alt"></i>
      <h3>Zonas Forestales</h3>
      <p>Gestiona las zonas forestales del sistema</p>
    </a>
  </main>

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
</body>
</html>
