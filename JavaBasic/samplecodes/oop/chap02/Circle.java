package samplecodes.oop.chap02;

import java.math.BigDecimal;
import java.util.Scanner;

public class Circle {
    private BigDecimal circle_R, circle_Area, circle_Perimeter ;

    // Set pi = 3.14
    private final BigDecimal pi = new BigDecimal("3.14");
    
    public BigDecimal getCircle_R() {
        return circle_R;
    }

    public BigDecimal getCircle_Perimeter() {
        return circle_Perimeter;
    }

    public BigDecimal getCircle_Area() {
        return circle_Area;
    }
    
    public void setCircle_CircleR(BigDecimal circle_R) {
        this.circle_R = circle_R;
    }
    
    // calcualate perimeter of Circle
    public void setCirclePerimeter() {
        this.circle_Perimeter = this.circle_R.multiply(pi).multiply(new BigDecimal("2"));
    }

    // calcualate area of Circle
     public void setCircleArea() {
        this.circle_Area = this.circle_R.pow(2).multiply(pi);
    }


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
