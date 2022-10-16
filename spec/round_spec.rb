require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
round.deck
expect(round.turns).to eq([])
round.current_card
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
new_turn = round.take_turn("Juneau")
#=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">
expect(new_turn.class).to eq(Turn)
expect(new_turn.correct?).to eq(true)
round.turns
#=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
expect(round.number_correct).to eq(1)
round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
round.take_turn("Venus")
expect(round.turns.count).to eq(2)
expect(round.turns.last.feedback).to eq("Incorrect!")
expect(round.number_correct).to eq(1)
expect(round.number_correct_by_category(:Geography)).to eq(1)
expect(round.number_correct_by_category(:STEM)).to eq(0)
expect(round.percent_correct).to eq(50.0)
expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
expect(round.current_card).to eq(card_3)
