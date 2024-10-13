package 알고리즘문제풀이.그래프탐색;

import java.util.*;
import java.lang.*;
import java.io.*;

public class baekjoon1927 {
    static BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
    static int N;

    public static void main(String[] args) throws IOException{
        input();
        bw.flush();
        bw.close();
    }

    private static void input() throws IOException{
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        N = Integer.parseInt(br.readLine());
        PriorityQueue<Integer> pq = new PriorityQueue<>();
        int num;
        for(int i=0; i<N; i++){
            num = Integer.parseInt(br.readLine());
            if(num==0){
                if(pq.isEmpty()){
                    bw.write("0\n");
                } else {
                    bw.write(pq.poll()+"\n");
                }
            } else {
                pq.offer(num);
            }
        }
        br.close();
    }
}
