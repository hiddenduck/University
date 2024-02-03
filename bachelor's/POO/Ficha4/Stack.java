package Ficha4;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class Stack {
    private int N;
    private ArrayList<String> stack;

    public Stack() {
        this.setN(0);
        this.stack = new ArrayList<>(0);
    }

    public Stack(int n, ArrayList<String> stack) {
        this.setN(n);
        this.setStack(stack);
    }

    public Stack(Stack stack) {
        this.setN(stack.getN());
        this.stack = stack.getStack();
    }

    public int getN() {
        return this.N;
    }

    public void setN(int n) {
        this.N = n;
    }

    public ArrayList<String> getStack() {
        ArrayList<String> novo = new ArrayList<>(this.N);
        novo.addAll(this.stack);

        return novo;
    }

    public void setStack(ArrayList<String> stack) {
        this.stack = new ArrayList<>(this.N);
        this.stack.addAll(stack);
    }

    public String toString() {
        return "Stack{" +
                "N=" + N +
                ", stack=" + stack +
                '}';
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Stack stack1 = (Stack) o;
        return N == stack1.N && this.stack.equals(stack1.stack);
    }

    public Stack clone(){
        return new Stack(this);
    }

    public String top(){
        return this.stack.get(this.N-1);
    }

    public void push(String s){
        this.stack.add(s);
        this.N++;
    }

    public boolean empty(){
        return this.N>0;
    }

    public String pop(){
        if(this.empty()) {
            String removed = this.top();
            this.N--;
            return removed;
        }

        return null;
    }

    public int length(){
        return this.N;
    }

}
