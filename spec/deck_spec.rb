require './lib/deck'

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    expect(deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    expect(deck.cards).to eq([card1,card2,card3])
  end

  it 'counts the cards' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    expect(deck.count).to eq(3)
  end

  it 'tracks categories' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("1 + 1", "2", :Math)
    card3 = Card.new("1 * 1", "1", :Math)
    deck = Deck.new([card1,card2,card3])
    expect(deck.cards_in_category(:Math)).to eq([card2,card3])
  end


end
