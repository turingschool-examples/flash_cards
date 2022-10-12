require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do

# test it exists
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

# test it has a card
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_instance_of(Card)
  end

# test it has a guess
  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

# test correct?
  it 'guess correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be true
  end

# test return feedback
  it 'feedback return correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end


  # test it exists with different arguments
    it 'exists with changes' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn).to be_instance_of(Turn)
    end

    # test it has a card with different arguments
    it 'card exists with changes' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)

      expect(turn.card).to be_instance_of(Card)
    end

end
