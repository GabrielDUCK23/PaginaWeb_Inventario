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
public class Laboratorio {
   int idL;
     String Nom;
     String enca,Nomb_Enc;
     
     int id_R,Lab;
     
     String Correo;
     String Dia;
     String Hora_I;
     String Nombre_Lab;
     String Estatus;
    
   
    public Laboratorio() {
    }

    public Laboratorio(String nom,int id_R, int idL,String Correo,String Dia, String Hora_I,String Estatus) {
        this.Nom = nom;
        this.id_R = id_R;
        this.idL = idL;
        this.Correo = Correo;
        this.Dia = Dia;
        this.Hora_I = Hora_I;
        this.Estatus=Estatus;
        
    }
    
    

    public Laboratorio(int idL, String nom, String enca, String Nomb_Enc) {
        this.idL = idL;
        this.Nom = nom;
        this.enca = enca;
        this.Nomb_Enc = Nomb_Enc;
    }

    public Laboratorio(String Correo, String Dia, String Hora_I,String Nombre_Lab, String Estatus) {
        this.Correo = Correo;
        this.Dia = Dia;
        this.Hora_I = Hora_I;      
        this.Nombre_Lab = Nombre_Lab;
        this.Estatus = Estatus;
    }

    public Laboratorio(int id_R, String Correo, String Dia, String Hora_I, String Nombre_Lab) {
        this.id_R = id_R;
        this.Correo = Correo;
        this.Dia = Dia;
        this.Hora_I = Hora_I;
        this.Nombre_Lab = Nombre_Lab;
    }

    public Laboratorio(int idL, String nom, String enca) {
        this.idL = idL;
        this.Nom = nom;
        this.enca = enca;
    }

    
    

    

    public Laboratorio(int id_R, int Lab, String Correo, String Dia, String Hora_I) {
        this.id_R = id_R;
        this.Lab = Lab;
        this.Correo = Correo;
        this.Dia = Dia;
        this.Hora_I = Hora_I;
        
    }

    public Laboratorio(String nom, String Dia, String Hora_I) {
        this.Nom = nom;
        this.Dia = Dia;
        this.Hora_I = Hora_I;
       
    }

    public Laboratorio(int id_R, int Lab, String Correo, String Dia, String Hora_I, String Nombre_Lab, String Estatus) {
        this.id_R = id_R;
        this.Lab = Lab;
        this.Correo = Correo;
        this.Dia = Dia;
        this.Hora_I = Hora_I;
        this.Nombre_Lab = Nombre_Lab;
        this.Estatus = Estatus;
    }

  

    
    
  
    
    

    public Laboratorio(int idL, String nom) {
        this.idL = idL;
        this.Nom = nom;
    }

    

    public int getIdL() {
        return idL;
    }

    public void setIdL(int idL) {
        this.idL = idL;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String nom) {
        this.Nom = nom;
    }

    public String getEnca() {
        return enca;
    }

    public void setEnca(String enca) {
        this.enca = enca;
    }

    public String getNomb_Enc() {
        return Nomb_Enc;
    }

    public void setNomb_Enc(String Nomb_Enc) {
        this.Nomb_Enc = Nomb_Enc;
    }

    public int getId_R() {
        return id_R;
    }

    public void setId_R(int id_R) {
        this.id_R = id_R;
    }

    public int getLab() {
        return Lab;
    }

    public void setLab(int Lab) {
        this.Lab = Lab;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getDia() {
        return Dia;
    }

    public void setDia(String Dia) {
        this.Dia = Dia;
    }

    public String getHora_I() {
        return Hora_I;
    }

    public void setHora_I(String Hora_I) {
        this.Hora_I = Hora_I;
    }

    public String getNombre_Lab() {
        return Nombre_Lab;
    }

    public void setNombre_Lab(String Nombre_Lab) {
        this.Nombre_Lab = Nombre_Lab;
    }

    public String getEstatus() {
        return Estatus;
    }

    public void setEstatus(String Estatus) {
        this.Estatus = Estatus;
    }

  
  
      
    
    }

