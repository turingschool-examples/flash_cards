require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.card).to eq card
    expect(turn.guess).to eq "Saturn"
  end

  it 'determines a correct answer' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.correct?).to eq false
    expect(turn.feedback).to eq "Incorrect"
  end

 

end