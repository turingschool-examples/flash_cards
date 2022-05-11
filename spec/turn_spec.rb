require 'rspec'
require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'exists' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("My guess",card)

    expect(card).to be_instance_of(Card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("My guess",card)

    expect(turn.guess).to eq("My guess")
  end

  it 'returns true if guess matches exactly' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau",card)

    expect(turn.correct?).to be true
  end

  it 'returns true if guesses match but are in different cases' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("juneau",card)

    expect(turn.correct?).to be true
  end

  it 'returns true if guess matches but includes spaces before/after or extra spaces between words' do

    card = Card.new("What is the capital of Arkansas?", "Little Rock", :Geography)

    turn_1 = Turn.new("LittleRock",card)

    expect(turn_1.correct?).to be true

    turn_2 = Turn.new(" Little Rock",card)

    expect(turn_2.correct?).to be true

    turn_3 = Turn.new("Lil Rock   ",card)

    expect(turn_3.correct?).to be false
  end

  it 'returns false when receiving an incorrect guess' do

    card = Card.new("What is the capital of Arkansas?", "Little Rock", :Geography)

    turn_1 = Turn.new("Big Rock",card)

    expect(turn_1.correct?).to be false

  end

  it 'returns "Correct!" when guess is correct' do

    card = Card.new("What is the capital of Arkansas?", "Little Rock", :Geography)

    turn_1 = Turn.new("Little Rock",card)

    expect(turn_1.feedback).to eq("Correct!")

  end

  it 'returns "Incorrect." when guess is incorrect' do

    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    turn_1 = Turn.new("Saturn",card)

    expect(turn_1.feedback).to eq("Incorrect.")

  end



  # it 'has a category' do
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   expect(card.category).to eq(:Geography)
  # end
end
