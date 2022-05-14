require 'rspec'
require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do

  xit 'exists' do

    cards = CardGenerator.new(test)

    expect(cards).to be_instance_of(CardGenerator)

  end

  it 'takes a filename as parameter' do

    filename = "./lib/cards.txt"

    cards = CardGenerator.new(filename)

    expect(cards.filename).to eq("./lib/cards.txt")

  end

  it 'returns text from the cards.txt file' do

    filename = "./lib/cards.txt"

    cards = CardGenerator.new(filename)

    expect(cards.get_text_content).not_to be_empty

  end

  it 'returns the number of lines in cards.txt file' do

    filename = "./lib/cards.txt"

    cards = CardGenerator.new(filename)

    expect(cards.get_text_content.count).to eq(2)

  end

  it 'creates cards based on number of lines' do

    filename = "./lib/cards.txt"

    cards = CardGenerator.new(filename)

    cards.get_text_content

    cards.card_creator

    expect(cards.card_array.length).to eq(2)

  end

end
