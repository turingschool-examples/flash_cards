require './lib/card'
require './lib/turn'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn).to be_instance_of(Turn)
    end

    it "has another turn" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Dog", card)
        turn.correct?
        expect(turn.correct?).to be (false)   
    end

 end
  
  