package Ficha2;

import java.util.Arrays;
import java.util.Random;

public class Exe7 {
    private int[] chave_random;
    private int[] estrelas_random;

    public void gera(){
        this.chave_random = new int[5];
        this.estrelas_random = new int[2];
        Random random = new Random();
        int i;
        for(i=0; i<5; i++)
            this.chave_random[i] = (int) (Math.random() * 50 + 1);
        for(i=0; i<2; i++)
            this.estrelas_random[i] = (int) (Math.random() * 9 + 1);
        Arrays.sort(this.chave_random);
        Arrays.sort(this.estrelas_random);
    }

    public Boolean resultado(int[] chave, int[] estrelas){
        return Arrays.compare(chave, this.chave_random) == 0 && Arrays.compare(estrelas, this.estrelas_random) == 0;
    }

    public StringBuilder iguais(int[] chave, int[] estrelas){
        StringBuilder s = new StringBuilder();
        int i;

        for(i=0; i<5; i++) {
            if(chave[i]==this.chave_random[i]) {
                s.append("(");
                s.append(chave[i]);
                s.append(") ");
            }
        }

        for(i=0; i<2; i++) {
            if(estrelas[i]==this.estrelas_random[i]) {
                s.append("*");
                s.append(estrelas[i]);
                s.append("* ");
            }
        }
        return s;
    }

    //public String mostraChave(){ // Função de teste usada apenas para verificar se está a gerar corretamente
    //    return Arrays.toString(this.chave_random);
    //}

    //public String mostraesltrela(){ // Função de teste usada apenas para verificar se está a gerar corretamente
    //    return Arrays.toString(this.estrelas_random);
    //}


}
