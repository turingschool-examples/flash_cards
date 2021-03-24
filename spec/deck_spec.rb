require './lib/card'
require './lib/deck'

Rspec.describe Turn do
  it 'exits' do
    card = Card.new('What is the capital of CO?', 'Denver', :Geography)
    cards = [card]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it "has cards" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Babe Ruth play?', '')
    cards = [card]
    deck = Deck.new(cards)

    expect(turn.cards).to eq(cards)
  end

  it ""
end
