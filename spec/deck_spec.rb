require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do

  it 'stores cards' do
    card_1 = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)

    card_2 = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)

    card_3 = Card.new("Which element has the symbol 'B'?", "Boron", :Metalloids)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

  end

  end
