package pl.jcommerce.examples.xtend

class Expressions {

	def static void main(String[] args) {
		println(if(false) "was true" else 'was false')
		println(if(false) "was true")

		val result = try {
			throw new RuntimeException("evertyhing is expression")
		} catch (Exception e) {
			e.message
		}
		
		println(result)
	}
}
