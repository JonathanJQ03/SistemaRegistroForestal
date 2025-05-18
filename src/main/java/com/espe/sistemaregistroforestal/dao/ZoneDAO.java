// ZoneDAO.java
package com.espe.sistemaregistroforestal.dao;

import com.espe.sistemaregistroforestal.model.ForestZone;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ZoneDAO {
    public List<ForestZone> findAll() {
        List<ForestZone> zones = new ArrayList<>();
        String sql = "SELECT id, name FROM forestzone";
        try (Connection conn = ConnectionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                ForestZone z = new ForestZone();
                z.setId(rs.getLong("id"));
                z.setZoneName(rs.getString("zoneName"));
                zones.add(z);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return zones;
    }
}
