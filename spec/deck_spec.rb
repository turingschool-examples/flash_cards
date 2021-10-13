require "rspec"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"

describe Deck do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it 'attributes' do
    expect(@deck.cards).to eq([@card_1, @card_2, @card_3])
    expect(@deck.count).to eq(3)
  end

  it 'cards_in_category' do
    expect(@deck.cards_in_category(:STEM)).to eq([@card_2, @card_3])
    expect(@deck.cards_in_category(:Geography)).to eq([@card_1])
    expect(@deck.cards_in_category("Pop Culture")).to eq([])
  end
end
