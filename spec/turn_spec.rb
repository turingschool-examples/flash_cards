require './lib/turn'
require './lib/card'

  describe Turn do
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

    it "is it correct?" do

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq(true)
    end

    it "gives feedback" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq('Correct!')
    end

    it "new card" do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.card).to eq(card)
    end

    it "has a guess 1" do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.guess).to eq("Saturn")
    end

    it "is it correct? 1" do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.correct?).to eq(false)
    end

    it "gives feedback 1" do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.feedback).to eq("Incorrect.")
    end

  end
