require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do

  before :each do
    @card_1 = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    @card_2 = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
    @card_3 = Card.new("Which element has the symbol 'B'?", "Boron", :Metalloids)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it 'is a collection of flash cards' do

    expect(@deck).to be_instance_of Deck
    expect(@deck.cards).to eq(@cards)
  end

  it 'is a count of cards in the deck' do

    expect(@deck.count).to eq(3)
  end

  it 'has a reactive nonmetals category' do

    expect(@deck.cards_in_category(:ReactiveNonmetals)).to eq([@card_1])
  end

  it 'has a noble gases category' do

    expect(@deck.cards_in_category(:NobleGases)).to eq([@card_2])
  end

  it 'has a metalloids category' do

    expect(@deck.cards_in_category(:Metalloids)).to eq([@card_3])
  end
end
