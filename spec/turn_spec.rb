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
  #
  # it 'has an answer' do
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   expect(card.answer).to eq("Juneau")
  # end
  #
  # it 'has a category' do
  #   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #
  #   expect(card.category).to eq(:Geography)
  # end
end
