require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  let(:card1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }
  let(:round) { Round.new(deck) }

  context "when an instance is created" do
    it "exists" do
      expect(round).to be_an_instance_of(Round)
    end

    it "has a deck" do
      expect(round.deck).to eq(deck)
    end

    it "has turns" do
      expect(round.turns).to eq([])
    end

    it "has a current card" do
      expect(round.current_card).to eq(card1)
    end
  end

  context "when a turn is taken" do
    it "creates a Turn instance" do
      turn1 = round.take_turn("Juneau")
      expect(turn1).to be_an_instance_of(Turn)
    end

    it "adds the Turn instance to the turns array" do
      turn1 = round.take_turn("Juneau")
      expect(round.turns).to eq([turn1])
      turn2 = round.take_turn("Venus")
      expect(round.turns).to eq([turn1, turn2])
    end

    it "increments the turns count" do
      round.take_turn("Juneau")
      expect(round.turns.count).to eq(1)
      round.take_turn("Venus")
      expect(round.turns.count).to eq(2)
    end

    it "updates the current card to the next one in the deck" do
      round.take_turn("Juneau")
      expect(round.current_card).to eq(card2)
      round.take_turn("Venus")
      expect(round.current_card).to eq(card3)
    end

    it "calculates total number correct" do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.number_correct).to eq(1)
    end

    it "calculates total number correct by category" do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it "calculates the percent correct" do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct).to eq(50.0)
    end

    it "calculates the percent correct by category" do
      round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.percent_correct_by_category(:STEM)).to eq(0)
    end
  end
end
