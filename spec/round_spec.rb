# Round class RSpec test group definition. 
require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  # Setup initial conditions for testing.
  before(:each) do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due North?', 'North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  # Class instance test group.
  describe 'class' do
    # Test existence of a Round class instance.
    it 'exists' do
      expect(@round).to be_instance_of(Round)
    end
  end

  # Round#initialize test group.
  describe '#initialize' do
    # Test for a Deck class object parameter.
    it 'has a deck object' do
      expect(@round.deck).to be_instance_of(Deck)
    end
  
    # Test for an initially empty turns array.
    it 'has a empty turns array' do
      expect(@round.turns).to eq([])
    end
  end
end