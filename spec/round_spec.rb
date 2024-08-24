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
    # todo

    expect(round.turns).to_be empty
  end

  it 'has at least one card' do
  end

  it 'takes a turn' do
  end

  it 'can guess correctly' do
  end

  it 'can guess incorrectly' do
  end

  it 'returns the number of correct guesses by category' do
  end

  it 'returs the % correct by cateogy' do
  end

  it 'returns the total % correct' do
  end
end
