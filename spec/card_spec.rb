# Header Files
require 'rspec'
require './lib/card.rb'

# Feedback Fomatting
RSpec.configure do |config|
    config.formatter = :documentation
end

# Tested Class
RSpec.describe Card do

    # Exists
    it "exists" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(card).to be_a (Card)
    end

    # Has a question
    it "has a question" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(card.question).to eq ("What is the capital of Alaska?")    
    end

    # Has an answer
    it "has an answer" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(card.answer).to eq ("Juneau")
    end

    # Has a category
    it "has a category" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        
        expect(card.category).to eq (:Geography)
    end

end