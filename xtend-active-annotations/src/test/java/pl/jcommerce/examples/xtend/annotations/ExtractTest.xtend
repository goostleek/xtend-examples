package pl.jcommerce.examples.xtend.annotations

import org.junit.Test
import static org.junit.Assert.*
import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester

class ExtractTest {
	
	extension XtendCompilerTester compilerTester = XtendCompilerTester.newXtendCompilerTester(class.classLoader)
	
	@Test def void testExtractAnnotation() {
		'''
			@pl.jcommerce.examples.xtend.annotations.Extract
			class MyClass {
				override doStuff(String myParam) throws IllegalArgumentException {
					return myParam
				}
			}
		'''.compile [
			val extension ctx = transformationContext
			val interf = findInterface('MyClassInterface')
			val clazz = findClass('MyClass')
			
			assertEquals(clazz.implementedInterfaces.head.type, interf)
			
			interf.declaredMethods.head => [
				assertEquals('doStuff', simpleName)
				assertEquals(string, returnType)
				assertEquals(IllegalArgumentException.newTypeReference, exceptions.head)
			]
		]
	}
}
