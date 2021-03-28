require 'RSpec'
require './lib/turn'
require './lib/card'

describe Turn do
  describe '#initialize' do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)
    it 'exists' do
     expect(turn).to be_instance_of(Turn)
    end

    it 'it has guess' do
     expect(turn.guess).to eq("Juneau")
    end

    it 'it has card' do
     expect(turn.card).to eq(card)
    end
  end

  describe '#correct?' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    it 'it is correct?' do
      turn = Turn.new("Juneau", card)
     expect(turn.correct?).to eq(true)
    end

    it 'it is not correct?' do
      turn = Turn.new("Denver", card)
     expect(turn.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    it 'it gives feedback' do
      turn = Turn.new('Juneau', card)
       # could also use turn.guess --> turn.correct? .to eq (true), what's the difference?
     expect(turn.feedback).to eq("Correct!")
    end

    it 'it gives feedback' do
      turn = Turn.new("Denver", card)
     expect(turn.feedback).to eq("Incorrect.")
    end
  end
end
