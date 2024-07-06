require './lib/card'
require './lib/turn'
require './lib/deck'

# var_1 = "tree"
# var_2 = 22
# var_3 = ["patty", "tomato", 7, 7.18]
# var_4 = :corgi
# var_5 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# var_6 = Turn.new("Juneau", var_5)

# puts var_1.upcase.size.class
# puts var_2.class
# puts var_3[0].class
# puts var_4.class
# puts var_5.question.class
# puts var_6.card.question
# puts var_6.card.answer
# puts var_6.card.category
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
soda = "Mr. Pibb"


deck = Deck.new([card_1, card_2, card_3], soda)

puts deck.cards[0].question
