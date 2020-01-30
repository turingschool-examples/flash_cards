require './card'

print "Enter a new card question: "
question = gets.chomp

print "\nEnter question answer: "
answer = gets.chomp

print "\nEnter category of question: "
category = gets.chomp.capitalize.to_sym
