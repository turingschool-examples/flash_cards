require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'is initialized with a card object and a guess string' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'contains and can return a single card' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.card).to be_instance_of(Card)
  end

  xit 'can return the inputted guess' do
  end

  xit 'returns true if the guess matches the answer' do
  end

  xit 'returns false if the guess does not match' do
  end

  xit 'returns feedback if guess is correct' do
  end

  xit 'returns feedback if guess is not correct' do
  end
end
