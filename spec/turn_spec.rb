require 'rspec'
require './lib/card'
require './lib/turn'


RSpec.describe Turn do

  it 'has a turn' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

describe 'guess' do
  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end
end

describe '#correct?' do
  it 'has the correct answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end
end

describe 'feedback' do
  it 'has feedback to the answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card)
    turn_2 = Turn.new("Golden", card)

    expect(turn_1.correct?).to eq(true)
    expect(turn_2.correct?).to eq(false)
  end
  end
end
