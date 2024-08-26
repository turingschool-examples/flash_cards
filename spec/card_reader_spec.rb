require './lib/card_reader.rb'
require './lib/deck.rb'
require './lib/card.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Card_reader do

it 'exists' do
  deck_file = './lib/resources/deck1.txt'
  card_reader1 = Card_reader.new(deck_file)

  expect(card_reader1).to be_instance_of(Card_reader)
end

it 'creates a deck with one card' do
  deck_file = './lib/resources/deck1.txt'
  card_reader1 = Card_reader.new(deck_file)
  deck1 = card_reader1.create_deck

  expect(deck1).to be_instance_of(Deck)
  expect(deck1.count).to eq(1)
  expect(deck1.cards[0]).to be_instance_of(Card)
  expect(deck1.cards[0].question).to eq("What type of cheese is used to make an Alfredo sauce?")
  expect(deck1.cards[0].answer).to eq("Parmesan")
  expect(deck1.cards[0].category).to eq(:Cooking)
end

#read multiple card deck
#build a deck to be able to pass to round
end