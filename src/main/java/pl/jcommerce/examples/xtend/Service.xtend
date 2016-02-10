package pl.jcommerce.examples.xtend

import pl.jcommerce.examples.xtend.Person
import java.time.LocalDate
import javax.inject.Inject
import javax.persistence.EntityManager

class Service {
	
	@Inject
	extension EntityManager em;
	
	def createUser(String firstName, String lastName, LocalDate birthDate) {
		val user = new Person(firstName, lastName, birthDate)
		user.persist();
	}

	def findUser(Long id) {
		em.find(typeof(Person), id)
	}
}