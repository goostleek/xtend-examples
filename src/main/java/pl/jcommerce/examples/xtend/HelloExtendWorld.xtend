package pl.jcommerce.examples.xtend

import java.time.LocalDate

public class HelloExtendWorld {

	def static void main(String[] args) {
		val me = new Person("Marcin", "Kłopotek", LocalDate.of(1980, 8, 11))
		println(me.toString)
		println("Ich bin " + me.ageFromBirthDate + " Jahre alt.")
	}
	
}