# Requirements for testing the Turn class.
require 'rspec'
require './lib/turn'
require './lib/card'

# Rspec tests for Turn class.
RSpec.describe Turn do
  # Setup two card and turn objects to test different objects for all tests.
  before(:each) do
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn_1 = Turn.new('Juneau', @card_1)
    @card_2 = Card.new('What is the largest city in Alaska?', 'Anchorage', :Geography)
    @turn_2 = Turn.new('Anchorage', @card_2)
    @wrong_turn_1 = Turn.new('Anchorage', @card_1)
    @wrong_turn_2 = Turn.new('Juneau', @card_2)
  end

  # Turn class test group.
  describe 'class' do
    it 'exists' do      
      # Test whether the Turn class exists.
      expect(@turn_1).to be_instance_of(Turn)
      expect(@turn_2).to be_instance_of(Turn)
    end
  end

  # Turn#initialize test group.
  describe '#initialize' do
    it 'has a guess' do
      # Test the Turn class guess.
      expect(@turn_1.guess).to eq('Juneau')
      expect(@turn_2.guess).to eq('Anchorage')
    end
    
    it 'has a card object' do
      # Test the Turn class attribute card object.
      expect(@turn_1.card).to be(@card_1)
      expect(@turn_2.card).to be(@card_2)
    end
  end
  
  # Turn#correct? test group.
  describe '#correct?' do  
    it 'can check if guess is correct' do
      # Test correct? method for a correct guess.
      expect(@turn_1.correct?).to eq(true)
      expect(@turn_2.correct?).to eq(true)
    end
    
    it 'can check if guess is incorrect' do
      # Test correct? method for a correct guess.
      expect(@wrong_turn_1.correct?).to eq(false)
      expect(@wrong_turn_2.correct?).to eq(false)
    end
  end 
  
  # Turn#feedback test group.
  describe '#feedback' do
    it 'can return correct feedback to the user' do
      # Test feedback method for a right guess.
      expect(@turn_1.feedback).to eq('Correct!')
      expect(@turn_2.feedback).to eq('Correct!')
    end
    
    it 'can return incorrect feedback to the user' do
      # Test feedback method for a wrong guess.
      expect(@wrong_turn_1.feedback).to eq('Incorrect.')
      expect(@wrong_turn_2.feedback).to eq('Incorrect.')
    end
  end
end