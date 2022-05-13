require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

describe CardGenerator do
  before :each do
    @filename = File.open('cards.txt')
    @cards = CardGenerator.new(@filename)
  end

  it 'exists' do
    expect(@cards).to be_a CardGenerator
  end

end
