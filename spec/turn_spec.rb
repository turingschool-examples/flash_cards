require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  let(:guess) { "Juneau" }
  let(:card) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:turn) { Turn.new(guess, card) }

  context "when an instance is created" do
    it "exists" do
      expect(turn).to be_an_instance_of(Turn)
    end

    it "has a guess" do
      expect(turn.guess).to eq("Juneau")
    end

    it "has a card" do
      expect(turn.card).to eq(card)
    end
  end

  context "when the guess is correct" do
    it "returns true" do
      expect(turn.correct?).to eq(true)
    end

    it "returns feedback that the guess is correct" do
      expect(turn.feedback).to eq("Correct!")
    end
  end

  context "when the guess is incorrect" do
    let(:guess) { "incorrect answer" }

    it "returns false" do
      expect(turn.correct?).to eq(false)
    end

    it "returns feedback that the guess is incorrect" do
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end