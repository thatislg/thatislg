import java.util.*;

public class StringMethodTest{
    static Scanner sc = new Scanner(System.In);

    static String input_String;

    static void inputString(){
        System.out.println("Input your string");
        input_String = sc.nextLine(System.in);
    }
    static void testLengthOfString(){
        System.out.println("Length of string is = " + input_String.length());
    }
    public static void main(String[] args) {
        // Input string to test
        input_String();

        // Show the length
        

    }
}
