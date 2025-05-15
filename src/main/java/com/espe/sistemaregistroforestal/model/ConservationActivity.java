package com.espe.sistemaregistroforestal.model;
import jakarta.persistence.*;
import java.util.Date;

/**
 *
 * @author Reishel
 */
@Entity
@Table(name = "conservationactivity")
public class ConservationActivity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String activityType;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date date;

    private String responsible;

    private int idZone; // Esto es un FK pero aquí lo dejamos como int. Si luego tienes una entidad ZonaForestal, puedes usar @ManyToOne

    // Constructor vacío
    public ConservationActivity() {}

    // Constructor con parámetros
    public ConservationActivity(String description, String activityType, Date date, String responsible, int idZone) {
        this.description = description;
        this.activityType = activityType;
        this.date = date;
        this.responsible = responsible;
        this.idZone = idZone;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public String getActivityType() {
        return activityType;
    }

    public Date getDate() {
        return date;
    }

    public String getResponsible() {
        return responsible;
    }

    public int getIdZone() {
        return idZone;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setResponsible(String responsible) {
        this.responsible = responsible;
    }

    public void setIdZone(int zonaId) {
        this.idZone = zonaId;
    }
    
    // Este método es solo para que funcione el JSP con ${actividad.id}
public int getIdActivity() {
    return id;
}

}

