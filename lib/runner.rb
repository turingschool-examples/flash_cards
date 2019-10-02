require './lib/card'
require './lib/turn'
require 'pry'

#runner for the first interation pattern
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
puts card.question
puts card.answer
puts card.category

# binding.pry commenting out


#runner for the next Turn Class iteration pattern
turn = Turn.new("Juneau", card)

require './lib/turn'
require './lib/card'
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)
#turn.card
#turn.guess
#turn.correc#t?
#turn.feedback
binding.pry
