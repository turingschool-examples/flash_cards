require './lib/card'
require './lib/turn'
require 'pry'

describe Turn do
  describe '#new' do
    it "exists" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_a(Turn)
    end
  end

  describe '#attr_reader' do
    it "has a guess" do
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

end
