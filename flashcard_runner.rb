 require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


puts "Welcome! You're playing with 4 cards."

puts "-"*80

print "> "
door = $stdin.gets.chomp

puts "This is card number 1 out of 4."

print "> "
door = $stdin.gets.chomp

puts Question: What is 5 + 5?

 if response == 10
   puts "Correct!"
 end
