require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do

#it exists
    it 'is a turn' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)


    expect(turn).to be_instance_of(Turn)
    end
# it has a card
    it 'turn has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        turn.card

    expect(turn.card).to eq(card)
    end

#it has a guess

#the guess is correct

#feedback for the correct guess is Correct!






end
