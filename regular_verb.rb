# This class handles regular verbs

class RegularVerb

	def initialize (infinitive)
		@infinitive = infinitive.downcase
		set_stem(@infinitive)
	end

	# A method to conjugate a regular verb in present tense
	def present_conjugate
		if defined?(@stem)
			["ich #{@stem}e",
			"du #{@stem}st",
			"er,sie, es #{@stem}t",
			"wir #{@stem}en",
			"ihr #{@stem}t",
			"sie,Sie #{@stem}en"]
		else
			puts "Could not work with the verb: #{@infinitive}"
		end
	end

	# Returns the verb in infinitive form
	def to_s
		"Verb: #{@infinitive}"
	end
	
	private

	def set_stem(infinitive)
		@stem = infinitive.slice(0,infinitive.length - 2) if infinitive.end_with?('en')
		@stem = infinitive.slice(0,infinitive.length - 1) if infinitive.end_with?('n') && ! infinitive.end_with?('en')
	end
end