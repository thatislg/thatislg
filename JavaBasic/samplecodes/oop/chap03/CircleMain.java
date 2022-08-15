package samplecodes.oop.chap03;

import java.math.BigDecimal;
import java.util.Scanner;

public class CircleMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // Input circle_R
        System.out.println("半径を入力してください。");
        BigDecimal input  = sc.nextBigDecimal();
        Circle c = new Circle(input);
        
        // Show the results
        System.out.println("円周: = " + c.getCircle_Perimeter());
        System.out.println("面積: = " + c.getCircle_Area());
   
    }
}
