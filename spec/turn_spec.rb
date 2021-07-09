require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  context 'turn creation' do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(card).to be_instance_of(Card)
      expect(turn).to be_instance_of(Turn)
    end

    it 'has a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to eq(card)
    end

    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end

    it 'can determine if guess is correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq(true)
    end

    it 'gives feedback if guess is correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")
    end
  end

  context 'turn creation' do
    it 'exists' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(card).to be_instance_of(Card)
      expect(turn).to be_instance_of(Turn)
    end

    it 'has a card' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.card).to eq(card)
    end

    it 'has a guess' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.guess).to eq("Saturn")
    end

    it 'can determine if guess is correct' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.correct?).to eq(false)
    end

    it 'gives feedback if guess is correct' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
