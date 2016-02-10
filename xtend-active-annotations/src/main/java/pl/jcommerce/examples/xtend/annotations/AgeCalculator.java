package pl.jcommerce.examples.xtend.annotations;

import java.time.LocalDate;

import com.google.common.base.Preconditions;

public class AgeCalculator {

	public static final int calculateAge(LocalDate birthDate) {
		Preconditions.checkNotNull(birthDate, "birthDate cannot be null");
		final LocalDate today = LocalDate.now();
		Preconditions.checkNotNull(birthDate.isBefore(today), "birthDate cannot be from future");
		return birthDate.until(today).getYears();
	}

}
