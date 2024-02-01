# turn_spec.rb

require 'rspec'
require './lib/card.rb'
require './lib/turn.rb'

# Feedback Fomatting
RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Turn do

    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn).to be_instance_of (Turn)
    end

    it 'checks for a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.guess).to eq ("Juneau")    
    end

    it 'checks if the guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.guess).to eq (card.answer)    
    end

end