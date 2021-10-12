require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'take a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be true
  end

  # it 'give feedback' do
  #   turn = Turn.new("Juneau", card)
  #   expect(turn.feedback).to eq('Correct!')
  # end
  #
  # it 'wrong answer feedback' do
  #   turn = Turn.new("Anchorage", card)
  #   expect(turn.feedack).to eq('Incorrect')
  # end
end
