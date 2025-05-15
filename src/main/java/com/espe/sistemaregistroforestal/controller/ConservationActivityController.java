package com.espe.sistemaregistroforestal.controller;

import com.espe.sistemaregistroforestal.dao.ConservationActivityDAO;
import com.espe.sistemaregistroforestal.model.ConservationActivity;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
/**
 *
 * @author Reishel
 */
@WebServlet(name = "ConservationActivityController", urlPatterns = {"/ConservationActivity"})
public class ConservationActivityController extends HttpServlet {
    
    private final ConservationActivityDAO activityDao = new ConservationActivityDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String option = request.getParameter("option");
        if (option == null) {
            option = "findAll";
        }

        switch (option) {
            case "new":
                request.getRequestDispatcher("/formActivity.jsp").forward(request, response);
                break;

            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                ConservationActivity activity = activityDao.findById(id);
                request.setAttribute("activity", activity);
                request.getRequestDispatcher("/formActivity.jsp").forward(request, response);
                break;

            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                activityDao.delete(idDelete);
                response.sendRedirect("ConservationActivity");
                break;

            default:
                List<ConservationActivity> activities = activityDao.findAll();
                request.setAttribute("activities", activities);
                request.getRequestDispatcher("/listActivity.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        Integer id = (idStr == null || idStr.isEmpty()) ? null : Integer.parseInt(idStr);

        String description = request.getParameter("description");
        String activityType = request.getParameter("activityType");
        String dateStr = request.getParameter("date");
        String responsible = request.getParameter("responsible");
        int idZone = Integer.parseInt(request.getParameter("idZone"));

        try {
            // Crear objeto para reutilizar en ambos caminos
            ConservationActivity activity = new ConservationActivity();
            activity.setDescription(description);
            activity.setActivityType(activityType);
            activity.setResponsible(responsible);
            activity.setIdZone(idZone);

            try {
                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
                activity.setDate(date);
            } catch (Exception ex) {
                activity.setDate(null); // Opcional: manejar si hay un error de formato
            }

            // Validar si el idZone existe
            if (!activityDao.existsZone(idZone)) {
                request.setAttribute("Error", "La zona forestal con ID " + idZone + " no existe en el sistema.");
                request.setAttribute("activity", activity);
                request.getRequestDispatcher("/formActivity.jsp").forward(request, response);
                return;
            }

            if (id == null) {
                activityDao.save(activity);
            } else {
                activity.setId(id);
                activityDao.update(activity);
            }

            response.sendRedirect("ConservationActivity");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error saving activity");
            request.getRequestDispatcher("/formActivity.jsp").forward(request, response);
        }
    }
}