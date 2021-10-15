require './lib/turn'
require './lib/card'


RSpec.describe Turn do

  it 'exists' do
    turn = Turn.new("Juneau", Card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    turn = Turn.new("Juneau", Card)

    expect(turn.card).to eq(Card)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", Card)

    expect(turn.guess).to eq("Juneau")
  end


  it 'tests is guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
  
    expect(turn.correct?).to be true
  end

  it 'provides feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end

  it 'can provide a negative test' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.correct?).to be false
  end

  it 'can return incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.feedback).to eq("Incorrect.")
  end
end

  # require 'pry';binding.pry
