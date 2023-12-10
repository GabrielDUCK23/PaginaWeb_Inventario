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
public class Usuarios {
String Correo;
int Cod;
String Nom,Car,Per;
int Sem;
String Password;
int nivel;
String Est,Mot,Est2;



int c;
String cor,ciclo,motivo,estatus,Hora,Fecha,Fecha_E; 



    public Usuarios() {
    }

    public Usuarios(String Correo, int Cod, String Nom, String Car, String Per, int Sem, String Password, int nivel) {
        this.Correo = Correo;
        this.Cod = Cod;
        this.Nom = Nom;
        this.Car = Car;
        this.Per = Per;
        this.Sem = Sem;
        this.Password = Password;
        this.nivel = nivel;
    }

    public Usuarios(String Correo, int Cod, String Nom, String Car, String Per, int Sem, int c, String ciclo, String motivo, String estatus, String Fecha,String Hora, String Fecha_E) {
        this.Correo = Correo;
        this.Cod = Cod;
        this.Nom = Nom;
        this.Car = Car;
        this.Per = Per;
        this.Sem = Sem;
        this.c = c;
        this.ciclo = ciclo;
        this.motivo = motivo;
        this.estatus = estatus;
        this.Fecha = Fecha;
        this.Hora = Hora;
        this.Fecha_E = Fecha_E;
    }

    public Usuarios(int c,String Correo, String ciclo, String motivo, String estatus, String Hora, String Fecha, String Fecha_E) {
        this.Correo = Correo;
        this.c = c;
        this.ciclo = ciclo;
        this.motivo = motivo;
        this.estatus = estatus;
        this.Hora = Hora;
        this.Fecha = Fecha;
        this.Fecha_E = Fecha_E;
    }

  

    public Usuarios(String estatus) {
        this.estatus = estatus;
    }

    public Usuarios(String Correo, int Cod, String Nom, String Car, String Per, int Sem, String Password, int nivel, String ciclo, String motivo, String estatus) {
        this.Correo = Correo;
        this.Cod = Cod;
        this.Nom = Nom;
        this.Car = Car;
        this.Per = Per;
        this.Sem = Sem;
        this.Password = Password;
        this.nivel = nivel;
        this.ciclo = ciclo;
        this.motivo = motivo;
        this.estatus = estatus;
    }

    public Usuarios(int Cod, String Nom, String Car, String Per, int Sem, int c, String cor, String ciclo, String motivo, String estatus) {
        this.Cod = Cod;
        this.Nom = Nom;
        this.Car = Car;
        this.Per = Per;
        this.Sem = Sem;
        this.c = c;
        this.cor = cor;
        this.ciclo = ciclo;
        this.motivo = motivo;
        this.estatus = estatus;
    }

    public Usuarios(int Cod, String Nom, String Car, String Per, int Sem, int c, String cor, String ciclo, String motivo, String estatus, String Hora, String Fecha, String Fecha_E) {
        this.Cod = Cod;
        this.Nom = Nom;
        this.Car = Car;
        this.Per = Per;
        this.Sem = Sem;
        this.c = c;
        this.cor = cor;
        this.ciclo = ciclo;
        this.motivo = motivo;
        this.estatus = estatus;
        this.Hora = Hora;
        this.Fecha = Fecha;
        this.Fecha_E = Fecha_E;
    }

    public Usuarios(int Cod, String Nom, String Car, String Per, int Sem, int c, String cor, String ciclo, String motivo, String estatus, String Fecha) {
        this.Cod = Cod;
        this.Nom = Nom;
        this.Car = Car;
        this.Per = Per;
        this.Sem = Sem;
        this.c = c;
        this.cor = cor;
        this.ciclo = ciclo;
        this.motivo = motivo;
        this.estatus = estatus;
        this.Fecha = Fecha;
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

    public String getFecha_E() {
        return Fecha_E;
    }

    public void setFecha_E(String Fecha_E) {
        this.Fecha_E = Fecha_E;
    }

  



    public int getC() {
        return c;
    }

    public void setC(int c) {
        this.c = c;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }
    
    
    
    
    
  
    public String getEst2() {
        return Est2;
    }

    public void setEst2(String Est2) {
        this.Est2 = Est2;
    }
    
    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public int getCod() {
        return Cod;
    }

    public void setCod(int Cod) {
        this.Cod = Cod;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String Nom) {
        this.Nom = Nom;
    }

    public String getCar() {
        return Car;
    }

    public void setCar(String Car) {
        this.Car = Car;
    }

    public String getPer() {
        return Per;
    }

    public void setPer(String Per) {
        this.Per = Per;
    }

    public int getSem() {
        return Sem;
    }

    public void setSem(int Sem) {
        this.Sem = Sem;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public String getEst() {
        return Est;
    }

    public void setEst(String Est) {
        this.Est = Est;
    }

    public String getMot() {
        return Mot;
    }

    public void setMot(String Mot) {
        this.Mot = Mot;
    }
    
    
    
    
}

  