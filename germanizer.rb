require_relative 'verb'
require 'colorize'

catch :finish do
  100.times do |x|
    #throw :finish if x == 2
    break if x == 2
    puts x + 1
  end
end

40.times {print'-'}

# Print out supported irregular verbs
print "\nSupported irregular verbs: "
Verb.each {|v| print "#{v} "}
print "\n"

# Conjugate supported irregular verbs in present tense
Verb.each do |inf|
	v = Verb.new(inf)
	puts "\n#{v.to_s}".colorize(:blue)
	puts v.present_conjugate
end

# An example of conjugating a regular verb
print "\nRegular verbs:"
v = Verb.new('kaufen')
puts "\n#{v.to_s}".colorize(:green)
puts v.present_conjugate