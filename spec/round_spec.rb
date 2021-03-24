require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'has a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'defaults turns to blank' do
    expect(@round.turns).to eq([])
  end

  it 'starts the round with first card in deck' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'lets you take turn' do
    new_turn = @round.take_turn("Juneau")
    #when i run the line above in pry, the class of new_turn is Turn.
    #why does the class return as string here?
    expect(new_turn.class).to eq(Turn)
    expect(new_turn.corect?).to eq(true)
  end

#require "pry"; binding.pry

end
