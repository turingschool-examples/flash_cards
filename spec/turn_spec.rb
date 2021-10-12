require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  context 'Iteration I' do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to be_a(Card)
      expect(turn.guess).to eq("Juneau")
      expect(turn.correct?).to eq(true)
      expect(turn.feedback).to eq("Correct!")
    end

    it 'can give correct/incorrect guess responses' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.card).to be_a(Card)
      expect(turn.guess).to eq("Saturn")
      expect(turn.correct?).to eq(false)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
