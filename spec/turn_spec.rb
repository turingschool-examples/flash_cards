require './lib/card'
require './lib/turn'

describe Turn do
    it 'exists' do
        card = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Animals)
        turn = Turn.new("Bamboo", card)

        expect(turn).to be_instance_of(Turn)
      end
    end

    it 'has a guess' do
        card = Card.new("What is a Giant Panda's favorite food", "Bamboo", :Animals)
        turn = Turn.new("Bamboo", card)
    
        expect(turn.guess).to eq !nil
      end