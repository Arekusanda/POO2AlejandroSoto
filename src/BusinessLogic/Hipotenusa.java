/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package BusinessLogic;

/**
 *
 * @author Alejandro Soto
 */
public class Hipotenusa {
    public double lado1;
    public double lado2;
    public double hipotenusa;
    
    public double CalcularHipotenusa(double lado1, double lado2){
        
        double hipotenusa = Math.sqrt(Math.pow(lado1,2)+Math.pow(lado2, 2));
        return hipotenusa;
        
    }
}
