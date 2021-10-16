require "rspec"
require "./lib/card_generator"
filename = "cards.txt"

describe CardGenerator do
  before(:each) do
    @cards = CardGenerator.new(filename)
  end

  it 'exists' do
    expect(@cards).to be_an_instance_of(CardGenerator)
  end

  it 'has an array of cards' do
    expect(@cards.cards.class).to be(Array)
  end
end
