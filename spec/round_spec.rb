require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


RSpec.describe Round  do

  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
       reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
      clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    @round = Round.new(deck)

  end


  it 'round.current card test' do

    expect(@round.current_card). to eq(@round.deck.cards[0])

  end

  # it 'round.take turn test' do
  #   new_turn = @round.takes_turn("Juneau")
  #   expect(new_turn). to eq(Round)
  # end
  #
  # it 'new_turn.class' do
  #   new_turn = @round.take_turn("Juneau")
  #   expect(new_turn.class). to eq(Round)
  # end


end
