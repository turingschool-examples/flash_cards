require './lib/turn'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      turn = Turn.new('Juneau', 'card_1')

      expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
      turn = Turn.new('Juneau', 'card_1')

      expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
      turn = Turn.new('Juneau', 'card_1')

      expect(turn.card).to eq("card_1")
    end
  end

  describe '#correct?' do
    it 'states correct' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn = Turn.new('Juneau', card_1)

      expect(turn.correct?).to be true
    end

    it 'states not correct' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn = Turn.new('Anchorage', card_1)

      expect(turn.correct?).to be false
    end
  end

  describe "#feedback" do
    it 'gives feedback if correct' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn = Turn.new('Juneau', card_1)

      expect(turn.feedback).to eq 'Correct!'
    end

    it 'gives feedback if incorrect' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      turn = Turn.new('Anchorage', card_1)

      expect(turn.feedback).to eq 'Incorrect.'
    end
  end
end
