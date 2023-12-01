require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'exists with @deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_a Round
    expect(card_1).to eq()
  end
end

    expect(round.deck).to eq(deck)
    expect(round.turns).to eq([])

    expect(round.current_card
#=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>

    expect(new_turn = round.take_turn("Juneau")
#=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">

    expect(new_turn.class
#=> Turn

    expect(new_turn.correct?
#=> true

    expect(round.turns
#=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]

    expect(round.number_correct
#=> 1

    expect(round.current_card
#=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>

    expect(round.take_turn("Venus")
#=> #<Turn:0x00007f972a215b38...>

    expect(round.turns.count
#=> 2

    expect(round.turns.last.feedback
#=> "Incorrect."

    expect(round.number_correct
#=> 1

    expect(round.number_correct_by_category(:Geography)
#=> 1

    expect(round.number_correct_by_category(:STEM)
#=> 0

    expect(round.percent_correct
#=> 50.0

    expect(round.percent_correct_by_category(:Geography)
#=> 100.0

    expect(round.current_card
#=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
