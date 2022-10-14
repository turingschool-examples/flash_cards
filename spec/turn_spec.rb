require './lib/card'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'takes a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a correct answer, not case sensitive' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("jUnEaU", card)

    expect(turn.correct?).to be true
    expect(turn.card.answer).to eq("Juneau")
    expect(turn.correct?).to be true
  end

  describe '#feedback' do
    it 'lets the student know if they are correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.feedback).to eq("Correct!")
    end

    it 'lets the user know if they are incorrect, not case sensitive' do
      card = Card.new("What is the capital of Alaska?", "Homer", :Geography)
      turn = Turn.new("Juneau", card)
      card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn2 = Turn.new("Saturn", card2)
      turn3 = Turn.new("MERCURY", card2)

      expect(turn.feedback).to eq("Incorrect.")
      expect(turn2.guess).to eq("Saturn")
      expect(turn2.correct?).to be false
      expect(turn2.feedback).to eq("Incorrect.")
      expect(turn3.feedback).to eq("Correct!")
    end
  end

end
