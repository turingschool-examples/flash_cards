# Deck class RSpec test group definition.
require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  # Setup initial conditions for testing.
  before(:each) do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due North?', 'North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  # Class instance test group.
  describe 'class' do
    it 'exists' do
      # Tests the existance of a Deck class instance.
      expect(@deck).to be_instance_of(Deck)
    end
  end
  
  # Deck#initialize test group.
  describe '#initialize' do
    # Test Deck contains an array.
    it 'has an array' do
      expect(@deck.cards.class).to eq(Array)
    end

    # Test all Deck cards array elements to be Card class.
    it 'has an array of Card Objects' do
      # Iterate through all elements for testing.
      @deck.cards.each do |card|
        expect(card.class).to eq(Card)
      end
    end
  end 

  # Deck#count test group.
  describe '#count' do
    # Test cards array count
    it 'outputs correct card count' do
      expect(@deck.cards.size).to eq(3)
    end
  end
end