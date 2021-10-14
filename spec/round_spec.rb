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

  # Round#current_card test group.
  describe '#current_card' do
    # Test current_card is a Card instance.
    it 'is a Card instance' do
      expect(@round.current_card).to be_instance_of(Card)
    end

    # Test that the initial current card is the first card in the Deck.
    it 'displays the first card initially' do
      expect(@round.current_card).to eq(@card_1)
    end
  end

  # Round#take_turn test group.
  describe '#take_turn' do
    # Test that takes in user input and creates new Turn instance.
    it 'returns a Turn instance' do
      juneau_turn = Turn.new('Juneau', @card_1)
      juneau_round = @round.take_turn('Juneau')
      expect(juneau_round).to be_instance_of(Turn)
    end

    # Test initial Turn is correct.
    it 'has correct initial Turn' do
      juneau_turn = Turn.new('Juneau', @card_1)
      juneau_round = @round.take_turn('Juneau')
      expect(juneau_round.card).to eq(juneau_turn.card)
      expect(juneau_round.guess).to eq(juneau_turn.guess)
    end
  end

  # Round#number_correct test group.
  describe '#number_correct' do
    # Test initial number correct is zero.
    it 'is initially zero' do
      expect(@round.number_correct).to eq(0)
    end

    # Test for correct guesses updates after a guess.
    it 'can update for correct guesses' do
      @round.take_turn('Juneau')
      expect(@round.number_correct).to eq(1)
      @round.take_turn('Mars')
      expect(@round.number_correct).to eq(2)
      @round.take_turn('North north west')
      expect(@round.number_correct).to eq(3)
    end

    # Test for incorrect guesses.
    it 'it will stay the same with incorrect guesses' do
      @round.take_turn('Anchorage')
      expect(@round.number_correct).to eq(0)
      @round.take_turn('Saturn')
      expect(@round.number_correct).to eq(0)
      @round.take_turn('South west')
      expect(@round.number_correct).to eq(0)
    end
  end

  # Round#number_correct_by_category test group.
  describe '#number_correct_by_category' do
    # Test for the number correct in a single category.
    it 'can output correct for one category' do
      @round.take_turn('Juneau')
      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      @round.take_turn('Mars')
      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      @round.take_turn('North north west')
      expect(@round.number_correct_by_category(:Geography)).to eq(1)
    end

    # Test for another category.
    it 'can output correct for another category' do
      @round.take_turn('Juneau')
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
      @round.take_turn('Mars')
      expect(@round.number_correct_by_category(:STEM)).to eq(1)
      @round.take_turn('North north west')
      expect(@round.number_correct_by_category(:STEM)).to eq(2)
    end

    # Test for an undefined category.
    it 'can check for a undefined category' do
      @round.take_turn('Juneau')
      expect(@round.number_correct_by_category(:Music)).to eq(0)
    end
  end
end