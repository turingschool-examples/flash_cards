require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'test it exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn_1 = Turn.new("Juneau", card_1)
        
        expect(turn_1).to be_a(Turn)
    end

    it 'is a correct guess' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn_1 = Turn.new("Juneau", card_1)

        expect(turn_1.correct?).to eq(true)
    end

    it 'returns a message when correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn_1 = Turn.new("Juneau", card_1)

        expect(turn_1.feedback).to eq("Correct!")
    end

    it 'returns different message when guess is incorrect' do
        card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn_2 = Turn.new("Saturn", card_2)

        expect(turn_2.feedback).to eq("Incorrect.")
    end
end