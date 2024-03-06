/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.compi.emuladorinstruccionsql;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author carlosl
 */
public class LectorCSV {
    public static StringBuilder leerCSV(String columna) throws IOException {
        String filePath = "/home/carlosl/NetBeansProjects/EmuladorInstruccionSQL/src/main/java/com/compi/emuladorinstruccionsql/Prueba.csv";
        StringBuilder texto = new StringBuilder();
        List<String[]> data = new ArrayList<>();
        int contador = 1;
        
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] row = line.split(",");
                data.add(row);
            }
        }

        
        for (String[] fila : data) {
            if("*".equals(columna)){
                for (String dato : fila) {
                    contador++;
                    texto.append(dato).append(','); 
                    System.out.println("Dato " + dato + " num " +dato);
                }
            }
            if(columna.equals("'")){
                
            }
        }
        
        return texto;
    }
}


