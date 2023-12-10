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
public class Solicitud {
    String Lab;
    int Id_S;
    int Id_L;
    String Correo,Depart,Depart2, Asig,Respon,Tipo,Descr,Tiempo,fecha,hora,Estatus;
    String Hora_E,Fecha_E,Com,Nombre,Carrera,Per;
    int Sem, Codigo;
  
    
   
    public Solicitud() {
    }

    public Solicitud(String Lab, int Id_S, int Id_L, String Correo, String Depart, String Depart2, String Asig, String Respon, String Tipo, String Descr, String Tiempo, String fecha, String hora, String Estatus, String Hora_E, String Fecha_E, String Com, String Nombre, String Carrera, String Per, int Sem) {
        this.Lab = Lab;
        this.Id_S = Id_S;
        this.Id_L = Id_L;
        this.Correo = Correo;
        this.Depart = Depart;
        this.Depart2 = Depart2;
        this.Asig = Asig;
        this.Respon = Respon;
        this.Tipo = Tipo;
        this.Descr = Descr;
        this.Tiempo = Tiempo;
        this.fecha = fecha;
        this.hora = hora;
        this.Estatus = Estatus;
        this.Hora_E = Hora_E;
        this.Fecha_E = Fecha_E;
        this.Com = Com;
        this.Nombre = Nombre;
        this.Carrera = Carrera;
        this.Per = Per;
        this.Sem = Sem;
    }

    public Solicitud(String Lab, int Id_S, int Id_L, String Correo, String Depart, String Depart2, String Asig, String Respon, String Tipo, String Descr, String Tiempo, String fecha, String hora, String Estatus, String Hora_E, String Fecha_E, String Com, String Nombre, String Carrera, String Per, int Sem, int Codigo) {
        this.Lab = Lab;
        this.Id_S = Id_S;
        this.Id_L = Id_L;
        this.Correo = Correo;
        this.Depart = Depart;
        this.Depart2 = Depart2;
        this.Asig = Asig;
        this.Respon = Respon;
        this.Tipo = Tipo;
        this.Descr = Descr;
        this.Tiempo = Tiempo;
        this.fecha = fecha;
        this.hora = hora;
        this.Estatus = Estatus;
        this.Hora_E = Hora_E;
        this.Fecha_E = Fecha_E;
        this.Com = Com;
        this.Nombre = Nombre;
        this.Carrera = Carrera;
        this.Per = Per;
        this.Sem = Sem;
        this.Codigo = Codigo;
    }
    
    
    
    
    
    
    public Solicitud(int Id_S, int Id_L, String Correo, String Depart, String Depart2, String Asig, String Respon, String Tipo, String Descr, String Tiempo, String fecha, String hora, String Estatus, String Hora_E, String Fecha_E, String Com) {
        this.Id_S = Id_S;
        this.Id_L = Id_L;
        this.Correo = Correo;
        this.Depart = Depart;
        this.Depart2 = Depart2;
        this.Asig = Asig;
        this.Respon = Respon;
        this.Tipo = Tipo;
        this.Descr = Descr;
        this.Tiempo = Tiempo;
        this.fecha = fecha;
        this.hora = hora;
        this.Estatus = Estatus;
        this.Hora_E = Hora_E;
        this.Fecha_E = Fecha_E;
        this.Com = Com;
    }

   
    public Solicitud(int Id_S, int Id_L, String Correo, String Depart, String Depart2, String Asig, String Respon, String Tipo, String Descr, String Tiempo, String fecha, String hora, String Estatus, String Hora_E, String Fecha_E, String Com, String Nombre, String Carrera) {
        this.Id_S = Id_S;
        this.Id_L = Id_L;
        this.Correo = Correo;
        this.Depart = Depart;
        this.Depart2 = Depart2;
        this.Asig = Asig;
        this.Respon = Respon;
        this.Tipo = Tipo;
        this.Descr = Descr;
        this.Tiempo = Tiempo;
        this.fecha = fecha;
        this.hora = hora;
        this.Estatus = Estatus;
        this.Hora_E = Hora_E;
        this.Fecha_E = Fecha_E;
        this.Com = Com;
        this.Nombre = Nombre;
        this.Carrera = Carrera;
    }

