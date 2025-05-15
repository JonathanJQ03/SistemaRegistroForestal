<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistema de Registro Forestal</title>
    <!-- Bootstrap 5.3 from CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-success bg-opacity-10">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">
                <i class="fas fa-tree me-2"></i>Sistema de Registro Forestal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="list.jsp">
                            <i class="fas fa-list me-1"></i> Lista de Árboles
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listActivity.jsp">
                            <i class="fas fa-seedling me-1"></i> Actividades de Conservación
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="formForestZone.jsp">
                            <i class="fas fa-map-marked-alt me-1"></i> Zonas Forestales
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Header -->
    <header class="bg-success text-white py-5">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-3">Sistema de Registro Forestal</h1>
            <p class="lead">Gestión integral de recursos forestales</p>
        </div>
    </header>

    <!-- Main Content - Cards -->
    <main class="container my-5">
        <div class="row g-4 justify-content-center">
            <!-- Card 1 -->
            <div class="col-md-6 col-lg-4">
                <div class="card border-success h-100 shadow-lg hover-effect">
                    <div class="card-body text-center p-4">
                        <div class="icon-container bg-success bg-opacity-10 rounded-circle p-4 d-inline-block mb-3">
                            <i class="fas fa-tree fa-3x text-success"></i>
                        </div>
                        <h3 class="card-title fw-bold">Lista de Árboles</h3>
                        <p class="card-text">Consulta y administra el inventario de árboles registrados en el sistema.</p>
                        <a href="Tree" class="btn btn-success mt-3 stretched-link">
                            <i class="fas fa-arrow-right me-2"></i>Acceder
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Card 2 -->
            <div class="col-md-6 col-lg-4">
                <div class="card border-success h-100 shadow-lg hover-effect">
                    <div class="card-body text-center p-4">
                        <div class="icon-container bg-success bg-opacity-10 rounded-circle p-4 d-inline-block mb-3">
                            <i class="fas fa-seedling fa-3x text-success"></i>
                        </div>
                        <h3 class="card-title fw-bold">Actividades de Conservación</h3>
                        <p class="card-text">Gestiona las actividades de conservación y mantenimiento forestal.</p>
                        <a href="ConservationActivity" class="btn btn-success mt-3 stretched-link">
                            <i class="fas fa-arrow-right me-2"></i>Acceder
                        </a>
                    </div>
                </div>
            </div>
            
            <!-- Card 3 -->
            <div class="col-md-6 col-lg-4">
                <div class="card border-success h-100 shadow-lg hover-effect">
                    <div class="card-body text-center p-4">
                        <div class="icon-container bg-success bg-opacity-10 rounded-circle p-4 d-inline-block mb-3">
                            <i class="fas fa-map-marked-alt fa-3x text-success"></i>
                        </div>
                        <h3 class="card-title fw-bold">Zonas Forestales</h3>
                        <p class="card-text">Visualiza y administra las diferentes zonas forestales registradas.</p>
                        <a href="ForestZone" class="btn btn-success mt-3 stretched-link">
                            <i class="fas fa-arrow-right me-2"></i>Acceder
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-success text-white py-3 mt-auto">
        <div class="container text-center">
            <p class="mb-0">&copy; 2023 Sistema de Registro Forestal. Todos los derechos reservados.</p>
        </div>
    </footer>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>