#iteration 4
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


lines = []
IO.foreach('./more_questions.txt') {
  |line|
  lines << a = line.split(',')
}

# puts lines # each element follows #question, #answer, #category # array of 25


# puts lines[0].length # Array of arrays

x = Hash[(0..lines.size).zip lines]

x.delete(26) #nil values
x.delete(25) #nil values


cards_jeopardy = []
x.each do |key, value|
  cards_jeopardy << key = Card.new(value[0], value[1], value[2].to_sym)
end


deck_jeopardy = Deck.new(cards_jeopardy)

$round_jeopardy = Round.new(deck_jeopardy)
