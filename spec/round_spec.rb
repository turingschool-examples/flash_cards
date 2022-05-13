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


    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'is a round of cards' do

    expect(@round).to be_instance_of Round
    expect(@round.deck).to eq(@deck)
  end

  it 'consists of turns' do

    expect(@round.turns).to eq([])
  end

  it 'draws the first card' do

   expect(@round.current_card).to eq(@card_1)
  end

  it 'takes its turn' do
    new_turn = @round.take_turn("Hydrogen")
    new_turn.class
    expect(new_turn.correct?).to be true
  end
end
