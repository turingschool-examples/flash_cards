require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/modules'


RSpec.describe Round do
  it 'exits' do
    card = Card.new('What is the capital of CO?', 'Denver', :Geography)
    cards = [card]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it "has a deck" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it "starts with no cards turned" do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'starts at with first card' do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(cards[0])
  end

  it 'can take and store a turn' do
    card1 = Card.new('What is the capital of CO?', 'Denver', :Geography)
    card2 = Card.new('What is the captial of Mexico?', 'Mexico City', :Geography)
    card3 = Card.new('What is the boiling point (degrees celcius) of water?', '100', :Science)
    card4 = Card.new('What position did Satchel Paige play?', 'pitcher', :Sports)
    card5 = Card.new('What element is abbreviated as Cl?', 'chlorine', :Science)
    cards = [card1, card2, card3, card4, card5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn("Denver")
require "pry"; binding.pry
    expect(round.current_card).to eq(deck.cards[1])
    expect(round.turns[0].guess).to eq("Denver")
    expect(round.turns[0].correct?).to eq(true)
    expect(round.turns[0].card).to eq(cards[0])
  end
end
