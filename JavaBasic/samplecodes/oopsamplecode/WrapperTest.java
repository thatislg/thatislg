import java.lang.*;
import java.util.*;

public class WrapperTest {
    static void example1(){
         // Đổi int thành Integer
         int a = 20;
         Integer i = Integer.valueOf(a);// đổi int thành Integer
         Integer j = a;// autoboxing, tự động đổi int thành Integer trong nội bộ trình biên dịch
  
         System.out.println(a + " " + i + " " + j);
    }
    
    static void example2(){
        // đổi Integer thành int
        Integer a = new Integer(3);
        int i = a.intValue();// đổi Integer thành int
        int j = a;// unboxing, tự động đổi Integer thành int trong nội bộ trình biên dịch
 
        System.out.println(a + " " + i + " " + j);
    }


    public static void main(String[] args) {
        example1();
        example2();
    }
}
