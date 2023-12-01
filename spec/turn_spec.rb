require 'rspec'
require './lib/card'
require './lib/turn'

describe Turn do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    it 'exist' do
       turn = Turn.new("Juneau", card)

       expect(turn).to be_instance_of(Turn)
    end 

