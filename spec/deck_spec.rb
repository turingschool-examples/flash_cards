require './lib/card'
require './lib/deck'

#what else do I need to test?
RSpec.describe Deck do

  before(:each) do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
       reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
      clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    @deck = Deck.new(cards)
  end

  it 'exists' do

    expect(@deck). to be_instance_of(Deck)
  end

  it '#count' do
    expect(@deck.count). to eq(3)
  end

  it 'cards_in_category - Geography' do
    expect(@deck.cards_in_category(:Geography).length). to eq(1)
  end

  it 'cards_in_category - STEM' do
    expect(@deck.cards_in_category(:STEM).length). to eq(2)
  end

  it 'cards_in_category - STEM' do
    expect(@deck.cards_in_category(:STEM).length). to eq(2)
  end

  it 'cards_in_category - Pop culture' do
    expect(@deck.cards_in_category("PopCulture").length). to eq(0)
  end

end
