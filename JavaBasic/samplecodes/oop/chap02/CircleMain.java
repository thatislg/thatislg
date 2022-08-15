package samplecodes.oop.chap02;

import java.util.Scanner;

public class CircleMain {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Circle c = new Circle();

        // Input circle_R
        System.out.println("半径を入力してください。");
        c.setCircle_CircleR(sc.nextBigDecimal());
        c.setCirclePerimeter();
        c.setCircleArea();
        
        // Show the results
        System.out.println("円周: = " + c.getCircle_Perimeter());
        System.out.println("面積: = " + c.getCircle_Area());
   
    }
}
