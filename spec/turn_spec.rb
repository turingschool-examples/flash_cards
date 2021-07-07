require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  context 'initialize' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    it 'exists' do
      expect(turn).to be_a(Turn)
    end

    it 'has a card as a card object' do
      expect(turn.card).to eq(card)
    end
  end

  context 'guess checking' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)

    it 'has a guess' do
      expect(turn1.guess).to eq("Juneau")
    end

    it 'can correctly check a guess' do
      expect(turn1.correct?).to be(true)
      expect(turn2.correct?).to be(false)
    end

    it 'can provide correct feedback' do
      expect(turn1.feedback).to eq("Correct!")
      expect(turn2.feedback).to eq("Incorrect.")
    end
  end
end
