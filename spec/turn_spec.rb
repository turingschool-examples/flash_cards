require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Card do 
    it 'initializes a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        expect(card).to be_instance_of(Card)
    end
end

RSpec.describe Turn do
    it 'initializes a turn' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn).to be_instance_of(Turn)
    end

    it 'takes a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.guess).to eq("Juneau")
    end

    it 'confirms if correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to eq(true)
    end

    it 'gives positive feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.feedback).to eq("Correct!")
    end

    it 'denies if incorrect' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.correct?).to eq(false)
    end
    
    it 'gives negative feedback' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.feedback).to eq("Incorrect")
    end



end