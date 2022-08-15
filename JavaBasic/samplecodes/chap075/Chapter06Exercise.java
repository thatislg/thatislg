package samplecodes.chap075;

import java.util.*;

// Question 6.1
class FloatDivide{
    static float input_divisor, input_dividend;

    static Scanner sc =  new Scanner(System.in);

    // Get the input from keyboard
    static void inputNumber(){
        System.out.println("割られる小数を入力してください");
        input_divisor = sc.nextFloat();

        System.out.println("割る小数を入力してください");
        input_dividend = sc.nextFloat();   
    }

    void showResult(){
        float result = input_divisor / input_dividend;
        System.out.println("割り算の結果 = " + result);
    }
}

// Question 6.2
class LastWordMatch{
    static Scanner sc = new Scanner(System.in);

    static String input_Str, input_LastIndex;

    // Get the input string from keyboard
    static void inputYourString(){
        System.out.println("文字列を入力してください");
        input_Str = sc.nextLine();

        System.out.println("末尾の文字を入力してください");
        input_LastIndex = sc.nextLine();
    }

    void showResult(){
        int len_LastIndex = input_LastIndex.length();
        int len_Str = input_Str.length();
        int start_pos = len_Str - len_LastIndex;

        String compare_Str  = input_Str.substring(start_pos);

        if(compare_Str.equals(input_LastIndex))
        {
            System.out.println("True");
        }else{
            System.out.println("False");
        }
    }
    
}

// Question 6.3
class NextChar{
    static char input_c;

    static Scanner sc =  new Scanner(System.in);

    // Get the input from keyboard
    static void inputChar(){
        System.out.println("文字を 1 文字入力してください");
        input_c = sc.next().charAt(0);
    }
    
    void showResult(){
        char result = (char) (input_c + 1)  ;
        System.out.println("文字コードに+1した文字 = " + result);
    }
}

// Question 6.4
class TriangleArea{
    static float input_h, input_b;

    static Scanner sc =  new Scanner(System.in);

    // Get the input from keyboard
    static void inputNumber(){
        System.out.println("底辺を入力してください");
        input_b= sc.nextFloat();

        System.out.println("高さを入力してください");
        input_h = sc.nextFloat();   
    }

    void showResult(){
        float result = (input_b * input_h) / 2;
        System.out.println("面積 = " + result);
    }
}

// Main program
public class Chapter06Exercise {

    static void showResult(){

        Scanner sc =  new Scanner(System.in);

        System.out.println("PROGRAM MENU: ");
        System.out.println("1. FLoatDivide");
        System.out.println("2. LastWordMatch");
        System.out.println("3. NextChar");
        System.out.println("4. TriangleArea");
        System.out.println("Choose and input from 1 to 4");
        int choice = sc.nextInt();

        switch(choice){
            case 1:
                // Question 1
                final FloatDivide fd = new FloatDivide();
                fd.inputNumber();
                fd.showResult();
                break;
            case 2:
                // Question 2
                final LastWordMatch lwm = new LastWordMatch();
                lwm.inputYourString();
                lwm.showResult();
                break;
            case 3:
                // Question 3
                final NextChar nc =  new NextChar();
                nc.inputChar();
                nc.showResult();
                break;
            case 4:
                // Question 4
                final TriangleArea ta = new TriangleArea();
                ta.inputNumber();
                ta.showResult();
                break;
            default:
                System.out.println("End!");
        }    
    }
    public static void main(String[] args) {
        showResult();
    }
}
