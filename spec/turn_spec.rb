require 'rspec'
require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'exists' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("My guess",card)

    expect(card).to be_instance_of(Card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("My guess",card)

    expect(turn.guess).to eq("My guess")
  end

  it 'returns true if guess matches exactly' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau",card)

    expect(turn.correct?).to be true
  end

  # it 'has a category' do
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   expect(card.category).to eq(:Geography)
  # end
end
