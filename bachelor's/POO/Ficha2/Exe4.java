package Ficha2;

import java.util.Arrays;

public class Exe4 {
    public void arraySort(int[] array){
        Arrays.sort(array);
    }

    public int arrayBinarySearch(int[] array, int i){
        arraySort(array);
        return Arrays.binarySearch(array, i);
    }
}
