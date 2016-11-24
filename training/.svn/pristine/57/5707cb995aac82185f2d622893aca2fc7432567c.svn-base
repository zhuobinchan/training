package test;

import java.util.List;

import javassist.expr.NewArray;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ehighsun.training.dao.BaseDao;
import com.ehighsun.training.pojo.Administrator;
import com.ehighsun.training.pojo.Person;
import com.ehighsun.training.pojo.Student;


public class Test {
	
	private static ApplicationContext ctx = new ClassPathXmlApplicationContext(
			"applicationContext.xml");
	static BaseDao personDao = (BaseDao) ctx
			.getBean("baseDao");
	
	public static void main(String[] args) {
		
		Person person = new Administrator();
		
		Administrator admin = null;
		
		String account = "123";
		String password = "123";
		
//		List<Person> persons = (List<Person>) personDao.find("from Person where accountNum=? and password=?",new Object[] {account,password});
		
//		List<Administrator> persons = (List<Administrator>) personDao.find("from Person");
		
		List<?> persons = personDao.find("from Person");
		
		
		
//		Person person1 = (Person) personDao.get(new Person(), 1);
//		
//		person1.setPid(2);
//		person1.setAccountNum("321");
//		personDao.save(person1);
//		personDao.delete(person1);
//		System.out.println(person1.getRole());
		
		System.out.println(persons.get(2).getClass().getSimpleName());
		
//		if(persons != null){
//			
//			admin = (Administrator) persons.get(0);
//
//			System.out.println(persons.size());
//		}
		
	}

}
