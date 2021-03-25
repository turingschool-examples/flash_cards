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
    expect(new_turn.class).to eq(Turn)
    # expect(@round.turns[0].correct?).to eq(true)
  end

  it 'stores my new turn info in rounds turn array' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq(new_turn)
  end

  it 'flips to next card after turn' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card_2)
  end

  it 'does not count incorrect answers as correct' do
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")
    expect(@round.number_correct).to eq(1)
  end

  it 'does count correct answers as correct' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
  end

  it 'keeps track of correct answers by category' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
  end

  # it 'keeps track of percent correct by category' do
  #   new_turn = @round.take_turn("Juneau")
  #   expect(@round.percent_correct_by_category(:Geography)).to eq(1)
  # end
#require "pry"; binding.pry

end
