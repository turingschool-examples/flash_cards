require_relative 'spec_helper'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  describe 'Iteration 2' do
    it '1. new round' do
      round = Round.new(@deck)

      expect(round).to be_an_instance_of(Round)
    end

    it '2. round turns' do
    round = Round.new(@deck)

    expect(round.turns).to eq([])
    end

    it '3. round current card' do
    round = Round.new(@deck)

    expect(round.current_card).to eq(@card_1)
    end

    it '4. new_turn' do
      round = Round.new(@deck)
      new_turn = round.take_turn("Juneau")

      expect(new_turn).to be_instance_of(Turn)
    end

    it '5. is new turn correct' do
      round = Round.new(@deck)
      new_turn = round.take_turn("Juneau")

      expect(new_turn.correct?).to eq(true)

    end

  end
end
