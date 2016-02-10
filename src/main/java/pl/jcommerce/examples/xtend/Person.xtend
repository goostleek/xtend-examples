package pl.jcommerce.examples.xtend

import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Data
import pl.jcommerce.examples.xtend.annotations.Extract
import pl.jcommerce.examples.xtend.annotations.GetAge

@Data
@Extract
public class Person {
	private String firstName;
	private String lastName;
	@GetAge
	private LocalDate birthDate;
}