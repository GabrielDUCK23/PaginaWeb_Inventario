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
public class Materiales {

    int id, Cantidad_S, Cantidad_Total;
    String Nombre, Marca, Cantidad, Lote, Clasificacion, Formula, Tipo;

    public Materiales() {
    }

    public Materiales(int id, String Nombre, String Marca, String Cantidad, String Lote, String Clasificacion, String Formula, String Tipo) {
        this.id = id;
        this.Nombre = Nombre;
        this.Marca = Marca;
        this.Cantidad = Cantidad;
        this.Lote = Lote;
        this.Clasificacion = Clasificacion;
        this.Formula = Formula;
        this.Tipo = Tipo;
    }

    public Materiales(int id, int Cantidad_Total, String Nombre, String Marca, String Cantidad, String Lote, String Clasificacion, String Formula, String Tipo) {
        this.id = id;
        this.Cantidad_Total = Cantidad_Total;
        this.Nombre = Nombre;
        this.Marca = Marca;
        this.Cantidad = Cantidad;
        this.Lote = Lote;
        this.Clasificacion = Clasificacion;
        this.Formula = Formula;
        this.Tipo = Tipo;
    }

  
    
    public Materiales(String Nombre, String Tipo, int Cantidad_Total) {
        this.Nombre = Nombre;
        this.Tipo = Tipo;
        this.Cantidad_Total = Cantidad_Total;

    }

    public Materiales(int Cantidad_S, String Nombre) {
        this.Cantidad_S = Cantidad_S;
        this.Nombre = Nombre;

    }

    public Materiales(int id, int Cantidad_S, String Nombre) {
        this.id = id;
        this.Cantidad_S = Cantidad_S;
        this.Nombre = Nombre;

    }

    public int getCantidad_Total() {
        return Cantidad_Total;
    }

    public void setCantidad_Total(int Cantidad_Total) {
        this.Cantidad_Total = Cantidad_Total;
    }

 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getLote() {
        return Lote;
    }

    public void setLote(String Lote) {
        this.Lote = Lote;
    }

    public String getClasificacion() {
        return Clasificacion;
    }

    public void setClasificacion(String Clasificacion) {
        this.Clasificacion = Clasificacion;
    }

    public String getFormula() {
        return Formula;
    }

    public void setFormula(String Formula) {
        this.Formula = Formula;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public int getCantidad_S() {
        return Cantidad_S;
    }

    public void setCantidad_S(int Cantidad_S) {
        this.Cantidad_S = Cantidad_S;
    }

}