    public Solicitud(String Estatus) {
        this.Estatus = Estatus;
    }

    public Solicitud(String Lab, int Id_S, int Id_L, String Correo, String Depart, String Depart2, String Asig, String Respon, String Tipo, String Descr, String Tiempo, String fecha, String hora, String Estatus, String Hora_E, String Fecha_E, String Com, String Nombre, String Carrera) {
        this.Lab = Lab;
        this.Id_S = Id_S;
        this.Id_L = Id_L;
        this.Correo = Correo;
        this.Depart = Depart;
        this.Depart2 = Depart2;
        this.Asig = Asig;
        this.Respon = Respon;
        this.Tipo = Tipo;
        this.Descr = Descr;
        this.Tiempo = Tiempo;
        this.fecha = fecha;
        this.hora = hora;
        this.Estatus = Estatus;
        this.Hora_E = Hora_E;
        this.Fecha_E = Fecha_E;
        this.Com = Com;
        this.Nombre = Nombre;
        this.Carrera = Carrera;
    }

    public Solicitud(String Lab, int Id_S, int Id_L, String Correo, String Depart, String Depart2, String Asig, String Respon, String Tipo, String Descr, String Tiempo, String fecha, String hora, String Estatus,String Fecha_E, String Hora_E, String Com) {
        this.Lab = Lab;
        this.Id_S = Id_S;
        this.Id_L = Id_L;
        this.Correo = Correo;
        this.Depart = Depart;
        this.Depart2 = Depart2;
        this.Asig = Asig;
        this.Respon = Respon;
        this.Tipo = Tipo;
        this.Descr = Descr;
        this.Tiempo = Tiempo;
        this.fecha = fecha;
        this.hora = hora;
        this.Estatus = Estatus;
        this.Fecha_E = Fecha_E;
        this.Hora_E = Hora_E;
        this.Com = Com;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    

    public String getLab() {
        return Lab;
    }

    public void setLab(String Lab) {
        this.Lab = Lab;
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

  

    public int getId_S() {
        return Id_S;
    }

    public void setId_S(int Id_S) {
        this.Id_S = Id_S;
    }

    public int getId_L() {
        return Id_L;
    }

    public void setId_L(int Id_L) {
        this.Id_L = Id_L;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getDepart() {
        return Depart;
    }

    public void setDepart(String Depart) {
        this.Depart = Depart;
    }

    public String getDepart2() {
        return Depart2;
    }

    public void setDepart2(String Depart2) {
        this.Depart2 = Depart2;
    }

    public String getAsig() {
        return Asig;
    }

    public void setAsig(String Asig) {
        this.Asig = Asig;
    }

    public String getRespon() {
        return Respon;
    }

    public void setRespon(String Respon) {
        this.Respon = Respon;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public String getDescr() {
        return Descr;
    }

    public void setDescr(String Descr) {
        this.Descr = Descr;
    }

    public String getTiempo() {
        return Tiempo;
    }

    public void setTiempo(String Tiempo) {
        this.Tiempo = Tiempo;
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

    public String getEstatus() {
        return Estatus;
    }

    public void setEstatus(String Estatus) {
        this.Estatus = Estatus;
    }

    public String getHora_E() {
        return Hora_E;
    }

    public void setHora_E(String Hora_E) {
        this.Hora_E = Hora_E;
    }

    public String getFecha_E() {
        return Fecha_E;
    }

    public void setFecha_E(String Fecha_E) {
        this.Fecha_E = Fecha_E;
    }

    public String getCom() {
        return Com;
    }

    public void setCom(String Com) {
        this.Com = Com;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getCarrera() {
        return Carrera;
    }

    public void setCarrera(String Carrera) {
        this.Carrera = Carrera;
    }


    


    
}