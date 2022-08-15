package samplecodes.oop.chap03;

import java.math.BigDecimal;
import java.util.Scanner;

public class PartimerMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Take input from user
        // Jikyu
        System.out.println("時給を入力してください。");
        BigDecimal inputJikyu = sc.nextBigDecimal();

        // KinmuJikan
        System.out.println("時給を入力してください。");
        BigDecimal inputKinmuJikan = sc.nextBigDecimal();

        // Calcualate salary
        Parttimer pt = new Parttimer(inputJikyu, inputKinmuJikan);

        // Show the result
        System.out.println("「給与額は" +  pt.getKyuJyouGaku() + "円");        

    }
}
