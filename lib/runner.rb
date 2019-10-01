require './lib/card'
require 'pry'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
puts card.question
puts card.answer
puts card.category

binding.pry
