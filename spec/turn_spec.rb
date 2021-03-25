require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  describe '#initialize' do
    it "has a guess" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.guess).to eq "Juneau"
    end

    it "has a card" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.card).to eq card
    end
  end

  describe '#correct?' do
    it "recognizes correct guesses" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq true
    end

    it "recognizes incorrect guesses" do
      bad_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      bad_turn = Turn.new("Saturn", bad_card)

      expect(bad_turn.correct?).to eq false
    end
  end

  describe '#feedback' do
    it "gives feedback if correct" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq "Correct!"
    end

    it "gives feedback if incorrect" do
      bad_card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      bad_turn = Turn.new("Saturn", bad_card)

      expect(bad_turn.feedback).to eq "Incorrect."
    end
  end
end
