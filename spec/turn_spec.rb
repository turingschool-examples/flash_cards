require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_a(Turn)
  end

  it 'can have a card' do
    expect(@turn.card).to be_instance_of(Card)
    expect(@turn.card).to eq(@card)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'was guessed correctly' do
    expect(@turn.correct?).to eq(true)
  end

  it 'has correct feedback' do
    expect(@turn.feedback).to eq("Correct!")
  end

  it 'can recieve an incorrect guess' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.guess).to eq("Saturn")
  end

  it 'returns incorrect feedback' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq("Incorrect.")
  end
  # binding.pry
end
