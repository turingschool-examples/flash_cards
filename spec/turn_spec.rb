require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it 'exits' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(card).to be_instance_of(Card)
    end

    it 'guesses the capital' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        expect(turn.guess).to eq("Denver")
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        expect(turn.card).to eq(card)
    end

    it 'checks the answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        card.answer == Turn.new("Denver", card)

        expect(card.answer).to eq("Juneau")
    end

    it 'is it correct?' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        card.answer == Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        
        # expect(card.guess).to eq(false)
    end


end