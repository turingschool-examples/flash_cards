require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)

        expect(turn.card).to eq(card)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)

        expect(turn.guess).to eq("Anchorage")
    end

    it 'checks that the answer is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end

    # it 'gives feedback' do
    #     card = Card.new("Anchorage", "Card 1")

    #     expect(card.answer).to eq("Anchorage")
    # end

end