# Header Files
require 'rspec'
require './lib/card.rb'
require './lib/turn.rb'

# Feedback Fomatting
RSpec.configure do |config|
    config.formatter = :documentation
end

# Tested Class
RSpec.describe Turn do

    # Exists
    it "exists" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_a (Turn)
    end

    # Displays the card
    it "displays the card" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq (card)
    end

    # Displays the guess
    it "displays the guess" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq ("Juneau")     
    end

    describe "correct? method" do

        # Returns true or false based on guess
        it "returns true if guess is correct" do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.correct?).to eq (true)     
        end

        it "returns false if guess is incorrect" do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Anchorage", card)

            expect(turn.correct?).to eq (false)     
        end

    end

    # Returns feedback based on whether guess is correct or not
    it "returns feedback if guess is correct" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq ("Correct!")     
    end

    it "returns feedback if guess is incorrect" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)
        
        expect(turn.feedback).to eq ("Incorrect.")     
    end

end