require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @correct_turn = Turn.new("Juneau", @card)
    @incorrect_turn = Turn.new("Saturn", @card)
  end

  describe "#initialize" do
    it 'creates a new turn object' do
      expect(@correct_turn).to be_instance_of(Turn)
    end
    it 'has a guess' do
      expect(@correct_turn.guess).to eq("Juneau")
    end
    it 'has a card' do
      expect(@correct_turn.card).to eq(@card)
    end
  end

    describe "#correct?" do
      it 'evaluates guess and returns true/false' do
        expect(@correct_turn.correct?).to eq(true)
        expect(@incorrect_turn.correct?).to eq(false)
      end
    end

    describe "#feedback" do
      it 'evaluates guess and returns Correct!/Incorrect.' do
        expect(@correct_turn.feedback).to eq("Correct!")
        expect(@incorrect_turn.feedback).to eq("Incorrect.")
      end
  end
end
