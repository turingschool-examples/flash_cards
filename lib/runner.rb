require './turn'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

puts card.question
puts card.answer
puts card.category

puts turn.guess
puts turn.card

puts turn.correct?
turn.feedback
