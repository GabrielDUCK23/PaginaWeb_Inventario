/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UML;

/**
 *
 * @author netor
 */
public class Carta {
    int id;
    String Correo,Ciclo,Motivo,Estatus;
    String Fecha, Hora, Fecha_Entrega;

    public Carta(int id, String Correo, String Ciclo, String Motivo, String Estatus) {
        this.id = id;
        this.Correo = Correo;
        this.Ciclo = Ciclo;
        this.Motivo = Motivo;
        this.Estatus = Estatus;
    }

    public Carta(int id, String Correo, String Ciclo, String Motivo, String Estatus, String Fecha, String Hora, String Fecha_Entrega) {
        this.id = id;
        this.Correo = Correo;
        this.Ciclo = Ciclo;
        this.Motivo = Motivo;
        this.Estatus = Estatus;
        this.Fecha = Fecha;
        this.Hora = Hora;
        this.Fecha_Entrega = Fecha_Entrega;
    }

    public Carta(int id, String Correo, String Ciclo, String Motivo, String Estatus, String Fecha_Entrega) {
        this.id = id;
        this.Correo = Correo;
        this.Ciclo = Ciclo;
        this.Motivo = Motivo;
        this.Estatus = Estatus;
        this.Fecha_Entrega = Fecha_Entrega;
    }


    public Carta() {
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getHora() {
        return Hora;
    }

    public void setHora(String Hora) {
        this.Hora = Hora;
    }

    public String getFecha_Entrega() {
        return Fecha_Entrega;
    }

    public void setFecha_Entrega(String Fecha_Entrega) {
        this.Fecha_Entrega = Fecha_Entrega;
    }
    
    
    
     

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getCiclo() {
        return Ciclo;
    }

    public void setCiclo(String Ciclo) {
        this.Ciclo = Ciclo;
    }

    public String getMotivo() {
        return Motivo;
    }

    public void setMotivo(String Motivo) {
        this.Motivo = Motivo;
    }

    public String getEstatus() {
        return Estatus;
    }

    public void setEstatus(String Estatus) {
        this.Estatus = Estatus;
    }
    
    
    
}
