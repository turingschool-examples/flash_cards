require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'rspec'


describe CardGenerator do
  it 'exists' do

  cards = File.open("./lib/cards2.txt", "r")

  card_generator = CardGenerator.new(cards)

  expect(card_generator).to be_a(CardGenerator)

  end

end
