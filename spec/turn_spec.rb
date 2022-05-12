require './lib/turn'
require './lib/card'

  RSpec.describe Turn do
    it "has a card" do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)

      expect(@turn.card).to eq(@card)
    end

    it "has a guess" do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)

      expect(@turn.guess).to eq("Juneau")
    end

    describe "correct?" do

      it "is correct? equals true" do
      expect(@turn.correct?).to eq(true)
    end

      it "isn't correct? equals false" do
        @turn = Turn.new("Phoenix", @card)
        expect(turn.correct?).to eq(false)
      end

    it "has correct feedback" dogit
      expect(@turn.feedback).to eq("Correct!")
    end

    it "has incorrect feedback" do
      expect(@turn.feedback).to ("Incorrect.")
    end


  end
