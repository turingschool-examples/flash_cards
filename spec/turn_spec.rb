require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn).to be_instance_of(Turn)
  end

  it '#card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1.card).to eq(card_1)
  end

    it '#guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card_1)

      expect(turn_1.guess).to eq("Juneau")
    end

    it '#correct?' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card_1)

      expect(turn_1.correct?).to eq(true)
    end

    it '#feedback' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn_1 = Turn.new("Juneau", card_1)
# require "pry"; binding.pry
      expect(turn_1.feedback).to eq("Correct!")
    end
  end
