package com.compi.emuladorinstruccionsql;
import InterfazAplicacion.Interfaz;
import com.compi.emuladorinstruccionsql.jcup.AnalizadorSintactico;
import com.compi.emuladorinstruccionsql.jflex.Lexico;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTextPane;

public class EmuladorInstruccionSQL {

   
    public static void main(String[] args) {
        Interfaz interfaz = new Interfaz();
        interfaz.setVisible(true);
        //interpretar("SELECCIONAR * FILTRAR tabla1 ;");
        
        
    }
     private static void interpretar(String valores) {
        try {
            AnalizadorSintactico pars;
            System.out.println("Valores " + valores);
            try {
                StringReader stringReader = new StringReader(valores);
                pars = new AnalizadorSintactico(new Lexico(stringReader));
                pars.parse();
            } catch (Exception ex) {
                ex.printStackTrace();
                System.out.println("Error fatal en compilación de entrada.");
                System.out.println("Causa: "+ex.getCause());
            }
            
            
        } catch (Exception ex) {
            Logger.getLogger(Interfaz.class.getName()).log(Level.SEVERE, null, ex);
        } 
    } 
    
      
}