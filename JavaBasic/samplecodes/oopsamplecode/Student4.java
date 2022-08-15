// Constructor with argument
public class Student4{
	int id;
	String name;

	private String first_name, last_name;
	private int salary;

	
	Student4(int id, String name){
		// when agruments name as the same as properties nam
		// have to use this
		this.id = id;
		this.name = name;
	}

	
	void set_Salary(int main_Salary, int bonus){
		this.salary = main_Salary + bonus;
	}

	void seperate_name(){
		String str1 = ""; 
		String str2 = "";
		int len_name = name.length();

		for(int i = 0; i < len_name; i++){
			char c = name.charAt(i);
			if(c <= '9' && c >= '0'){
				str1 += String.valueOf(c);
			} else {
				str2 += String.valueOf(c);
			}
		}

		this.first_name = str1;
		this.last_name = str2;
	}

	void display(){
		System.out.println(id + " " + name + " " + salary);
		System.out.println(first_name + " " + last_name);
	}
	
	public static void main(String args[]){
		Student4 s1 = new Student4(111,"Viet55555");
		s1.set_Salary(500000, 30000);
		s1.seperate_name();
		
		s1.display();
		

	}	
}
