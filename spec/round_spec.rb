require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Deck do
  it 'exists' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).not_to be_nil
  end

  it 'has no turns when created' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to be_empty
  end

  it 'has at least one card' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck.cards).to_not be_empty
  end

  it 'turn to be a turn' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('whaaa')

    expect(new_turn).to be_a(Turn)
  end

  it 'can count correct by category' do
    card_1 = Card.new('hi1', 'bye', :whaatok)
    card_2 = Card.new('hi2', 'bye', :whaatok)
    card_3 = Card.new('hi3', 'bye', :whaatok)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('bye')

    expect(new_turn).to eq(1)
  end

  xit 'can guess incorrectly' do
  end

  xit 'returns the number of correct guesses by category' do
  end

  xit 'returs the % correct by cateogy' do
  end

  xit 'returns the total % correct' do
  end
end
