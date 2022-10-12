require './lib/card'

require './lib/turn'

RSpec.describe Turn do
  
    it 'exists' do
    turn = Turn.new("Juneau", "card_1")

    expect(turn).to be_instance_of(Turn)
  end
    it 'states correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card_1)
    
        expect(turn.correct?).to be true
    end
end
