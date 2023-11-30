# For turn class, we will need to be testing its initialize method with two different arguments
# We need to test the guess method, so whatever the person is guessing the answer to the question
# is
# Test the card method to return what card is within the turn instance
# Test the correct? method to return if guess is correct or not
# Test feedback method to return correct response based on correct? method response

require 'rspec'
require './lib/turn.rb'
require './lib/card.rb'

RSpec.describe Turn do
    it 'exists' do

        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juno", card)
        
        expect(turn).to be_a Turn
    end

    it 'can read card' do

        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juno", card1)
        
        expect(turn.card).to eq(card1)
    end

    it 'can return the guess' do

        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juno", card1)

        expect(turn.guess).to eq('Juno')
    end

    it 'can read a guess as correct?' do

        card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juno", card1)

        expect(turn.correct?).to eq(true)
    end
end