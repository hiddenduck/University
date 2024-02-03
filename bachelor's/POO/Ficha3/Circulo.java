import java.util.Objects;

public class Circulo {
    private double x;
    private double y;
    private double raio;

    public Circulo(){
        this.x = this.y = 0;
        this.raio = 1;
    }

    public Circulo(double x, double y, double raio){
        this.x = x;
        this.y = y;
        this.raio = raio;
    }

    public Circulo(Circulo c){
        this.x = getX();
        this.y = getY();
        this.raio = getRaio();
    }

    public double getX() {
        return this.x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return this.y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getRaio() {
        return this.raio;
    }

    public void setRaio(double raio) {
        this.raio = raio;
    }

    public void alteraCentro(double x, double y){
        this.setX(x);
        this.setY(y);
    }

    public double calculaArea(){
        return Math.PI * Math.pow(this.getRaio(), 2);
    }

    public double calculaPerimetro(){
        return 2 * Math.PI * getRaio();
    }

    public String toString() {
        return "Circulo{" +
                "x=" + this.x +
                ", y=" + this.y +
                ", raio=" + this.raio +
                '}';
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || this.getClass() != o.getClass()) return false;
        Circulo circulo = (Circulo) o;
        return circulo.getX() == this.x  && circulo.getY() == y && circulo.getRaio() == raio; // tipos primitivos
    }

    public Circulo clone(){
        return new Circulo(this);
    }

}
