<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Listado de Árboles</title>
        <!-- Bootstrap 5.3 from CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome for icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .tree-img {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 4px;
            }
            .action-btns .btn {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
            }
        </style>
    </head>
    <body class="bg-success bg-opacity-10">
        <div class="container py-5">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="text-success">
                    <i class="fas fa-tree me-2"></i>Listado de Árboles
                </h1>
                <a href="Tree?option=new" class="btn btn-success">
                    <i class="fas fa-plus me-1"></i> Nuevo Árbol
                </a>
            </div>

            <!-- Table -->
            <div class="card shadow-sm border-success">
                <div class="card-header bg-success text-white">
                    <i class="fas fa-list me-1"></i> Registros de Árboles
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-success">
                                <tr>
                                    <th width="100px">Imagen</th>
                                    <th>Especie</th>
                                    <th>Detalles</th>
                                    <th>Información</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tree" items="${listTrees}">
                                    <tr>
                                        <td>
                                            <c:choose>
                                                <%-- Generar nombre de imagen basado en el ID --%>
                                                <c:when test="${not empty tree.id}">
                                                    <img src="Images/tree_${tree.id}.jpeg" 
                                                         onerror="this.src='Images/arbolDefault.jpg'" 
                                                         alt="Imagen de ${tree.species}" class="tree-img">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="Images/arbolDefault.jpg" 
                                                         alt="Imagen por defecto" class="tree-img">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td>
                                            <strong>${tree.species}</strong><br>
                                            <small class="text-muted">ID: ${tree.id}</small>
                                        </td>
                                        <td>
                                            <div><strong>Altura:</strong> ${tree.height} m</div>
                                            <div><strong>Edad:</strong> ${tree.age} años</div>
                                            <div><strong>Ubicación:</strong> ${tree.location}</div>
                                        </td>
                                        <td>
                                            <div><strong>Nombre científico:</strong> ${tree.scientificName}</div>
                                            <div><strong>Origen:</strong> ${tree.origin}</div>
                                            <div><strong>Plantado:</strong> ${tree.plantedDate}</div>
                                        </td>
                                        <td class="action-btns">
                                            <div class="d-flex flex-column gap-2">
                                                <a href="Tree?option=update&id=${tree.id}" 
                                                   class="btn btn-sm btn-outline-success">
                                                    <i class="fas fa-edit me-1"></i> Editar
                                                </a>
                                                <a href="Tree?option=delete&id=${tree.id}" 
                                                   class="btn btn-sm btn-outline-danger"
                                                   onclick="return confirm('¿Seguro que desea eliminar este árbol?');">
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
        </div>

 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>