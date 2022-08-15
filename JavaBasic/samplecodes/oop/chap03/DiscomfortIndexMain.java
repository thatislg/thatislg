package samplecodes.oop.chap03;

import java.util.Scanner;

public class DiscomfortIndexMain {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("気温を入力してください。");
        int temperature = Integer.parseInt(scanner.nextLine());

        System.out.println("湿度を入力してください。");
        int humidity = Integer.parseInt(scanner.nextLine());

        DiscomfortIndex discomfortIndex = new DiscomfortIndex(temperature, humidity);
        
        System.out.println("不快指数:" + discomfortIndex.indexValue());
        System.out.println("体感:" + discomfortIndex.feel());
    }
}
