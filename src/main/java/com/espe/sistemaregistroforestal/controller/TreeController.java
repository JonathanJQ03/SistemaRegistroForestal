package com.espe.sistemaregistroforestal.controller;

import com.espe.sistemaregistroforestal.dao.TreeDAO;
import com.espe.sistemaregistroforestal.dao.ZoneDAO;
import com.espe.sistemaregistroforestal.model.ForestZone;
import com.espe.sistemaregistroforestal.model.Tree;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author jonat
 */
@WebServlet(name = "TreeController", urlPatterns = {"/Tree"})
public class TreeController extends HttpServlet {

    private final TreeDAO tree = new TreeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Obtencion del valor del parametro
        String option = request.getParameter("option");
        if (option == null) {
            //No le damos un valor para que no entre en ninguna condicion dentro del swich
            option = "none";
        }
        ZoneDAO zoneDAO = new ZoneDAO();
        List<ForestZone> listZones = zoneDAO.findAll();
        request.setAttribute("listZones", listZones);
        switch (option) {
            case "new":
                request.getRequestDispatcher("/formTree.jsp").forward(request, response);
                break;
            case "delete":
                Long idDelete = Long.valueOf(request.getParameter("id"));
                boolean suceso = tree.delete(idDelete);
                if (suceso) {
                    request.setAttribute("mensaje", "El registro del árbol fue eliminado correctamente.");
                } else {
                    request.setAttribute("mensaje", "Hubo un error al eliminar el registro del árbol.");
                }
                response.sendRedirect("Tree");
                break;
            case "update":
                Long id = Long.valueOf(request.getParameter("id"));
                Tree treee = tree.findById(id);
                request.setAttribute("tree", treee);
                request.getRequestDispatcher("/formTree.jsp").forward(request, response);
                break;
            default:
                List<Tree> treeBD = tree.findAll();
                //indico que envio a mi respuesta la lista que recibi del dao llamado como lista arboles 
                request.setAttribute("listTrees", treeBD);
                request.getRequestDispatcher("/list.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // 1) Leer el parámetro 'id' (si viene vacío, es inserción; si no, es edición)
            String idParam = request.getParameter("id");
            Long id = (idParam == null || idParam.trim().isEmpty()) ? null : Long.valueOf(idParam);

            // 2) Leer y validar todos los parámetros del formulario
            String species = request.getParameter("species");
            if (species == null || species.trim().isEmpty()) {
                throw new ServletException("La especie es requerida");
            }

            // Validación para height
            String heightParam = request.getParameter("height");
            if (heightParam == null || heightParam.trim().isEmpty()) {
                throw new ServletException("La altura es requerida");
            }
            double height = Double.parseDouble(heightParam);

            // Validación para age
            String ageParam = request.getParameter("age");
            if (ageParam == null || ageParam.trim().isEmpty()) {
                throw new ServletException("La edad es requerida");
            }
            int age = Integer.parseInt(ageParam);

            String location = request.getParameter("location");
            String description = request.getParameter("description");
            String scientificName = request.getParameter("scientificName");
            String origin = request.getParameter("origin");
            String idZoneParam = request.getParameter("idZone");
            if (idZoneParam == null || idZoneParam.isEmpty()) {
                throw new ServletException("La zona es requerida");
            }
            Long idZone = Long.valueOf(idZoneParam);

            // Validación para plantedDate
            String plantedDateParam = request.getParameter("plantedDate");
            if (plantedDateParam == null || plantedDateParam.trim().isEmpty()) {
                throw new ServletException("La fecha de plantación es requerida");
            }
            java.sql.Date plantedDate;
            try {
                plantedDate = java.sql.Date.valueOf(plantedDateParam);
            } catch (IllegalArgumentException e) {
                throw new ServletException("Formato de fecha inválido. Use yyyy-MM-dd");
            }

            // 3) Crear y poblar el objeto Tree
            Tree treeObj = new Tree();
            treeObj.setSpecies(species);
            treeObj.setHeight(height);
            treeObj.setAge(age);
            treeObj.setLocation(location);
            treeObj.setDescription(description);
            treeObj.setScientificName(scientificName);
            treeObj.setOrigin(origin);
            treeObj.setPlantedDate(plantedDate);
            treeObj.setIdZone(idZone);
            // 4) Insertar o actualizar según 'id'
            if (id == null) {
                tree.save(treeObj);
            } else {
                treeObj.setId(id);
                tree.update(treeObj);
            }

            // 5) Redirigir de nuevo al listado (GET /Tree)
            response.sendRedirect(request.getContextPath() + "/Tree");

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato numérico inválido (altura o edad)");
        } catch (ServletException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor");
        }
    }

}
