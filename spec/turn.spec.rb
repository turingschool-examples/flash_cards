require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

Rspec.describe Turn do
    it 'answer to question correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(card.feedback).to eq('Correct!')
    end
end