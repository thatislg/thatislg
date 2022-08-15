package samplecodes.chap08;

import java.util.*;

import javax.swing.plaf.multi.MultiDesktopIconUI;

import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

// Example 
class Afterday{
    static Scanner sc = new Scanner(System.in);

    static String dateCount; 
    static Calendar calendar = Calendar.getInstance();

    static void getInput(){
        System.out.println("日数を入力してください");
        dateCount = sc.nextLine();
    }

    void settingDatetime(){
        calendar.clear();
        calendar.set(Calendar.YEAR, 2014);
        calendar.set(Calendar.MONTH, 0);
        calendar.set(Calendar.DATE, 1);

        calendar.add(Calendar.DATE, Integer.parseInt(dateCount));

        Date date = calendar.getTime();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
        String dateString = dateFormat.format(date);
        System.out.println(dateString);
    }

}

// Question 1
class Tomorrow{
    static Scanner sc = new Scanner(System.in);

    static String input_Date; 

    static Calendar calendar = Calendar.getInstance();

    static void getInput(){
        System.out.println("年月日を入力してください");
        input_Date = sc.nextLine();
    }

    void settingDate(){
        //calendar.clear();
        try {
            // Setting format for inputDate
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

            // Use above format to assign to date
            Date date = dateFormat.parse(input_Date);
            
            calendar.clear();
            calendar.setTime(date);             // Set calendar with input date
            calendar.add(Calendar.DATE, 1);     // Add one to input date
            date = calendar.getTime();          // Assign back to date

            // Show the result
            System.out.println("指定された年月日の翌日 = " + dateFormat.format(date));

        } catch (Exception e) {
            System.out.println("Get Error = " + e);
        }
    }
}

// Question 2
class AfterTime{
    static Scanner sc = new Scanner(System.in);

    static Calendar calendar = Calendar.getInstance();
    static int inputOK, minCount;

    static void getInput(){
        do {
            System.out.println("分を入力してください");
            minCount = sc.nextInt();

            inputOK = 0;

            if(minCount >= 0 && minCount <= 1439){
                inputOK  += 1;
            }else{
                System.out.println("分を再入力してください");
            }
        } while(inputOK  == 0);    
    }

    void showResult(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("mm");
        
        try {
            Date inputTime = dateFormat.parse(String.valueOf(minCount));
            dateFormat = new SimpleDateFormat("HH : mm");

            System.out.println(dateFormat.format(inputTime));

        } catch (ParseException e) {
            e.printStackTrace();
        }
        
    }
}

// Question 3
class MaxDay{
    static Scanner sc = new Scanner(System.in);

    static int inputYear, inputMonth; 
    static Calendar calendar = Calendar.getInstance();

    static void getInput(){
        System.out.println("年を入力してください");
        inputYear = sc.nextInt();

        System.out.println("月を入力してください");
        inputMonth = sc.nextInt();
    }

    void showResult(){
        calendar.clear();

        calendar.set(Calendar.YEAR, inputYear);
        calendar.set(Calendar.MONTH, inputMonth - 1);
        
        int maxDay = calendar.getActualMaximum(Calendar.DATE);
        System.out.println(maxDay);
    }
}
public class Chapter07Exercise {
    static void showResult(){

        Scanner sc =  new Scanner(System.in);

        System.out.println("PROGRAM MENU: ");
        System.out.println("1. Afterday");
        System.out.println("2. Tomorrow");
        System.out.println("3. AfterTime");
        System.out.println("4. MaxDay");
        System.out.println("Choose and input from 1 to 4");
        int choice = sc.nextInt();

        switch(choice){
            case 1:
                // Question 1
                Afterday ad = new Afterday();
                ad.getInput();
                ad.settingDatetime();
                break;
            case 2:
                // Question 2
                Tomorrow tm = new Tomorrow();
                tm.getInput();
                tm.settingDate();
                break;
            case 3:
                // Question 3
                AfterTime at = new AfterTime();
                at.getInput();
                at.showResult();
                break;
            case 4:
                // Question 4
                MaxDay md = new MaxDay();
                md.getInput();
                md.showResult();
                break;
            default:
                System.out.println("End!");
        }    
    }

    public static void main(String[] args) {
        showResult();
    }
}
