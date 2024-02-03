package Ficha2;

public class Exe2 {
    private int[][] notasTurma;

    public Exe2(){ // Contructor Default
        this.notasTurma = new int[5][5];
    }

    public int getNota(int aluno, int uc){ // get()
        return this.notasTurma[aluno][uc];
    }

    public void setNota(int aluno, int uc, int nota){ // set()
        this.notasTurma[aluno][uc] = nota;
    }

    public int somaNotasUC(int uc){
        int i, soma=0;
        for(i=0; i<5; i++)
            soma += this.getNota(i, uc);

        return soma;
    }

    public double mediaAluno(int aluno){
        int i, soma = 0;
        for(i=0; i<5; i++)
            soma += getNota(aluno, i);

        return soma/5.0;
    }

    public double mediaUC(int uc){
        return somaNotasUC(uc)/5.0;
    }

    public int[] notasMaisAltas(){
        int i, j;
        int[] notas = new int[5];

        for(i=0; i<5; i++) { // i = uc
            int max_Nota = Integer.MIN_VALUE;
            for (j = 0; j < 5; j++) // j = alunos
                if(getNota(j, i) > max_Nota)
                    max_Nota = getNota(j, i);
            notas[i] = max_Nota;
        }

        return notas;
    }

    public int[] notasMaisBaixas(){
        int i, j;
        int[] notas = new int[5];

        for(i=0; i<5; i++) { // i = uc
            int min_Nota = Integer.MAX_VALUE;
            for (j = 0; j < 5; j++) // j = alunos
                if(getNota(j, i) < min_Nota)
                    min_Nota = getNota(j, i);
            notas[i] = min_Nota;
        }

        return notas;
    }

    public int[] acimaDe(int valor){
        int[] novo = new int[10];
        int n=0, i, j, notaAtual;

        for(i=0; i<5; i++)
            for(j=0; j<5; j++)
                if (this.getNota(i, j) > valor)
                    novo[n++] = this.getNota(i, j);

        int[] novoN = new int[n];
        System.arraycopy(novo, 0, novoN, 0, n);

        return novoN;
    }

    public String todasAsNotas(){
        int i, j;
        String total = "";

        for(i=0; i<5; i++)
            for(j=0; j<5; j++)
            total += getNota(i, j) + ((i==4 && j==4) ? "" : " ");

        return total;
    }

    public int ucComMaiorMedia(){
        double maior = mediaUC(0);
        int i, ind = 0;

        for(i=1; i<5; i++)
            if(mediaUC(i)> maior) {
                maior = mediaUC(i);
                ind = i;
            }

        return ind;
    }

}
