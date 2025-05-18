package com.espe.sistemaregistroforestal.model;

import jakarta.persistence.*;

/**
 *
 * @author Jaguaco Jonathan
 */

@Entity
@Table(name = "trees")
public class Tree {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long idZone;
    private String species;         // Atributo en inglés
    private double height;          // Atributo en inglés
    private int age;                // Atributo en inglés
    private String location;        // Atributo en inglés
    private String description;     // Atributo en inglés
    private String scientificName;  // Atributo en inglés
    private String origin;          // Atributo en inglés
    private java.sql.Date plantedDate;

    // Constructor sin parámetros (por defecto) requerido por JPA
    public Tree() {}

    // Constructor con parámetros
    public Tree(String species, double height, int age, String location, String description, 
                String scientificName, String origin, java.sql.Date plantedDate) {
        this.species = species;
        this.height = height;
        this.age = age;
        this.location = location;
        this.description = description;
        this.scientificName = scientificName;
        this.origin = origin;
        this.plantedDate = plantedDate;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public java.sql.Date getPlantedDate() {
        return plantedDate;
    }

    public void setPlantedDate(java.sql.Date plantedDate) {
        this.plantedDate = plantedDate;
    }
    public Long getIdZone() { return idZone; }
    public void setIdZone(Long idZone) { this.idZone = idZone; }
}
