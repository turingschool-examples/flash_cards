require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)


    expect(turn).to be_a(Turn)
  end

  it 'returns the expected guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)


    expect(turn.guess).to eq("Juneau")
  end

  it 'returns the expected instance of Card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

describe 'matches the turn guess to the card answer' do
  it 'Turn #correct?' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn.correct?).to eq(true)
    end
  end

  describe 'gives the right feedback for a correct answer' do
    it 'Turn #feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq('Correct!')
      end
    end

end
