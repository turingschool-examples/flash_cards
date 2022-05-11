require 'rspec'
require 'card'
require 'card_generator'

RSpec.describe CardGenerator do
  it 'has an instance of Card Generator' do
  filename = 'cards.txt'
  cards = CardGenerator.new(filename)
  expect(cards).to be_an_instance_of(CardGenerator)
  end
end
