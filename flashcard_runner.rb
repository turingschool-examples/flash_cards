require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/printer'
require 'pry'

card_1 = Card.new("What is 5 + 5?", "10", :Arithmetic)
card_2 = Card.new("What is Joanna's favorite animal?", "cheetah", :Animal_Stuff)
card_3 = Card.new("What is the name of Megan's doggo?", "Nile", :Animal_Stuff)
card_4 = Card.new("Which important person in history was recently unveiled as the new face of the 50 pound note in the UK?", "Alan Turing", :History)
@deck = Deck.new([card_1, card_2, card_3, card_4])
@round = Round.new(deck)
@printer = Printer.new

def start
  @printer.welcome_message
end

start
