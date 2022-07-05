require './lib/card'

Rspec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Card)
    end

    it 'has guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
    end

    it 'has current card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Juneau", card)

        expect(turn.card).to be_instance_of(Card)
        expect(turn.card).to be card
    end
end