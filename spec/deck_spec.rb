require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'

describe Deck do
  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('What is the capital of New York?', 'Albany', :Geography)
      card_3 = Card.new('What is the capital of California?', 'Sacramento', :Geography)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck).to be_instance_of(Deck)
    end
  end

  describe '#cards' do
    it 'should return the deck of card objects' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('What is the capital of New York?', 'Albany', :Geography)
      card_3 = Card.new('What is the capital of California?', 'Sacramento', :Geography)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck).to eq(cards)
    end
  end

  describe '#count' do
    it 'should return the quantity of cards in the deck' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('What is the capital of New York?', 'Albany', :Geography)
      card_3 = Card.new('What is the capital of California?', 'Sacramento', :Geography)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  describe '#cards_in_category' do
    it 'should return the object IDs of the cards in a given category' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.cards_in_category(:History)).to eq(cards[2]) # is this being implemented properly?
    end
  end
end
