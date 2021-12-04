require './lib/card'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  it 'has a correct answer' do
    expect(@turn.correct?).to be(true)
  end

  it 'gives feedback for correct answer' do
    expect(@turn.feedback).to eq("Correct!")
  end

  it 'gives feedback for incorrect answer' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to be (false)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
