require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Turn do
  before :each do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
  end

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'returns a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'correct? returns true if guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end

  it 'provides feedback when answer is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end

  it 'incorrect? returns false if guess is incorrect' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end

  it 'provides feedback when answer is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Seattle", card)

    expect(turn.feedback).to eq("Incorrect.")
  end

end
  #it 'has a guess' do
    #expect(@guess.correct?).to eq("Juneau")
  #end
#end

  #it 'has an answer' do
  #  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #  turn = Turn.new("Juneau", card)

  #  expect(turn.answer).to eq("Juneau")
  #end
#end
  #it 'exists' do
    #card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    #expect(card).to be_instance_of(Card)
  #end

  #it 'can take a turn' do
    #card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #turn = Turn.new("Juneau", card)

    #expect(turn).to be_instance_of(Turn)
  #end
#end
