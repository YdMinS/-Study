package 알고리즘문제풀이.시뮬레이션_구현;

import java.lang.*;
import java.io.*;
import java.math.BigInteger;

public class baekjoon2238 {

    public static void main(String[] args) throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BigInteger A = new BigInteger(br.readLine());
        BigInteger B = new BigInteger(br.readLine());
        System.out.println(A.add(B));
        System.out.println(A.subtract(B));
        System.out.println(A.multiply(B));
    }
}
