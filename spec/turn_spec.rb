require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @correct_turn = Turn.new("Juneau", @card)
    @incorrect_turn = Turn.new('Fairbanks', @card)
  end

  it 'exists' do
    expect(@correct_turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    expect(@correct_turn.card).to eq(@card)
  end

  it 'has a guess' do
    expect(@correct_turn.guess).to eq('Juneau')
  end

  it 'returns true or false if guess is correct' do
    expect(@correct_turn.correct?).to eq(true)
    expect(@incorrect_turn.correct?).to eq(false)
  end

  it 'can provide formatted feedback on correctness of guess' do
    expect(@correct_turn.feedback).to eq('Correct!')
    expect(@incorrect_turn.feedback).to eq('Incorrect.')
  end
end
