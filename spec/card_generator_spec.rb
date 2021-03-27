require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'rspec'
require 'pry'

describe CardGenerator do
  it 'exists' do

  cards = File.open("./files/cards.txt", "r")
  card_generator = CardGenerator.new(cards)
  binding.pry
  expect(card_generator).to be_a(CardGenerator)
  end

  it 'can create a card' do

  

  end


end
