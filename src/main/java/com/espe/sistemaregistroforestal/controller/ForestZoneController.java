/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.espe.sistemaregistroforestal.controller;

import com.espe.sistemaregistroforestal.dao.ForestZoneDAO;
import com.espe.sistemaregistroforestal.model.ForestZone;
import java.sql.Date;
import java.util.List;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Stefy^^
 */
@WebServlet(name = "ForestZoneController", urlPatterns = {"/ForestZone"})
public class ForestZoneController extends HttpServlet {

    private final ForestZoneDAO forestZone = new ForestZoneDAO();

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
                request.getRequestDispatcher("/formForestZone.jsp").forward(request, response);
                break;
            case "delete":
                Long idDelete = Long.valueOf(request.getParameter("id"));
                boolean suceso = forestZone.delete(idDelete);
                if (suceso) {
                    request.setAttribute("mensaje", "El registro de la zona forestal fue eliminado correctamente.");
                } else {
                    request.setAttribute("mensaje", "Hubo un error al eliminar el registro de la zona forestal.");
                }
                response.sendRedirect("ForestZone");
                break;
            case "update":
                Long id = Long.valueOf(request.getParameter("id"));
                ForestZone forestZonee = forestZone.findById(id);
                request.setAttribute("forestZone", forestZonee);
                request.getRequestDispatcher("/formForestZone.jsp").forward(request, response);
                break;
            default:
                List<ForestZone> forestZoneBD = forestZone.findAll();
                //indico que envio a mi respuesta la lista que recibi del dao llamado como lista arboles 
                request.setAttribute("listForestZone", forestZoneBD);
                request.getRequestDispatcher("/listForestZone.jsp").forward(request, response);

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
        String zoneName = request.getParameter("zoneName");
        String location = request.getParameter("location");
        double area = Double.parseDouble(request.getParameter("area"));
        String zoneType = request.getParameter("zoneType");
        java.sql.Date registerDate = java.sql.Date.valueOf(request.getParameter("registerDate"));


        // 3) Crear y poblar el objeto forest zone
        ForestZone forestZoneObj = new ForestZone();
        forestZoneObj.setZoneName(zoneName);
        forestZoneObj.setLocation(location);
        forestZoneObj.setArea(area);
        forestZoneObj.setZoneType(zoneType);
        forestZoneObj.setRegisterDate(registerDate);

        // 4) Insertar o actualizar según 'id'
        if (id == null) {
            // Nuevo registro
            forestZone.save(forestZoneObj);
        } else {
            // Edición de un registro existente
            forestZoneObj.setId(id);
            forestZone.update(forestZoneObj);
        }

        // 5) Redirigir de nuevo al listado (GET /Tree)
        response.sendRedirect(request.getContextPath() + "/ForestZone");
    }
}