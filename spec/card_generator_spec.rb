require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before :each do
    @filename = 'cards.txt'
    @cards_1 = CardGenerator.new(@filename)
  end

  it 'exists' do
    expect(@cards_1).to be_instance_of(CardGenerator)
  end

  it '#make_cards' do
  end
end
