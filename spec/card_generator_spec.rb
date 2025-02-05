require 'rspec'
require './lib/card'
require './lib/card_generator'

describe CardGenerator do
  before(:each) do
    @card_generation = CardGenerator.new("./cards.txt") # any file/path that has our cards in it.
  end

  it 'initialize' do
    expect(@card_generation).to be_an_instance_of(CardGenerator) # just making object for card gen
  end

  it 'will create the cards' do
    cards = @card_generation.cards
    # only works hardcoded. When I change the questions/add more etc this will fail
    expect(cards.count).to eq(4)
    expect(cards.first).to be_an_instance_of(Card)
    expect(cards.first.question).to eq("What is 5 + 5?")
    expect(cards.first.answer).to eq("10")
    expect(cards.first.category).to eq(:STEM)
    # very basic tests but I have 0 clue how to expand upon this without hardcoding
  end
end