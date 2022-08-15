package samplecodes.oop.chap02;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;

import javax.management.relation.RoleInfo;

import org.w3c.dom.html.HTMLBaseFontElement;

public class TestBigDecimal {
    static BigDecimal i = new BigDecimal("34.78");
    static BigDecimal j = new BigDecimal("34.764");

    public static void main(String[] args) {
        System.out.println(i.setScale(2, RoundingMode.DOWN));
        System.out.println(i.setScale(2, RoundingMode.UP));
        System.out.println(i.setScale(1, RoundingMode.DOWN));
        System.out.println(i.setScale(1, RoundingMode.UP));
        System.out.println(i.setScale(2, RoundingMode.HALF_DOWN));
        System.out.println(i.setScale(2, RoundingMode.HALF_UP));

        System.out.println(j.setScale(3, RoundingMode.FLOOR));
        System.out.println(j.setScale(3, RoundingMode.HALF_UP));
        System.out.println(j.setScale(3, RoundingMode.DOWN));
        System.out.println(j.setScale(2, RoundingMode.FLOOR));
        System.out.println(j.setScale(2, RoundingMode.HALF_UP));
        System.out.println(j.setScale(2, RoundingMode.DOWN));

    }
}
