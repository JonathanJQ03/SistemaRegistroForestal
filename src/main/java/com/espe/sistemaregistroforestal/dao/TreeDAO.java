package com.espe.sistemaregistroforestal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.espe.sistemaregistroforestal.model.Tree;

/**
 *
 * @author Jonathan Jaguaco
 */
public class TreeDAO {
    public boolean save(Tree tree) {
    String sql = "INSERT INTO trees (species, height, age, location, description, scientificName, origin, plantedDate) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, tree.getSpecies());
        stmt.setDouble(2, tree.getHeight());
        stmt.setInt(3, tree.getAge());
        stmt.setString(4, tree.getLocation());
        stmt.setString(5, tree.getDescription());
        stmt.setString(6, tree.getScientificName());
        stmt.setString(7, tree.getOrigin());
        stmt.setDate(8, tree.getPlantedDate());
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    public boolean update(Tree tree) {
    String sql = "UPDATE trees "
               + "SET species = ?, height = ?, age = ?, location = ?, description = ?, "
               + "    scientificName = ?, origin = ?, plantedDate = ? "
               + "WHERE id = ?";
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, tree.getSpecies());
        stmt.setDouble(2, tree.getHeight());
        stmt.setInt(3, tree.getAge());
        stmt.setString(4, tree.getLocation());
        stmt.setString(5, tree.getDescription());
        stmt.setString(6, tree.getScientificName());
        stmt.setString(7, tree.getOrigin());
        stmt.setDate(8, tree.getPlantedDate());
        stmt.setLong(9, tree.getId());
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    public Tree findById(Long id) {
    String sql = "SELECT * FROM trees WHERE id = ?";
    Tree tree = null;
    try (Connection conn = ConnectionBD.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setLong(1, id);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                tree = new Tree();
                tree.setId(rs.getLong("id"));
                tree.setSpecies(rs.getString("species"));
                tree.setHeight(rs.getDouble("height"));
                tree.setAge(rs.getInt("age"));
                tree.setLocation(rs.getString("location"));
                tree.setDescription(rs.getString("description"));
                tree.setScientificName(rs.getString("scientificName"));
                tree.setOrigin(rs.getString("origin"));
                tree.setPlantedDate(rs.getDate("plantedDate"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return tree;
}

    public List<Tree> findAll(){
        //Declarar una lista vacia
        List<Tree> trees = new ArrayList<>();
        String sql = "SELECT * FROM trees";
        try(Connection cn = ConnectionBD.getConnection();
                PreparedStatement stm = cn.prepareStatement(sql);
                //Variable para almacenar la tabla y poder acceder a ella en forma de filas
                ResultSet rs = stm.executeQuery()){
            while(rs.next()){
                Tree tree = new Tree();
                //Usar el set para obtener los datos de la base y el valor entre "" es el valor de la abse de datos
                tree.setId(rs.getLong("id"));
                tree.setSpecies(rs.getString("species"));
                tree.setHeight(rs.getDouble("height"));
                tree.setAge(rs.getInt("age"));
                tree.setLocation(rs.getString("location"));
                tree.setDescription(rs.getString("description"));
                tree.setScientificName(rs.getString("scientificName"));
                tree.setOrigin(rs.getString("origin"));
                tree.setPlantedDate(rs.getDate("plantedDate"));
                trees.add(tree);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return trees;
    }
    public boolean delete(Long id){
        String sql = "DELETE FROM trees WHERE id = ?";
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
