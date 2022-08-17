package chap03;

import java.math.BigDecimal;
import java.util.Scanner;

public class EmployeeMain {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("勤続年数を入力してください。");
            BigDecimal input = sc.nextBigDecimal();
            Employee e = new Employee(input);

            System.out.println("給与額は " + e.getKyuuYoGaku()+ " 円です。");
        }
    }
}
