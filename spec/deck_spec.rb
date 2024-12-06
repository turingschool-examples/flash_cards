# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/deck'
require 'rspec'

describe Deck do
  let(:first_card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let(:second_card) { Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM) }
  let(:third_card) { Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM) }
  let(:cards) { [first_card, second_card, third_card] }
  let(:deck) { Deck.new(cards) }

  describe 'Initialization' do
    it 'is an instance of Deck' do
      expect(deck).to be_instance_of(Deck)
    end
  end

  describe 'Hold and count cards' do
    it 'can hold cards' do
      expect(deck.cards).to eq(cards)
    end

    it 'can count cards' do
      expect(deck.count).to eq(3)
    end
  end

  describe 'Find cards by category' do
    it 'can find cards by category-1' do
      expect(deck.cards_in_category(:STEM)).to eq([second_card, third_card])
    end

    it 'can find cards by category-2' do
      expect(deck.cards_in_category(:Geography)).to eq([first_card])
    end

    it 'can find cards by category-3' do
      expect(deck.cards_in_category('Pop Culture')).to eq([])
    end
  end

  describe 'List categories' do
    it 'can return a list of categories-symbols' do
      expect(deck.categories).to eq(%i[Geography STEM])
    end

    it 'can return a list of categories-strings' do
      first_card = Card.new('What is the capital of Alaska?', 'Juneau', 'Geography')
      second_card = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', 'STEM')
      third_card = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', 'STEM')
      cards = [first_card, second_card, third_card]
      deck = Deck.new(cards)

      expect(deck.categories).to eq(%w[Geography STEM])
    end
  end
end
