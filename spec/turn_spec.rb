require './lib/turn'
require './lib/card'


describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  describe '#initialize' do
    it 'creates an instance of turn' do
      expect(turn).to be_instance_of Turn
    end
  end

  describe '#guess' do
    it 'has a guess' do
      expect(turn.guess).to eq('Juneau')
    end
  end

  describe '#card' do
    it 'has a card' do
      expect(turn.card).to be_a Card
    end
  end

  describe '#correct' do
    it 'returns the correct boolean' do
      expect(turn.correct?).to eq(true)

      card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn2 = Turn.new("Saturn", card)
      expect(turn2.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    it 'returns the correct feedback' do
      expect(turn.feedback).to eq('Correct!')

      card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn2 = Turn.new("Saturn", card)
      expect(turn2.feedback).to eq('Incorrect')
    end
  end
end
