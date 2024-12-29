require 'rspec'
require_relative '../lib/card'
require_relative '../lib/card_generator'

RSpec.describe CardGenerator do
  before(:each) do
    @filename = 'cards.txt'  # Update the path to the correct location
    @card_generator = CardGenerator.new(@filename)
  end

  it 'exists' do #is an instance of CardGenerator
    expect(@card_generator).to be_instance_of(CardGenerator)
  end

  it 'can generate cards from a file' do #is reading the file and creating cards
    cards = @card_generator.cards

    expect(cards).to be_instance_of(Array)
    expect(cards.first).to be_instance_of(Card)
    expect(cards.first.question).to eq("What is 5 + 5?")
    expect(cards.first.answer).to eq("10")
    expect(cards.first.category).to eq("Math")
  end
end