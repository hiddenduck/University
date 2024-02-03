package Ficha2;

import java.util.Arrays;

public class Exe1 {

    public int minimo(int[] a){
        int min = Integer.MAX_VALUE;
        for (int j : a) { // intelliJ gosta mais do for each
            if (j < min)
                min = j;
        }

        return min;
    }

    public int[] entreInd(int[] array, int a, int b){
        if(a < 0 || a > array.length || b < 0 || b > array.length || b < a)
            return null;

        int[] novo = new int[b-a+1];
        System.arraycopy(array, a, novo, 0, b-a+1);

        return novo;
    }

    public int[] emComum(int[] a, int[] b){
        Arrays.sort(a);
        Arrays.sort(b);

        int[] novo = new int[Math.min(a.length, b.length)];
        int preenche = 0;
        boolean encontra;
        for(int i=0; i<a.length; i++){
            if(i!=0 && a[i] != a[i-1]){
            encontra = false;
            for(int j=0; j<b.length && !encontra; j++){
                if(a[i]==b[j]) {
                    novo[preenche++] = a[i];
                    encontra = true;
                }
                }
            }
        }

        int[] novoN = new int[preenche];
        System.arraycopy(novo, 0, novoN, 0, preenche);
        return novoN;
    }

}
