require './lib/turn'

describe Turn do

    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)

      expect(turn).to be_a Turn
    end

    it 'has a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)

      expect(turn.guess).to eq "Juneau"
    end

    it 'has a question card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)

      expect(turn.card).to eq card
    end

    describe '#correct?' do

      it 'returns true if guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau",card)

        expect(turn.correct?).to be true
      end

      it 'returns false if guess is incorrect' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Alaska City",card)

        expect(turn.correct?).to be false
      end

    end

    describe '#feedback' do

      it 'returns "Correct!" for a correct guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau",card)

        expect(turn.feedback).to eq "Correct!"
      end

      it 'returns "Incorrect." for an incorrect guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Alaska City",card)

        expect(turn.feedback).to eq "Incorrect."
      end

    end

end
