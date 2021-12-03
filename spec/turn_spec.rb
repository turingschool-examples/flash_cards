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
end
