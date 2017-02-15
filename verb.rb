require_relative 'regular_verb'

#==Part of Germanizer project
# This class extends RegularVerb to handle irregular verbs too
class Verb < RegularVerb

	$irregular_verbs = %w(sein haben)
	# Supported irregular verbs
	def self.each
		$irregular_verbs.each {|verb| yield verb}
	end

	# A method to conjugate a verb in present tense
	def present_conjugate
		if defined?(@stem)
			# TODO Get irregular verbs from DB
			case @infinitive
				when 'sein'
					present_conjugate_sein
				when 'haben'
					present_conjugate_haben
				else
					super
			end
		else
			puts "Could not work with the verb: #{@infinitive}"
		end
	end

	
	private

	# TODO Get irregular verbs from DB
	def present_conjugate_sein
		['ich bin',
		'du bist',
		'er,sie, es ist',
		'wir sind',
		'ihr seid',
		'sie,Sie sind']
	end
	def present_conjugate_haben
		['ich habe',
		'du hast',
		'er,sie, es hat',
		'wir haben',
		 'ihr habt',
		 'sie,Sie haben',
		 ]
	end
end