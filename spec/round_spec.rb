require "pry"
require "rspec"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"



pry(main)> require './lib/card'
#=> true

pry(main)> require './lib/turn'
#=> true

pry(main)> require './lib/deck'
#=> true

pry(main)> require './lib/round'
#=> true

pry(main)> card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>

pry(main)> card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

pry(main)> card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>

pry(main)> deck = Deck.new([card_1, card_2, card_3])
#=> #<Deck:0x00007fa160a38ed8...>

pry(main)> round = Round.new(deck)
#=> #<Round:0x00007f972a1c7960...>,

pry(main)> round.deck
#=> #<Deck:0x00007fa160a38ed8...>

pry(main)> round.turns
#=> []

pry(main)> round.current_card
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>

pry(main)> new_turn = round.take_turn("Juneau")
#=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">

pry(main)> new_turn.class
#=> Turn

pry(main)> new_turn.correct?
#=> true

pry(main)> round.turns
#=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]

pry(main)> round.number_correct
#=> 1

pry(main)> round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

pry(main)> round.take_turn("Venus")
#=> #<Turn:0x00007f972a215b38...>

pry(main)> round.turns.count
#=> 2

pry(main)> round.turns.last.feedback
#=> "Incorrect."

pry(main)> round.number_correct
#=> 1

pry(main)> round.number_correct_by_category(:Geography)
#=> 1

pry(main)> round.number_correct_by_category(:STEM)
#=> 0

pry(main)> round.percent_correct
#=> 50.0

pry(main)> round.percent_correct_by_category(:Geography)
#=> 100.0

pry(main)> round.current_card
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>