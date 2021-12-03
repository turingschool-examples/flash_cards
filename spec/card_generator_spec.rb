require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    card_gen = CardGenerator.new(filename)
    expect(card_gen).to be_instance_of(CardGenerator)
  end

  xit 'builds a card from cards.txt file' do
    card_1 = Card.new('What recording artist in 1993 changed their name to a symbol that is not included in the Ruby character map?', 'Prince', :FamousPeople)

  end
end
