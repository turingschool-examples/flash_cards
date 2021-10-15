require './lib/card'
require './lib/card_generator.rb'

describe CardGenerator do
  before(:each) do
    filename = 'cards.txt'
    @cards = CardGenerator.new(filename).cards
  end

  it 'returns cards' do
    expect(@cards[0]).to be_instance_of(Card)
  end

  it 'returns the correct card' do
    expect(@cards[0].question).to eq('What is 5 + 5?')
    expect(@cards[0].answer).to eq('10')
    expect(@cards[0].category).to eq('STEM')
  end
end
