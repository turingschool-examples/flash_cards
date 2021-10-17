require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  context 'Iteration I' do
    before :each do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card_1)
    end

    it 'exists' do

      expect(@turn.card).to be_a(Card)
    end

    it 'can give correct/incorrect guess responses' do
      expect(@turn.guess).to eq("Juneau")
      expect(@turn.correct?).to eq(true)
      expect(@turn.feedback).to eq("Correct!")

      card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn_2 = Turn.new("Saturn", card_2)
      expect(turn_2.card).to be_a(Card)
      expect(turn_2.guess).to eq("Saturn")
      expect(turn_2.correct?).to eq(false)
      expect(turn_2.feedback).to eq("Incorrect.")
    end
  end
end
