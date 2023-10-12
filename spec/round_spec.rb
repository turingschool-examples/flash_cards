puts require './lib/card'
#=> true

puts require './lib/turn'
#=> true

puts require './lib/deck'
#=> true

puts require './lib/round'
#=> true

puts card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>

puts card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

puts card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>

puts deck = Deck.new([card_1, card_2, card_3])
#=> #<Deck:0x00007fa160a38ed8...>

puts round = Round.new(deck)
#=> #<Round:0x00007f972a1c7960...>,

puts round.deck
#=> #<Deck:0x00007fa160a38ed8...>

puts round.turns
#=> []

puts round.current_card
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>

puts new_turn = round.take_turn("Juneau")
#=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">

puts new_turn.class
#=> Turn

puts new_turn.correct?
#=> true

puts round.turns
#=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]

puts round.number_correct
#=> 1

puts round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

puts round.take_turn("Venus")
#=> #<Turn:0x00007f972a215b38...>

puts round.turns.count
#=> 2

puts round.turns.last.feedback
#=> "Incorrect."

puts round.number_correct
#=> 1

puts round.number_correct_by_category(:Geography)
#=> 1

puts round.number_correct_by_category(:STEM)
#=> 0

puts round.percent_correct
#=> 50.0

puts round.percent_correct_by_category(:Geography)
#=> 100.0

puts round.current_card.answer
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>