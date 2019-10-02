require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require 'pry'

cards = [
  Card.new("What is the capital of Texas?", "Austin", "Geography"),
  Card.new("What is your quest?", "To find the holy grail", "Movies")
]

#p cards

turn = Turn.new("Juneau", @card)

p turn.guess

binding.pry
