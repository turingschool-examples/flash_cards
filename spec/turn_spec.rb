require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  describe "Correct guesses:" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    it "exists" do
      expect(turn).to be_an_instance_of Turn

    end

    it "has guess" do
      expect(turn.guess).is_a? String

    end

    it "is correct" do
      expect(turn.correct?).to be(true)
    end

    it "returns feedback" do
      expect(turn.feedback).to eq("Correct!")
    end

  end

  describe "Incorrect guesses:" do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    it "exists" do
      expect(turn).to be_an_instance_of Turn

    end

    it "has guess" do
      expect(turn.guess).to eq("Saturn")

    end

    it "is correct" do
      expect(turn.correct?).to be(false)
    end

    it "returns feedback" do
      expect(turn.feedback).to eq("Incorrect.")
    end
  end

end
