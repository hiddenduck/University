package Ficha5;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

public class GestãoEncomendas {

    private Map<Integer, Encomenda> encomendas;

    public GestãoEncomendas() {
        this.encomendas = new HashMap<>();
    }

    public GestãoEncomendas(Map<Integer, Encomenda> mapa){
        this.setEncomendas(mapa);
    }

    public GestãoEncomendas(GestãoEncomendas gestãoEncomendas){
        this.encomendas = gestãoEncomendas.getEncomendas();
    }

    public void setEncomendas(Map<Integer, Encomenda> mapa){
        this.encomendas = new HashMap<>();
        this.encomendas = mapa.entrySet().stream().collect(Collectors.toMap(e -> e.getKey(), e -> e.getValue().clone()));
    }

    public Map<Integer, Encomenda> getEncomendas() {
        return this.encomendas.entrySet().stream().collect(Collectors.toMap(e -> e.getKey(), e -> e.getValue().clone()));
    }

    public GestãoEncomendas clone(){
        return new GestãoEncomendas(this);
    }

    public String toString() {
        return "GestãoEncomendas{" +
                "encomendas=" + encomendas +
                '}';
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GestãoEncomendas that = (GestãoEncomendas) o;
        return encomendas.equals(that.encomendas);
    }

    public Set<Integer> todosCodigosEnc(){
        return new HashSet<>(this.encomendas.keySet());
    }

    public void addEncomenda(Encomenda enc){
        this.encomendas.put(enc.getNEnc(), enc);
    }

    public Encomenda getEncomenda(Integer codEnc){
        return this.encomendas.get(codEnc).clone();
    }

    public void removeEncomenda(Integer codEnc){
        this.encomendas.remove(codEnc);
    }

    public Integer encomendaComMaisProdutos(){
        int maior = 0, atual;
        int maiorEnc = 0;
        for(Encomenda encomenda: this.encomendas.values()){
            atual = encomenda.getLinhas().stream().mapToInt(LinhaEncomenda::getQuantidade).reduce(0, Integer::max);
            if (maior < atual)
                maior = atual;
                maiorEnc = encomenda.getNEnc();
        }

        return maiorEnc;
    }

}
