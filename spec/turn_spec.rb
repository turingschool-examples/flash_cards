require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require 'pry'

Rspec.describe Turn do
    it 'answer to question correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(card.feedback).to eq('Correct!')
    end
    it 'answer to question Incorrect' Turn do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(card.feedback).to eq('Incorrect.')
    end
    it 'SAD path test (capitalize)' Turn do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("juneau", card)

        expect(card.feedback).to eq('Correct!')
    end
    # it '' Turn do
    #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     turn = Turn.new("Juneau", card)

    #     expect().to eq()
    # end
end