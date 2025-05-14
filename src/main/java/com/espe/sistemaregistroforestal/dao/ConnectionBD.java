package com.espe.sistemaregistroforestal.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Jonathan Jaguaco 
 */
public class ConnectionBD {
    //Declarar los argumentos que iran en el método de conexion
    //Realizar un try catch para manejar errores en caso de no poder conectarnos
    private static final String URL = "jdbc:mysql://localhost:3306/zonaforestal?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "2003";
    //static define metodos o variables "globales" donde solo pueden existir unicamente un solo valor 
    //En caso de tener crear la misma variable se generara un error y tener cuidado pq podemos sobreescribirla para todos
     static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("No se encontró el driver JDBC");
        }
    }
     public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }  
}
