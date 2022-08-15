package samplecodes.oop.chap02;

import java.util.Scanner;

public class PartimerMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Parttimer pt = new Parttimer();

        // Take input from user
        // Jikyu
        System.out.println("時給を入力してください。");
        pt.setJikyu(sc.nextBigDecimal());

        // KinmuJikan
        System.out.println("時給を入力してください。");
        pt.setKinmuJikan(sc.nextBigDecimal());

        // Calcualate salary
        pt.setKyuJyouGaku();

        // Show the result
        System.out.println("「給与額は" +  pt.getKyuJyouGaku() + "円");        

    }
}
