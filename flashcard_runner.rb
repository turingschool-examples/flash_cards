require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'pry'
p "Welcome to the Flash Card Generator."
p "Following a few simple instructions,"
p "you can create a deck of flash cards to study."
p "or a fun game of Trivia.  You decide."
p "First, you need a .txt document with the"
p "flash card info.  Follow the instructions"
p "in the readme.txt file to setup the .txt file."
loop do
  puts "START NEW GAME?"
  p "YES"
  p "NO"
  response = gets.chomp.upcase
  if response == "YES"
    p "If you created a deck, enter the filename.txt here,
    other wise press enter to play with default Deck."
    file = gets.chomp
    if file.empty?
      file = "./cards.txt"
    end
    filename = File.readlines(file)
    cards = CardGenerator.new(filename).cards
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.initialize_setup
    round.start_round
  elsif response == "NO"
    break
  end
end
