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
  end

  it "have a #current_card which is first in the deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
    expect(round.turns).to eq([])
    expect(round.current_card).to eq(card_1)
  end
end  


#     expect(new_turn = round.take_turn("Juneau")).to eq()
# #=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">

#     expect(new_turn.class).to 
# #=> Turn

#     expect(new_turn.correct?) to be true
#     expect(round.turns).to eq()
# #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]

#     expect(round.number_correct).to eq(1)
#     expect(round.current_card).to eq(card_2)
#     expect(round.take_turn("Venus")).to eq()
# #=> #<Turn:0x00007f972a215b38...>

#     expect(round.turns.count).to eq(2)
#     expect(round.turns.last.feedback).to eq("Incorrect")
#     expect(round.number_correct).to eq(1)
#     expect(round.number_correct_by_category(:Geography)).to eq(1)
#     expect(round.number_correct_by_category(:STEM)).to eq(0)
#     expect(round.percent_correct).to eq(50.0)
#     expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
#     expect(round.current_card).to 
# #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
