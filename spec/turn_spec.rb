require './lib/card'
require './lib/turn'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
      
        expect(turn).to be_instance_of(Turn)
    end

    # xit "plays a card" do
    #     card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    #     turn = Turn.new("Saturn", card)
    #     expect(turn.card).to be_instance_of(Turn)
    # end

    it "can make a guess" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.guess).to eq "Saturn"   
    end

    it "can guess wrong" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        turn.correct?
        expect(turn.correct?).to be (false)   
    end

    it "can guess right" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Mercury", card)
        turn.correct?
        expect(turn.correct?).to be(true)   
    end

    it "can give feedback" do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.feedback).to eq "Incorrect."
    end
 end