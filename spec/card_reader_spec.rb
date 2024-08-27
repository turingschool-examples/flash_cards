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

it 'creates a deck with 0 cards' do
  deck_file = './lib/resources/deck3.txt'
  card_reader1 = Card_reader.new(deck_file)
  deck1 = card_reader1.create_deck

  expect(deck1).to be_instance_of(Deck)
  expect(deck1.count).to eq(0)
end

it 'creates a deck with four cards' do
  deck_file = './lib/resources/deck2.txt'
  card_reader1 = Card_reader.new(deck_file)
  deck1 = card_reader1.create_deck

  expect(deck1).to be_instance_of(Deck)
  expect(deck1.count).to eq(4)
  expect(deck1.cards[0]).to be_instance_of(Card)
  expect(deck1.cards[0].question).to eq("What is the capital of Alaska?")
  expect(deck1.cards[0].answer).to eq("Juneau")
  expect(deck1.cards[0].category).to eq(:Geography)
  expect(deck1.cards[3]).to be_instance_of(Card)
  expect(deck1.cards[3].question).to eq("What is objectively the best rodent?")
  expect(deck1.cards[3].answer).to eq("Capybara")
  expect(deck1.cards[3].category).to eq(:STEM)
  end
end