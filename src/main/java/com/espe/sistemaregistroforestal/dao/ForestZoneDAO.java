/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.espe.sistemaregistroforestal.dao;

import com.espe.sistemaregistroforestal.model.ForestZone;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Stefy^^
 */
public class ForestZoneDAO {
    public boolean save(ForestZone forestZone) {
    String sql = "INSERT INTO forestzone (zoneName, location, area, zoneType, registerDate) "
               + "VALUES (?, ?, ?, ?, ?)";
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, forestZone.getZoneName());
        stmt.setString(2, forestZone.getLocation());
        stmt.setDouble(3, forestZone.getArea());
        stmt.setString(4, forestZone.getZoneType());
        stmt.setDate(5, forestZone.getRegisterDate());

        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    public boolean update(ForestZone forestZone) {
    String sql = "UPDATE forestzone "
               + "SET zoneName = ?, location = ?, area = ?, zoneType = ?, registerDate = ?"
               + "WHERE id = ?";
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, forestZone.getZoneName());
        stmt.setString(2, forestZone.getLocation());
        stmt.setDouble(3, forestZone.getArea());
        stmt.setString(4, forestZone.getZoneType());
        stmt.setDate(5, forestZone.getRegisterDate());
        stmt.setLong(6, forestZone.getId()); 
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    public ForestZone findById(Long id) {
    String sql = "SELECT * FROM forestzone WHERE id = ?";
    ForestZone forestZone = null;
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setLong(1, id);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                forestZone = new ForestZone();
                forestZone.setId(rs.getLong("id"));
                forestZone.setZoneName(rs.getString("zoneName"));
                forestZone.setLocation(rs.getString("location"));
                forestZone.setArea(rs.getDouble("area"));
                forestZone.setZoneType(rs.getString("zoneType"));
                forestZone.setRegisterDate(rs.getDate("registerDate"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return forestZone;
}

    public List<ForestZone> findAll(){
        //Declarar una lista vacia
        List<ForestZone> forestZones = new ArrayList<>();
        String sql = "SELECT * FROM forestzone";
        try(Connection cn = ConnectionBD.getConnection();
                PreparedStatement stm = cn.prepareStatement(sql);
                //Variable para almacenar la tabla y poder acceder a ella en forma de filas
                ResultSet rs = stm.executeQuery()){
            while(rs.next()){
                ForestZone forestZone = new ForestZone();
                //Usar el set para obtener los datos de la base y el valor entre "" es el valor de la abse de datos
                forestZone.setId(rs.getLong("id"));
                forestZone.setZoneName(rs.getString("zoneName"));
                forestZone.setLocation(rs.getString("location"));
                forestZone.setArea(rs.getDouble("area"));
                forestZone.setZoneType(rs.getString("zoneType"));
                forestZone.setRegisterDate(rs.getDate("registerDate"));
                
                forestZones.add(forestZone);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return forestZones;
    }
    public boolean delete(Long id){
        String sql = "DELETE FROM forestzone WHERE id = ?";
        try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setLong(1, id);
        
        return stmt.executeUpdate() > 0;  // Retorna true si se eliminó al menos una fila

    } catch (SQLException e) {
        e.printStackTrace();
        return false;  // Retorna false en caso de error
        }
    }
    
}
