# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/deck'
require 'rspec'

describe Deck do
  describe 'Initialization' do
    it 'is an instance of Deck' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck).to be_instance_of(Deck)
    end
  end

  describe 'Hold and count cards' do
    it 'can hold cards' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards).to eq(cards)
    end

    it 'can count cards' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end
  end

  describe 'Find cards by category' do
    it 'can find cards by category-1' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
    end

    it 'can find cards by category-2' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:Geography)).to eq([card1])
    end

    it 'can find cards by category-3' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category('Pop Culture')).to eq([])
    end
  end

  describe 'List categories' do
    it 'can return a list of categories' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)

      expect(deck.categories).to eq(%w[Geography STEM])
    end
  end
end
