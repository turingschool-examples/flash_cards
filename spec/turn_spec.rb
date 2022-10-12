require 'rspec'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exist' do
    turn = Turn.new("Juneau", :card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has guess' do
    turn = Turn.new("Juneau", :card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'is correct' do
    turn = Turn.new("Juneau", :card)

    expect(turn.correct?).to eq(true)
  end

  it 'has feedback' do
    turn = Turn.new("Juneau", :card)

    expect(turn.feedback).to eq("Correct!")
  end
end
