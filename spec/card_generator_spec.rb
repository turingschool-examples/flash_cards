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
end
