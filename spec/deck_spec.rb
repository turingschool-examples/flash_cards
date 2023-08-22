require './lib/deck'
require './lib/card'

RSpec.describe Card do
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]

  it 'exists' do
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it "has cards" do
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end

  it "has a count" do
    deck = Deck.new(cards)
    expect(deck.count).to eq(3)
  end

  it "is in a category" do
    deck = Deck.new(cards)
    expect(deck.cards_in_a_category(:STEM)).to eq([card_2, card_3])
  end

  it "is in a category" do
    deck = Deck.new(cards)
    expect(deck.cards_in_a_category(:Geography)).to eq([card_1])
  end

  it "is in a category" do
    deck = Deck.new(cards)
    expect(deck.cards_in_a_category("Pop Culture")).to eq([])
  end
end