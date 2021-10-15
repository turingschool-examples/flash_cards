require './lib/card'
require './lib/card_generator.rb'

describe CardGenerator do
  # setup all tests
  before(:each) do
    filename = 'cards.txt'
    @cards = CardGenerator.new(filename).cards
  end

  # check that a proper card object is generated
  it 'returns cards' do
    expect(@cards[0]).to be_instance_of(Card)
  end

  # check that all cards are gathered from the file
  it 'returns the correct number of cards' do
    expect(@cards.length).to eq(4)
  end

  # check that the cards have the exact expected values
  it 'returns the correct card' do
    expect(@cards[0].question).to eq('What is 5 + 5?')
    expect(@cards[0].answer).to eq('10')
    expect(@cards[0].category).to eq('STEM')
  end
end
