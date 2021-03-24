require './lib/card'
require './lib/deck'

RSpec.describe Deck do
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
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it "has the correct number of cards" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)

    expect(deck.cards.count).to eq(5)
  end

  it "can return cards of a specific category" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
# require "pry"; binding.pry
    expect(deck.cards_in_category(:Sports)).to eq([card4])
  end

  it "can retrun multiple cards from the same category" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Geography)).to eq([card1,card2])
  end

  it "doesn't return cards if none match the category" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Fight)).to eq([])
  end
end
