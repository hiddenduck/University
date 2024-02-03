package Ficha4;
import Ficha3.LinhaDeEncomenda;
import Ficha5.LinhaEncomenda;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class EncEficiente {
    private String nomeCliente;
    private int numFiscalCliente;
    private String moradaCliente;
    private int numEnc;
    private String dataEnc;
    private ArrayList<LinhaDeEncomenda> linhasEnc;

    public EncEficiente(String nomeCliente, int numFiscalCliente, String moradaCliente, int numEnc, String dataEnc, ArrayList<LinhaDeEncomenda> linhasEnc) {
        this.nomeCliente = nomeCliente;
        this.numFiscalCliente = numFiscalCliente;
        this.moradaCliente = moradaCliente;
        this.numEnc = numEnc;
        this.dataEnc = dataEnc;
        this.setLinhasEnc(linhasEnc);
    }

    public EncEficiente() {
        this.nomeCliente = "Unknown";
        this.numFiscalCliente = -1;
        this.moradaCliente = "Unknown";
        this.numEnc = -1;
        this.dataEnc = "Unknown";
        this.linhasEnc = new ArrayList<>();
    }

    public EncEficiente(EncEficiente encEficiente) {
        this.nomeCliente = encEficiente.getNomeCliente();
        this.numFiscalCliente = encEficiente.getNumFiscalCliente();
        this.moradaCliente = encEficiente.getMoradaCliente();
        this.numEnc = encEficiente.getNumEnc();
        this.dataEnc = encEficiente.getDataEnc();
        this.linhasEnc = encEficiente.getLinhasEnc();
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public int getNumFiscalCliente() {
        return numFiscalCliente;
    }

    public void setNumFiscalCliente(int numFiscalCliente) {
        this.numFiscalCliente = numFiscalCliente;
    }

    public String getMoradaCliente() {
        return moradaCliente;
    }

    public void setMoradaCliente(String moradaCliente) {
        this.moradaCliente = moradaCliente;
    }

    public int getNumEnc() {
        return numEnc;
    }

    public void setNumEnc(int numEnc) {
        this.numEnc = numEnc;
    }

    public String getDataEnc() {
        return dataEnc;
    }

    public void setDataEnc(String dataEnc) {
        this.dataEnc = dataEnc;
    }

    public ArrayList<LinhaDeEncomenda> getLinhasEnc() {
        return linhasEnc.stream().map(LinhaDeEncomenda::clone).collect(Collectors.toCollection(ArrayList::new));
    }

    public void setLinhasEnc(ArrayList<LinhaDeEncomenda> linhasEnc) {
        this.linhasEnc = linhasEnc.stream().map(LinhaDeEncomenda::clone).collect(Collectors.toCollection(ArrayList::new));
    }

    public EncEficiente clone(){
        return new EncEficiente(this);
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EncEficiente that = (EncEficiente) o;
        return numFiscalCliente == that.numFiscalCliente && numEnc == that.numEnc && Objects.equals(nomeCliente, that.nomeCliente) && Objects.equals(moradaCliente, that.moradaCliente) && Objects.equals(dataEnc, that.dataEnc) && Objects.equals(linhasEnc, that.linhasEnc);
    }


    public double calculaValorTotal(){
        double resultado = 0;

        for(LinhaDeEncomenda linhaDeEncomenda: this.linhasEnc){
            resultado += linhaDeEncomenda.calculaValorLinhaEnc();
        }

        return resultado;
    }

    public double calculaValorTotalStream(){
        return this.linhasEnc.stream().mapToDouble(LinhaDeEncomenda::calculaValorLinhaEnc).sum();
    }

    public double calculaValorDesconto(){
        return this.linhasEnc.stream().mapToDouble(LinhaDeEncomenda::calculaValorDesconto).sum();
    }

    public int numeroTotalProdutos(){
        return this.linhasEnc.stream().mapToInt(LinhaDeEncomenda::getQuantidade).sum();
    }

    public boolean existeProdutoEncomenda(String refProduto){
        return this.linhasEnc.stream().anyMatch(a -> Objects.equals(a.getRefe(), refProduto));
    }

    public void adicionaLinha(LinhaDeEncomenda linha){
        this.linhasEnc.add(linha.clone());
    }

    public void removeProduto(String codProd){
        this.linhasEnc.removeIf(linhaDeEncomenda -> Objects.equals(linhaDeEncomenda.getRefe(), codProd));
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("EncEficiente{")
                .append(nomeCliente).append('\'')
                .append(", numFiscalCliente='").append(numFiscalCliente)
                .append(", moradaCliente='").append(moradaCliente)
                .append('\'').append(", numEnc=")
                .append(numEnc).append(", dataEnc='")
                .append(dataEnc).append('\'');

        stringBuilder.append(", linhas de encomenda: \n");
        for(LinhaDeEncomenda linhaEncomenda: this.linhasEnc){
            stringBuilder.append(linhaEncomenda.toString()).append('\n');
        }
        
        return stringBuilder.toString();
    }
}
