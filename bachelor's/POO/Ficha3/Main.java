import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Insira o número do exercício:");

        switch (sc.nextInt()) {
            case 1:
                Circulo circulo = null;
                String lido_1 = "";
                boolean valido_1 = false;
                while(!lido_1.equals("0")) {
                    System.out.println("Escolha a alínea:");
                    switch (lido_1 = sc.next()) {
                        case "criar":
                            System.out.println("Escolha a posição x:");
                            double x = sc.nextInt();
                            System.out.println("Escolha a posição y:");
                            double y = sc.nextInt();
                            System.out.println("Escolha o raio:");
                            double raio = sc.nextDouble();
                            circulo = new Circulo(x, y, raio);
                            valido_1 = true;
                            break;

                        case "a":
                            if (valido_1){
                                System.out.println("Escolha o novo x:");
                            double x_a = sc.nextDouble();
                            System.out.println("Escolha o novo y:");
                            double y_a = sc.nextDouble();
                            System.out.print("O circulo de posições (" + circulo.getX() + ", " + circulo.getY() + ") e raio " + circulo.getRaio());
                            circulo.alteraCentro(x_a, y_a);
                            System.out.println(" moveu-se para a posição (" + circulo.getX() + ", " + circulo.getY() + ")");
                            }else
                                System.out.println("Circulo não inicializado!");
                            break;

                        case "b":
                            if(valido_1)
                                System.out.print("Área do circulo de posições (" + circulo.getX() + ", " + circulo.getY() + ") e raio " + circulo.getRaio() + ": " + circulo.calculaArea());
                            else
                                System.out.println("Circulo não inicializado!");
                            break;

                        case "c":
                            if(valido_1)
                                System.out.print("Perímetro do circulo de posições (" + circulo.getX() + ", " + circulo.getY() + ") e raio " + circulo.getRaio() + ": " + circulo.calculaPerimetro());
                            else
                                System.out.println("Circulo não inicializado!");
                            break;
                    }
                }
                break;
                
            case 7:
                LinhaDeEncomenda linhaDeEncomenda = null;
                boolean valido = false;
                String lido = sc.nextLine();
                String erro = "Linha não inicializada!";
                while(!lido.equals("0")) {
                    System.out.println("Escolha a alínea:");
                    switch (lido = sc.nextLine()) {
                        case "a":
                            System.out.println("----- Criação da Linha de encomenda -----\n");
                            System.out.println("Referência do produto:");
                            String refe = sc.next();
                            System.out.println("Descrição do produto:");
                            String descr = sc.next();
                            System.out.println("Preço do produto:");
                            double precoAntes = sc.nextDouble();
                            System.out.println("Quantidade encomendada:");
                            int quantidade = sc.nextInt();
                            System.out.println("Imposto:");
                            double imposto = sc.nextDouble();
                            System.out.println("Desconto comercial:");
                            double descontoComercial = sc.nextDouble();
                            linhaDeEncomenda = new LinhaDeEncomenda(refe, descr, precoAntes, quantidade, imposto, descontoComercial);
                            valido = true;
                            System.out.println("----- Linha de encomenda criada -----\n");
                            break;

                        case "b":
                            if(valido)
                                System.out.printf("Valor de venda do produto '%s': %.2f euros\n", linhaDeEncomenda.getDescr(), linhaDeEncomenda.calculaValorLinhaEnc());
                            else
                                System.out.println(erro);
                            break;

                        case "c":
                            if(valido)
                                System.out.printf("Valor do desconto: %.2f euros\n", linhaDeEncomenda.calculaValorDesconto());
                            else
                                System.out.println(erro);
                            break;
                        default:
                            System.out.println("Caso queira terminar digite: 0");
                            break;
                    }
                }
                break;
        }
    }
}
