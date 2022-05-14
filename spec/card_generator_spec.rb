require 'rspec'
require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do

  it 'exists' do

    cards = CardGenerator.new()

    expect(cards).to be_instance_of(CardGenerator)

  end

  it 'takes a filename as parameter' do

    filename = "cards.txt"

    cards = CardGenerator.new(filename)

    expect(cards.filename).to eq("cards.txt")

  end

end
