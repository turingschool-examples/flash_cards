require_relative 'spec_helper'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new(
      'The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM
    )
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?',
                       'North north west', :STEM)
    @deck_cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@deck_cards)
  end

  describe 'Iteration 2' do
    it '1. Storing cards in a deck' do
      expect(@deck).to be_an_instance_of(Deck)
    end

    it '2. deck_has_cards' do
      expect(@deck.cards).to eq(@deck_cards)
    end

    it '3. deck_count' do
      expect(@deck.count).to eq(3)
    end

    it '4. cards_in_categories' do
      expect(@deck.cards_in_category(:STEM)).to eq([@card_2, @card_3]) # defined in an array
      expect(@deck.cards_in_category(:Geography)).to eq([@card_1])
      expect(@deck.cards_in_category('Pop Culture')).to eq([])
    end
  end
end
