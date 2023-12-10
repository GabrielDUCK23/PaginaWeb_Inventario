/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UML;

import java.io.InputStream;

public class Reportes {
    int id;
   String Correo,Nombre, lab, esp,Prof,fecha,hora,horaS;
   InputStream archivopdf;
   private byte[] archivopdf2;
   String Com;

    public Reportes() {
    }

    public Reportes(int id, String Correo, String Nombre, String lab, String esp, String Prof, String fecha, String hora, String horaS, byte[] archivopdf2, String Com) {
        this.id = id;
        this.Correo = Correo;
        this.Nombre = Nombre;
        this.lab = lab;
        this.esp = esp;
        this.Prof = Prof;
        this.fecha = fecha;
        this.hora = hora;
        this.horaS = horaS;
        this.archivopdf2 = archivopdf2;
        this.Com= Com;
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

 
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getLab() {
        return lab;
    }

    public void setLab(String lab) {
        this.lab = lab;
    }

    public String getEsp() {
        return esp;
    }

    public void setEsp(String esp) {
        this.esp = esp;
    }

    public String getProf() {
        return Prof;
    }

    public void setProf(String Prof) {
        this.Prof = Prof;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getHoraS() {
        return horaS;
    }

    public void setHoraS(String horaS) {
        this.horaS = horaS;
    }

    public InputStream getArchivopdf() {
        return archivopdf;
    }

    public void setArchivopdf(InputStream archivopdf) {
        this.archivopdf = archivopdf;
    }

    public byte[] getArchivopdf2() {
        return archivopdf2;
    }

    public void setArchivopdf2(byte[] archivopdf2) {
        this.archivopdf2 = archivopdf2;
    }

    public String getCom() {
        return Com;
    }

    public void setCom(String Com) {
        this.Com = Com;
    }

    
    
   
 
  
   

    
    
    
    
}
