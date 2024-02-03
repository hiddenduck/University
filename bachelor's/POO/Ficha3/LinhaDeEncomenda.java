import java.util.Objects;

public class LinhaDeEncomenda {
    private String refe, descr;
    private double precoAntes;
    private int quantidade;
    private double imposto;
    private double descontoComercial;

    public LinhaDeEncomenda(){
        this.refe = "Unknown";
        this.descr = "Unknown";
        this.precoAntes = 0;
        this.quantidade = 0;
        this.imposto = 0;
        this.descontoComercial = 0;
    }

    public LinhaDeEncomenda(String refe, String descr, double precoAntes, int quantidade, double imposto, double descontoComercial) {
        this.refe = refe;
        this.descr = descr;
        this.precoAntes = precoAntes;
        this.quantidade = quantidade;
        this.imposto = imposto;
        this.descontoComercial = descontoComercial;
    }

    public LinhaDeEncomenda(LinhaDeEncomenda linhaDeEncomenda) {
        this.refe = linhaDeEncomenda.getRefe();
        this.descr = linhaDeEncomenda.getDescr();
        this.precoAntes = linhaDeEncomenda.getPrecoAntes();
        this.quantidade = linhaDeEncomenda.getQuantidade();
        this.imposto = linhaDeEncomenda.getImposto();
        this.descontoComercial = linhaDeEncomenda.getDescontoComercial();
    }


    public String getRefe() {
        return this.refe;
    }

    public void setRefe(String refe) {
        this.refe = refe;
    }

    public String getDescr() {
        return this.descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public double getPrecoAntes() {
        return this.precoAntes;
    }

    public void setPrecoAntes(double precoAntes) {
        this.precoAntes = precoAntes;
    }

    public int getQuantidade() {
        return this.quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public double getImposto() {
        return this.imposto;
    }

    public void setImposto(int imposto) {
        this.imposto = imposto;
    }

    public double getDescontoComercial() {
        return this.descontoComercial;
    }

    public void setDescontoComercial(int descontoComercial) {
        this.descontoComercial = descontoComercial;
    }

    public boolean equals(Object o) {
        if (this == o) return true;

        if (o == null || getClass() != o.getClass()) return false;

        LinhaDeEncomenda l2 = (LinhaDeEncomenda) o;
        return l2.precoAntes==this.precoAntes && this.quantidade == l2.quantidade && this.imposto == l2.imposto && this.descontoComercial == l2.descontoComercial && this.refe.equals(l2.refe) && this.descr.equals(l2.descr);
    }

    public String toString() {
        StringBuilder s = new StringBuilder();
        s.append("LinhaDeEncomenda{");
        s.append("refe='").append(this.refe).append('\'');
        s.append(", descr='").append(this.descr).append('\'');
        s.append(", precoAntes=").append(this.precoAntes).append('\'');
        s.append(",quantidade=").append(this.quantidade).append('\'');
        s.append(", imposto=").append(this.imposto).append('\'');
        s.append(", descontoComercial=").append(this.descontoComercial).append('\'');
        s.append('}');

        return s.toString();
    }

    public LinhaDeEncomenda clone(){
        return new LinhaDeEncomenda(this);
    }

    public double calculaValorLinhaEnc(){
        double antes = this.precoAntes - this.descontoComercial/100*this.precoAntes;
        return (antes + antes*this.imposto/100) * this.quantidade; // * Quantidade?
    }

    public double calculaValorDesconto(){
        return this.precoAntes*this.descontoComercial/100;
    }
}
