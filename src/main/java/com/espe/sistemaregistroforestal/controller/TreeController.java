package com.espe.sistemaregistroforestal.controller;

import com.espe.sistemaregistroforestal.dao.TreeDAO;
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
        switch (option) {
            case "new":
                request.getRequestDispatcher("/formTree.jsp").forward(request, response);
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

        // 1) Leer el parámetro 'id' (si viene vacío, es inserción; si no, es edición)
        String idParam = request.getParameter("id");
        Long id = (idParam == null || idParam.isEmpty())
                ? null
                : Long.valueOf(idParam);

        // 2) Leer todos los parámetros del formulario
        String species = request.getParameter("species");
        double height = Double.parseDouble(request.getParameter("height"));
        int age = Integer.parseInt(request.getParameter("age"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String scientificName = request.getParameter("scientificName");
        String origin = request.getParameter("origin");
        // parseamos la fecha en formato ISO (yyyy-MM-dd)
        java.sql.Date plantedDate = java.sql.Date.valueOf(request.getParameter("plantedDate"));

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

        // 4) Insertar o actualizar según 'id'
        if (id == null) {
            // Nuevo registro
            tree.save(treeObj);
        } else {
            // Edición de un registro existente
            treeObj.setId(id);
            tree.update(treeObj);
        }

        // 5) Redirigir de nuevo al listado (GET /Tree)
        response.sendRedirect(request.getContextPath() + "/Tree");
    }

}
