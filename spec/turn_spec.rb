require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  context "initialize" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    it 'exists' do
      expect(turn.card).to eq card
      expect(turn.guess).to eq "Juneau"
    end

    it 'gives an answer' do
      expect(turn.correct?).to eq true
      expect(turn.feedback).to eq "Correct!"
    end
  end

  context 'compare' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    
    it 'exists' do
      expect(turn.card).to eq card
      expect(turn.guess).to eq "Saturn"
    end

    it 'determines a correct answer' do
      expect(turn.correct?).to eq false
      expect(turn.feedback).to eq "Incorrect."
    end
  end
end