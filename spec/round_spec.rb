require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
# require 'pry';binding.pry

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards) 
    @round = Round.new(@deck)
    @turn = Turn.new("Juneau", @card)
    end

  it 'class should exist' do
    expect(@round).to be_instance_of Round
  end

  it 'should return deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'should take_turn' do
    expect(@round.turns).to eq([])
  end

  it 'should return current cards' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'should take new turn' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq Turn
  end

  it 'should return new turn array' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq([new_turn])
  end

  it 'should give current number'
    expect(@round.number_correct).to eq(1)
  end

