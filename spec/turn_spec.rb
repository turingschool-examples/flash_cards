require './lib/card'
require './lib/turn'

RSpec.describe Turn do

  context 'Initialize' do
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_instance_of(Turn)
    end
    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq("Juneau")
    end

    it 'has a card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to eq(card)
    end
  end

  context 'Methods' do
    it 'determines if guess is correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn1 = Turn.new("Juneau", card)
      turn2 = Turn.new("Anchorage", card)

      expect(turn1.correct?).to be true
      expect(turn2.correct?).to be false
    end

    it 'gives feedback based on correctness of guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn1 = Turn.new("Juneau", card)
      turn2 = Turn.new("Anchorage", card)

      expect(turn1.feedback).to eq('Correct!')
      expect(turn2.feedback).to eq('Incorrect!')
    end
  end
end
