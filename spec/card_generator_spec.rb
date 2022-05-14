require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

describe 'Card Generator' do

  it 'will generate an array of cards' do
  filename = './lib/cards.txt'
  cards = CardGenerator.new(filename).cards

  expect(cards[0]).to be_a Card
  end

end
