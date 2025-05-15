<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Sistema de Registro Forestal</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
    :root {
      --verde: hsl(111, 52%, 30%);
      --verde-oscuro: hsl(111, 52%, 20%);
      --verde-oscuro-tr: hsla(111, 53%, 20%, 0.534);
      --verde-oscuro-tr-2: hsla(111, 53%, 20%, 0.75);
    }

    body {
      background: linear-gradient(135deg, var(--verde-oscuro-tr) 0%, var(--verde-oscuro-tr-2) 100%);
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: white;
    }

    /* Navbar */
    .navbar-custom {
      background-color: var(--verde);
    }
    .navbar-custom .navbar-brand,
    .navbar-custom .nav-link {
      color: white;
      font-weight: 600;
      transition: color 0.3s ease;
    }
    .navbar-custom .nav-link:hover {
      color: #a9d18e;
    }

    /* Header */
    header {
      padding: 4rem 1rem 2rem;
      text-align: center;
      background: var(--verde-oscuro);
      box-shadow: 0 4px 15px var(--verde-oscuro-tr);
      border-radius: 0 0 1rem 1rem;
      margin-bottom: 3rem;
    }
    header h1 {
      font-size: 3rem;
      margin-bottom: 0.25rem;
      letter-spacing: 0.1em;
    }
    header p {
      font-size: 1.2rem;
      color: #d4edda;
      font-weight: 500;
    }

    /* Cards container */
    .cards-container {
      max-width: 900px;
      margin: 0 auto 4rem;
      display: flex;
      justify-content: center;
      gap: 2rem;
      flex-wrap: wrap;
      padding: 0 1rem;
    }

    /* Individual card */
    .card-custom {
      background: var(--verde-oscuro);
      box-shadow: 0 8px 20px var(--verde-oscuro-tr);
      border-radius: 1rem;
      color: white;
      width: 280px;
      cursor: pointer;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      text-align: center;
      padding: 2rem 1.5rem;
      user-select: none;
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
    }
    .card-custom p {
      font-weight: 400;
      font-size: 0.95rem;
      color: #c7d9b8;
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 1rem 0;
      color: #8cbf81;
      font-size: 0.9rem;
      border-top: 1px solid var(--verde-oscuro-tr);
      margin-top: auto;
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
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">
        <i class="fas fa-tree"></i> Sistema Registro Forestal
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon" style="color: white;"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto fw-semibold">
          <li class="nav-item">
            <a class="nav-link" href="Tree">Lista de Árboles</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ConservationActivity">Actividades de Conservación</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ForestZone">Zonas Forestales</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header>
    <h1>Sistema de Registro Forestal</h1>
    <p>Gestión completa de árboles, actividades y zonas forestales</p>
  </header>

  <!-- Cards para navegación rápida -->
  <main class="cards-container">
    <a href="Tree" class="card-custom text-decoration-none">
      <i class="fas fa-tree"></i>
      <h3>Lista de Árboles</h3>
      <p>Consulta y administra los árboles registrados</p>
    </a>

    <a href="ConservationActivity" class="card-custom text-decoration-none">
      <i class="fas fa-leaf"></i>
      <h3>Actividades de Conservación</h3>
      <p>Visualiza y controla las actividades realizadas</p>
    </a>

    <a href="ForestZone" class="card-custom text-decoration-none">
      <i class="fas fa-map-marker-alt"></i>
      <h3>Zonas Forestales</h3>
      <p>Gestiona las zonas forestales del sistema</p>
    </a>
  </main>

  <!-- Footer -->
  <footer>
    &copy; 2025 Sistema de Registro Forestal 
  </footer>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
