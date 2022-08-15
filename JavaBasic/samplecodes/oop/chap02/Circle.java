package samplecodes.oop.chap02;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.Scanner;

public class Circle {
    private BigDecimal circle_R, circle_Area, circle_Perimeter ;

    // Set pi = 3.14
    private final BigDecimal pi = new BigDecimal(Math.PI);
    
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
        MathContext m = new MathContext(3);
        this.circle_Perimeter = this.circle_R.multiply(pi, m).multiply(new BigDecimal("2"));
    }

    // calcualate area of Circle
     public void setCircleArea() {
        MathContext m = new MathContext(3);
        this.circle_Area = this.circle_R.pow(2).multiply(pi, m);
    }
}
