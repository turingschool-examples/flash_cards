require_relative '../lib/card'
require_relative '../lib/turn'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'pry'

RSpec.describe Card do
  it 'exists and has readable attributes' do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    
    @deck = Deck.new([@card_1, @card_2])
    
    expect(@deck).to be_a(Deck)
    expect(@deck.cards).to eq([@card_1, @card_2])
  end
 
 end
 