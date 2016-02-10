package pl.jcommerce.examples.xtend.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

import org.eclipse.xtend.lib.macro.Active;

/**
 * Generates method to calculate age for the given LocalDate class member
 */
@Target(ElementType.FIELD)
@Active(GetAgeAnnotationProcessor.class)
public @interface GetAge {
	//
}
