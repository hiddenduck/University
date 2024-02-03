package Ficha2;

import java.util.Arrays;

public class Exe6 {
    public int[][] somaMatrizes(int[][] matriz1, int[][] matriz2) {
        int[][] matriz = new int[matriz1.length][(matriz1.length > 0) ? matriz1[0].length : 0];
        int i, j;

        for(i=0; i<matriz1.length; i++)
            for(j=0; j<matriz1[0].length; j++)
                matriz[i][j] = matriz1[i][j] + matriz2[i][j];

        return matriz;
    }

    public Boolean iguais(int[][] matriz1, int[][] matriz2) {
        return Arrays.deepEquals(matriz1, matriz2);
    }

    public int[][] matrizOposta(int[][] matriz){
        int[][] oposta = new int[matriz.length][(matriz.length > 0) ? matriz[0].length : 0];
        int i, j;

        for(i=0; i<matriz.length; i++)
            for(j=0; j<matriz[0].length; j++)
                oposta[i][j] = -matriz[i][j];

        return oposta;
    }

}
