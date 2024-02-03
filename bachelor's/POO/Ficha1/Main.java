package com.Ficha1;

import java.util.Scanner;
public class Main {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        Ficha1 ficha = new Ficha1();

        System.out.println("Introduza o número do exercício:");
        switch (input.nextInt()){
            case 1:
                System.out.println("Introduza um valor em Graus:");
                double graus = input.nextDouble();
                System.out.println(graus + "°C são " + ficha.celsiusParaFarenheit(graus) + "°F");
                break;

            case 2:
                System.out.println("Introduza o primeiro número:");
                int first = input.nextInt();
                System.out.println("Introduza o segundo número:");
                int second = input.nextInt();
                System.out.println("Máximo entre " + first + " e " + second + ": " + ficha.maximoNumeros(first, second));
                break;

            case 3:
                System.out.println("Introduza o nome:");
                String nome = input.next();
                System.out.println("Introduza o segundo número:");
                double saldo = input.nextDouble();
                System.out.println(ficha.criaDescricaoConta(nome, saldo));
                break;

            case 4:
                System.out.println("Introduza um valor em euros:");
                double valor = input.nextDouble();
                System.out.println("Introduza a taxa de conversão:");
                double taxa = input.nextDouble();
                System.out.println(valor + " euros são " + ficha.eurosParaLibras(valor, taxa) + " libras");
                break;

            case 5:
                System.out.println("Introduza o primeiro número:");
                int first_5 = input.nextInt();
                System.out.println("Introduza o segundo número:");
                int second_5 = input.nextInt();
                System.out.println("Média entre " + Math.max(first_5, second_5) + " e " + Math.min(first_5, second_5) + ": " + ficha.media(first_5, second_5));
                break;

            case 6:
                System.out.println("Fatorial de " + args[0] + ": " + ficha.factorial(Integer.parseInt(args[0])));
                break;

            case 7:
                System.out.println("total de milissegundos: " + (double) ficha.tempoGasto()/1000000 + " ms");
                break;
        }
    }


}
