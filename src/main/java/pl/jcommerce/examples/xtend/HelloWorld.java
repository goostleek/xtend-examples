package pl.jcommerce.examples.xtend;

import java.time.LocalDate;

public class HelloWorld {

	public static void main(String[] args) {
		final Person me = new Person("Marcin", "Kłopotek", LocalDate.of(1980, 8, 11));
		System.out.println(me);
		System.out.println("Ich bin " + me.getAgeFromBirthDate() + " Jahre alt.");
	}

}
