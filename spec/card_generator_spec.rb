require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

describe 'Card Generator' do

  it 'will '
  filename = "cards.txt"
  cards = CardGenerator.new(filename).cards

  expect(cards).to eq [Card, Card, Card, Card]
end

# omyzsh !
# ctrl + r
