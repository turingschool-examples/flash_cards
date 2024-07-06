require 'rspec'
require './lib/round'

RSpec.configure do |config|
    config.formatter = :documentation
    end


RSpec.describe 'round' do

    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
        # require 'pry';binding.pry

        
    end
    it 'should exist' do

        expect(@round).to be_an_instance_of Round
    end

    it 'should have an attribute named turns' do
        expect(@round.turns).to be_an_instance_of Array
    end

    it 'has a current_card method which returns the first card in the cards array' do
        expect(@round.current_card).to eq @card_1
    end

    it 'has a take_turn method that takes a string argument' do
        expect(@round.take_turn(17)).to eq "Your guess must be a string"

        expect(@round.take_turn(true)).to eq "Your guess must be a string"

        expect(@round.take_turn([])).to eq "Your guess must be a string"

        expect(@round.take_turn(17.00)).to eq "Your guess must be a string"
    end

    it 'has a take_turn method that creates an instance of a turn object' do
        @round.take_turn("swag")

        expect(@round.turn).to be_an_instance_of Turn
    end
    
    it 'has a take_turn method that stores turn in turns array' do
        @round.take_turn("swag")
        
        expect(@round.turns.length).to be 1

    end

    it 'has a take_turn method that increments the current card instance' do
        @round.take_turn("swag")

        expect(@round.current_card).to eq @card_2

    end
end