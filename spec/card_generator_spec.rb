require './lib/card_generator'
require 'pry'
require 'csv'

RSpec.describe CardGenerator do
  it '*exists' do
    new_deck = CardGenerator.new('lib/cards.txt')
    expect(new_deck).to be_instance_of(CardGenerator)
  end

  it '*will create an array of strings' do
    new_deck = CardGenerator.new('lib/cards.txt')
    expect(new_deck.print).to 
  end

end
