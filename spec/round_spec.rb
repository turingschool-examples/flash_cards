require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do

  before :each do
    @card_1 = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
    @card_2 = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
    @card_3 = Card.new("Which element has the symbol 'B'?", "Boron", :Metalloids)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'plays a round of cards' do

    expect(@round).to be_instance_of Round
    expect(@round.deck).to eq(@deck)
  end

  
end
