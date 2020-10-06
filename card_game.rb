#This is where I build the flash card program.
#It will take user input, and generate a deck of flash cards.
require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'

puts "Welcome to the Flash Card Generator.\n\n"
puts "Following a few simple instructions,
you can create a deck of flash cards to study.
or a fun game of Trivia.  You decide.\n\n"

puts "First, you need a .txt document with the flash card info.
Follow the instructions in the readme.txt file to setup the
.txt file.\n\n"

print "Hit Enter to Continue."
pause = gets.chomp

puts "Great! Now type the name of the .txt file below."

print "file: "
deck_name = gets.chomp

puts "Alright, time to create your #{deck_name} deck!"

puts "processing..."

puts pause
