require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'pry'

p "Welcome to the Flash Card Generator!"
loop do
  puts "START NEW GAME?"
  p "YES"
  p "NO"
  response = gets.chomp.upcase
  if response == "YES"
    p "If you created a deck, enter the filename.txt here,"
    p "other wise press enter to play with default Deck."
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
