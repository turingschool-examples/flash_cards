require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require 'pry'

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

if File.exists?("#{deck_name}"
  deck = Deck.new(cards)
  #round start?
else
  puts "File not found, try again."
end



puts pause
