require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

filename = "./resources/cards.txt"
generated_cards = CardGenerator.new(filename)
require 'pry';binding.pry
