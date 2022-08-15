import java.util.*;

public class StringMethodTest{
    static Scanner sc = new Scanner(System.in);

    static String input_String;

    // Get the input string from keyboard
    static void inputYourString(){
        System.out.println("Input your string");
        input_String = sc.nextLine();
    }

    // Test the work of length() method in the String class
    static void testLengthOfString(){
        System.out.println("Length of string is = " + input_String.length());
    }

    // Test the work of 
    static void testSubstring(){
        // substring(int begin_position)

        // check from the position inside string length     
        System.out.println("From position 2, new string is = " + 
                            input_String.substring(2));

        // can use input_string.charAt(position) 
        // to take character at special position in string 
        // string in java start at index 0
        System.out.println("At position 0, new string is = " + 
                            input_String.substring(0,1));
        
        // string in java start at index 2
        System.out.println("At position 0, new string is = " +
                            input_String.substring(1,2));

        // string in java start at index = length()
        int length = input_String.length();
        System.out.println("At position 0, new string is = " + 
                            input_String.substring(length - 1));

        // check from the position outside string length
        // It will appear an error
        System.out.println("From position length + 1," + 
                             "new string is = " + input_String.substring(
                             input_String.length() + 1));
    }

    public static void main(String[] args) {
        // Input string to test
        inputYourString();

        // Show the length
        testLengthOfString();

        // Show sub String
        testSubstring();
    }
}
