/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelado;

import java.util.List;

/**
 *
 * @author netor
 */
public interface Operaciones {
     public String Insertar(Object obj);
    public String Actualizar(Object obj);
    public String Eliminar(Object obj);
    public List<?> consultarGRL();
    public List<?> consultarGRL2();
    public List<?> consultar(int Criterio);
    public List<?> consultar(String Criterio);
    public List<?> trigger();
}
