require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe(Round) do
  it 'exists' do
    expect(Round).to be_truthy
  end

  it 'can be initialized' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end

  it 'has turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.turns).to eq([])
  end

  it 'has a current_card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.current_card).to eq(card_1)
  end

  it 'can take a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    turn_1 = round.take_turn("Juneau")

    expect(turn_1.class).to eq(Turn)

    expect(turn_1.correct?).to eq(true)

    expect(round.turns).to eq([turn_1])
    expect(round.number_correct).to eq(1)
    expect(round.current_card).to eq(card_2)

    round.take_turn("Venus")
 
    expect(round.turns.count).to eq(2)
    expect(round.turns.last.feedback).to eq("Incorrect.")
    expect(round.number_correct).to eq(1)
  end
end


# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> require './lib/turn'
# #=> true
#
# pry(main)> require './lib/deck'
# #=> true
#
# pry(main)> require './lib/round'
# #=> true
#
# pry(main)> card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
#
# pry(main)> card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
#
# pry(main)> deck = Deck.new([card_1, card_2, card_3])
# #=> #<Deck:0x00007fa160a38ed8...>
#
# pry(main)> round = Round.new(deck)
# #=> #<Round:0x00007f972a1c7960...>,
#
# pry(main)> round.deck
# #=> #<Deck:0x00007fa160a38ed8...>
#
# pry(main)> round.turns
# #=> []
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
#
# pry(main)> new_turn = round.take_turn("Juneau")
# #=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">
#
# pry(main)> new_turn.class
# #=> Turn
#
# pry(main)> new_turn.correct?
# #=> true
#
# pry(main)> round.turns
# #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
#
# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
#
# pry(main)> round.take_turn("Venus")
# #=> #<Turn:0x00007f972a215b38...>
#
# pry(main)> round.turns.count
# #=> 2
#
# pry(main)> round.turns.last.feedback
# #=> "Incorrect."
#
# pry(main)> round.number_correct
# #=> 1
#
# pry(main)> round.number_correct_by_category(:Geography)
# #=> 1
#
# pry(main)> round.number_correct_by_category(:STEM)
# #=> 0
#
# pry(main)> round.percent_correct
# #=> 50.0
#
# pry(main)> round.percent_correct_by_category(:Geography)
# #=> 100.0
#
# pry(main)> round.current_card
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
