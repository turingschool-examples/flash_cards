require_relative '../lib/card'
require_relative '../lib/turn'
require 'rspec'
require 'pry'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'is correct' do
    expect(@turn.correct?).to be true
  end

  it 'gives correct feedback' do
    expect(@turn.feedback).to eq("Correct!")
  end

  it 'handles incorrect guesses' do
    incorrect_turn = Turn.new("Anchorage", @card)
    expect(incorrect_turn.correct?).to be false
    expect(incorrect_turn.feedback).to eq("Incorrect.")
  end
end