require_relative 'regular_verb'
require_relative 'db_base'

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

	def self.add_verb
		mydb = DBBase.new
		puts 'This will add a new irregular verb'
		infinitive = ''

		#TODO validate user input
		print "\nEnter verb infinitve:"
		infinitive = gets.chomp.downcase
		verb = Verb.new(infinitive)

		puts ''
		mydb.get_tenses.each { |tense| puts "#{tense['id']}: #{tense['tense']} (#{tense['description']})"}
		print "Enter the number of the tense of your verb (e.g. 1):"
		verb.tense_id = gets.chomp

		puts "\nNow enter verb conjugation with each pronoun in the selected tense"

		print "\nich:"
		verb.ich = gets.chomp.downcase
		print "du:"
		verb.du = gets.chomp.downcase
		print "er:"
		verb.er = gets.chomp.downcase
		print "se (she):"
		verb.sie_she = gets.chomp.downcase
		print "es:"
		verb.es = gets.chomp.downcase
		print "wir:"
		verb.wir = gets.chomp.downcase
		print "ihr:"
		verb.ihr = gets.chomp.downcase
		print "sie (they):"
		verb.sie = gets.chomp.downcase
		print "Sie (formal):"
		verb.sie_formal = gets.chomp.downcase

		mydb.insert_veb(verb)
	end

	private

	# TODO Get and save irregular verbs from/to DB
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