// Constructor with argument
public class Student4{
	int id;
	String name;
	
	Student4(int id, String name){
		// when agruments name as the same as properties nam
		// have to use this
		this.id = id;
		this.name = name;
	}
		
	void display(){
		System.out.println(id + " " + name);
	}
	
	public static void main(String args[]){
		Student4 s1 = new Student4(111,"Viet");
		Student4 s2 = new Student4(222,"Biet");
		
		s1.display();
		s2.display();
	}	
}
