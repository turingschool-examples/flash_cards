require 'rspec'
require './lib/card_generator'

describe CardGenerator do
  
  it '#initialize' do
  filename = 'cards.txt'
  cards = CardGenerator.new(filename)

  expect(cards).is_a? CardGenerator
  end
  
end