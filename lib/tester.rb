require './lib/turn'
require './lib/card'


card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

puts turn.card.question
puts card

puts turn.correct?
puts turn.feedback

