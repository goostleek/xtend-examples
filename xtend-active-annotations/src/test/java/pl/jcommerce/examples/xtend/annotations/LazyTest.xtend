package pl.jcommerce.examples.xtend.annotations

import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

class LazyTest {
	extension XtendCompilerTester compilerTester = XtendCompilerTester.newXtendCompilerTester(class.classLoader)

	@Test def void testLazy() {
		'''
			import pl.jcommerce.examples.xtend.annotations.Lazy
			
			class Person {
				@Lazy String name = expensiveInitializer()
				def expensiveInitializer() {
					'initResult'
				}
			}
			
		'''.assertCompilesTo(
		'''
			import pl.jcommerce.examples.xtend.annotations.Lazy;

			@SuppressWarnings("all")
			public class Person {
			  @Lazy
			  private String name;
			  
			  public String expensiveInitializer() {
			    return "initResult";
			  }
			  
			  private String _initname() {
			    String _expensiveInitializer = this.expensiveInitializer();
			    return _expensiveInitializer;
			  }
			  
			  public String getName() {
			    if (name==null)
			      name = _initname();
			    return name;
			  }
			}
		''')
	}
}
