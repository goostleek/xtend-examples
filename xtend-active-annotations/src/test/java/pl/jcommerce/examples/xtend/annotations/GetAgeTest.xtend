package pl.jcommerce.examples.xtend.annotations

import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

class GetAgeTest {
	
	extension XtendCompilerTester compilerTester = XtendCompilerTester.newXtendCompilerTester(class.classLoader)

	@Test
	def void getAgeTest() {
		'''
			import pl.jcommerce.examples.xtend.annotations.GetAge
			
			class Person {
				@GetAge
				private java.time.LocalDate birthDate
			}
			
		'''.assertCompilesTo(
		'''
			import java.time.LocalDate;
			import pl.jcommerce.examples.xtend.annotations.GetAge;

			@SuppressWarnings("all")
			public class Person {
			  @GetAge
			  private LocalDate birthDate;
			  
			  public int getAgeFromBirthDate() {
			    return pl.jcommerce.examples.xtend.annotations.AgeCalculator.calculateAge(birthDate);
			  }
			}
		''')
	}
}
