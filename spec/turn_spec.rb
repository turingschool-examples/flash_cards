require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  describe '#initialize' do
    it 'creates an instance of Turn' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_instance_of(Turn)
    end
  end

  describe '@card' do
    it 'has a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to be_instance_of(Card)
    end
  end

  describe '@guess' do
    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end
  end

  describe '#correct?' do
    it 'has a correct answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq true
    end
  end

  describe '#feedback'
    it 'has correct feedback' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")
    end
  end

  describe '#feedback' do
    it 'responds appropriatly with incorrect answer' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.correct?).to eq false
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
