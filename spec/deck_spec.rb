# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/deck'
require 'rspec'

RSpec.describe Deck do
  it 'exists' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'can hold cards' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards).to eq(cards)
  end

  it 'can be counted' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)
  end

  it 'can find cards by category' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
  end

  it 'can find cards by category 2' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:Geography)).to eq([card1])
  end

  it 'can find cards by category 3' do
    card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expect(deck.cards_in_category('Pop Culture')).to eq([])
  end
end
