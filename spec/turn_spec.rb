require './lib/turn.rb'
require './lib/card.rb'

RSpec.describe Turn do
  it 'exists' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess",myCard)
    expect(turn).to be_instance_of(Turn)
  end

  it 'has the user\'s guess' do 
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", myCard)
    expect(turn.guess).to eq("guess")
    expect(turn.guess).not_to eq("Harry Potter")
  end 

  it 'has a card' do
  myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("guess",myCard)
  expect(turn.card).to eq(myCard)
  end

  it 'guess returns the original guess' do
  myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("guess",myCard)
  expect(turn.guess).to eq("guess")
  expect(turn.guess).not_to eq "Hermione Granger"
  end

  it 'correct? returns if the correct answer was given' do
  myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau",myCard)
  expect(turn.correct?).to eq true
  end

  it 'correct? returns if the incorrect answer was given' do
  myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Anchorage",myCard)
  expect(turn.correct?).to eq false
  end

  it 'feedback returns \'Correct!\' if the correct answer was given' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",myCard)
    expect(turn.feedback).to eq "Correct!"
  end

  it 'feedback returns \'Incorrect.\' if the incorrect answer is given' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Anchorage",myCard)
  expect(turn.feedback).to eq "Incorrect."
  end
end