require './lib/high_score'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe HighScore do
    before (:all) do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        @cards = [card_1, card_2, card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
        @round.take_turn("Juneau")
        @round.take_turn("Juneau")
        @round.take_turn("North")
        @filename = "high_score.txt"
        @high_score = HighScore.new(@round, @filename)
    end

    it 'exists' do
        expect(@high_score).to be_instance_of HighScore
    end

    it 'has a valid filename' do
        expect(@high_score.filename).to eq @filename
    end

    it 'reads the data on the file' do
        expect(@high_score.scores). to be_instance_of Array
    end

    it 'has score from completed round' do
        expect(@high_score.current_score).to eq @round.number_correct
    end

    it 'gets the users name' do
        expect(@high_score.get_user_name("Bobby")).to eq @high_score.user_name
    end

    it 'can add user_name and score to scores array' do
        @high_score.get_user_name("Bobby")
        @high_score.add_score
        expect(@high_score.scores).to include("Bobby, 2")
    end

    it 'can write the score and name to the file' do
        expect(@high_score.save).to eq 8
    end

    it 'displays score' do
        expect(@high_score.display). to eq ["Bobby:  2"]
    end
end