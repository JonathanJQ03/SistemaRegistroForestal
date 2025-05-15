package com.espe.sistemaregistroforestal.dao;

import com.espe.sistemaregistroforestal.model.ConservationActivity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *
 * @author Reishel
 */
public class ConservationActivityDAO {
    public boolean save(ConservationActivity activity) {
    if (activity.getDescription() == null || activity.getDescription().isEmpty() || 
        activity.getActivityType() == null || activity.getActivityType().isEmpty() || 
        activity.getDate() == null || activity.getResponsible() == null || 
        activity.getResponsible().isEmpty()) {
        return false; // O lanzar excepción según el caso
    }

    String sql = "INSERT INTO conservationactivity(description, activityType, date, responsible, idZone) VALUES (?, ?, ?, ?, ?)";
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, activity.getDescription());
        stmt.setString(2, activity.getActivityType());
        stmt.setDate(3, new java.sql.Date(activity.getDate().getTime()));
        stmt.setString(4, activity.getResponsible());
        stmt.setInt(5, activity.getIdZone());

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


    public List<ConservationActivity> findAll() {
        List<ConservationActivity> lista = new ArrayList<>();
        String sql = "SELECT * FROM conservationactivity";
        try (Connection conn = ConnectionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                ConservationActivity activity = new ConservationActivity();
                activity.setId(rs.getInt("id"));
                activity.setDescription(rs.getString("description"));
                activity.setActivityType(rs.getString("activityType"));
                activity.setDate(rs.getDate("date"));
                activity.setResponsible(rs.getString("responsible"));
                activity.setIdZone(rs.getInt("idZone"));

                lista.add(activity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ConservationActivity findById(int id) {
        String sql = "SELECT * FROM conservationactivity WHERE id = ?";
        ConservationActivity activity = null;
        try (Connection conn = ConnectionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    activity = new ConservationActivity();
                    activity.setId(rs.getInt("id"));
                    activity.setDescription(rs.getString("description"));
                    activity.setActivityType(rs.getString("activityType"));
                    activity.setDate(rs.getDate("date"));
                    activity.setResponsible(rs.getString("responsible"));
                    activity.setIdZone(rs.getInt("idZone"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activity;
    }

    public boolean update(ConservationActivity activity) {
    if (activity.getDescription() == null || activity.getDescription().isEmpty() || 
        activity.getActivityType() == null || activity.getActivityType().isEmpty() || 
        activity.getDate() == null || activity.getResponsible() == null || 
        activity.getResponsible().isEmpty()) {
        return false; // O lanzar excepción según el caso
    }

    String sql = "UPDATE conservationactivity SET description = ?, activityType = ?, date = ?, responsible = ?, idZone = ? WHERE id = ?";
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, activity.getDescription());
        stmt.setString(2, activity.getActivityType());
        stmt.setDate(3, new java.sql.Date(activity.getDate().getTime()));
        stmt.setString(4, activity.getResponsible());
        stmt.setInt(5, activity.getIdZone());
        stmt.setInt(6, activity.getId());

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}



    public boolean delete(int id) {
        String sql = "DELETE FROM conservationactivity WHERE id = ?";
        try (Connection conn = ConnectionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean existsZone(int idZone) {
    boolean exists = false;
    String sql = "SELECT COUNT(*) FROM forestzone WHERE id = ?";
    try (Connection con = ConnectionBD.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, idZone);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return exists;
    }


}
