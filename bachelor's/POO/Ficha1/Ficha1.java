package com.Ficha1;

public class Ficha1 {
    public double celsiusParaFarenheit(double graus){ // F = C x 1,8 + 32
        return graus * 1.8 + 32;
    }

    public int maximoNumeros(int a, int b){
        return Math.max(a,b);
    }

    public String criaDescricaoConta(String nome, double saldo){
        return "Nome: " + nome + ", saldo: " + saldo;
    }

    public double eurosParaLibras(double valor, double taxaConversao){ // libras = euros * taxa
        return valor * taxaConversao;
    }

    public long factorial(int num){
        int r = 1, i;

        for(i=2; i<=num; i++)
            r *= i;

        return r;
    }

    public double media(double primeiro, double segundo){
        return (primeiro+segundo)/2;
    }

    public long tempoGasto(){
        long tempoAntes = System.nanoTime();
        factorial(5000);
        return tempoAntes - System.nanoTime();
    }
}
