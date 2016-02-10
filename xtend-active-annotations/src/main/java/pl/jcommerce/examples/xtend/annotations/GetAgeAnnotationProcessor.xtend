package pl.jcommerce.examples.xtend.annotations

import org.eclipse.xtend.lib.macro.AbstractFieldProcessor
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.MutableFieldDeclaration
import org.eclipse.xtend.lib.macro.declaration.Visibility
import java.time.LocalDate
import org.eclipse.xtend.lib.macro.declaration.AnnotationReference

class GetAgeAnnotationProcessor extends AbstractFieldProcessor {
	
	override doTransform(MutableFieldDeclaration annotatedField, extension TransformationContext context) {
		
		if (!annotatedField.type.name.equals(typeof(LocalDate).name)) {
			val AnnotationReference getAgeAnnotation = annotatedField.findAnnotation(findTypeGlobally(typeof(GetAge)))
			addError(getAgeAnnotation, typeof(GetAge).name + " annotation is allowed only for fields with type " + typeof(LocalDate).name)
		} else {
			annotatedField.declaringType.addMethod('getAgeFrom' + annotatedField.simpleName.toFirstUpper)
			[
				visibility = Visibility.PUBLIC
				returnType = newTypeReference(typeof(int))
				body = '''
					return pl.jcommerce.examples.xtend.annotations.AgeCalculator.calculateAge(«annotatedField.simpleName»);
				'''
			]
		}
	}
	
}