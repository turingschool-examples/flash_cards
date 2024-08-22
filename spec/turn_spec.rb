require './lib/turn.rb'
require './lib/card.rb'

RSpec.describe Turn do
  it 'exists' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess",myCard)
    expect(turn).to be_instance_of(Turn)
  end

  xit 'has the user\'s guess' do 
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", myCard)
    expect(turn).guess.to eq("guess")
    expect(turn).guess.not_to eq("Harry Potter")
  end 

  xit 'has a card' do
  myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("guess",myCard)
  expect(turn).card.to eq(myCard)
  end

  xit 'guess returns the original guess' do
  end

  xit 'correct? returns if the correct answer was given' do
  end

  xit 'correct? returns if the incorrect answer was given' do
  end

  xit 'feedback returns \'Correct!\' if the correct answer was given' do
  end

  xit 'feedback returns \'Incorrect.\' if the incorrect answer is given' do
  end
end