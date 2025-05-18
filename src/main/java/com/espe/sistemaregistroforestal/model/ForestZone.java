
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.espe.sistemaregistroforestal.model;

import jakarta.persistence.*;
import java.sql.Date;


/**
 *
 * @author Stefy^^
 */

@Entity

public class ForestZone {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; 
    
    private String zoneName;
    private String location;
    private double area;
    private String zoneType;
    private Date registerDate;  

    public ForestZone(Long id, String zoneName, String location, double area, String zoneType, Date registerDate) {
        this.id = id;
        this.zoneName = zoneName;
        this.location = location;
        this.area = area;
        this.zoneType = zoneType;
        this.registerDate = registerDate;
    }

    public ForestZone() {
    }
    
    public ForestZone(String zoneName, String location, double area, String zoneType, Date registerDate) {
        this.zoneName = zoneName;
        this.location = location;
        this.area = area;
        this.zoneType = zoneType;
        this.registerDate = registerDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getZoneName() {
        return zoneName;
    }

    public void setZoneName(String zoneName) {
        this.zoneName = zoneName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getZoneType() {
        return zoneType;
    }

    public void setZoneType(String zoneType) {
        this.zoneType = zoneType;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }
        
}

