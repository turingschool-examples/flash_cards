require 'rspec'
require './lib/card'
require './lib/turn'

describe Turn do
  it 'exists' do
    # it 'exists' is referencing that an instance of the Turn class exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new("Juneau", card)
    # require 'pry'; binding.pry => great debugging tool if you don't know where your code is breaking
    expect(new_turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new("Juneau", card)

    expect(new_turn.card).to eq(card)
    #how do we know to put "to eq" here instead of "to be_instance_of"?
    # to eq is checking that what you have the right side is the same as what you have on the left side
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new("Juneau", card)

    expect(new_turn.guess).to eq("Juneau")
    # access the guess through the turn => in this case left side equals right side
  end

  it 'correct guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new("Juneau", card)
    # always best to write the test first, then define the method later in class file
    expect(new_turn.correct?).to eq(true)
  end

  it 'gives feedback when correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    new_turn = Turn.new("Juneau", card)

    expect(new_turn.feedback).to eq("Correct!")
  end
# still checking the behaviors inside of the turn class, so it belongs in the turn spec
  it 'has a different card and guess' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    new_turn = Turn.new("Saturn", card)

    expect(new_turn.card).to eq(card)
    expect(new_turn.guess).to eq("Saturn")
  end

  it 'incorrect guess' do
    # because "Saturn" does not equal "Mercury"
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    new_turn = Turn.new("Saturn", card)

    expect(new_turn.correct?).to eq(false)
  end

  it 'gives feedback when incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    new_turn = Turn.new("Saturn", card)

    expect(new_turn.feedback).to eq("Incorrect.")
  end
end


# new_turn.guess
# output => "Juneau"
