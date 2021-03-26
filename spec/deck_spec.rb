require_relative '../lib/card.rb'
require_relative '../lib/deck.rb'

RSpec.describe Deck do
  describe '#initialize' do
    card1 = Card.new("1+1?", "2", :Math)
    card2 = Card.new("Who was the person?", "Henry II", :History)
    card3 = Card.new("Name of spine muscle?", "Erector spinae", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    it 'exists' do
      expect(deck).to be_instance_of(Deck)
    end
  end

  describe "#count" do
    card1 = Card.new("1+1?", "2", :Math)
    card2 = Card.new("Who was the person?", "Henry II", :History)
    card3 = Card.new("Name of spine muscle?", "Erector spinae", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    it 'can count cards' do
      expect(deck.count).to eq(3)
    end
  end

  describe "#cards_in_category" do
    card1 = Card.new("1+1?", "2", :Math)
    card2 = Card.new("Who was the person?", "Henry II", :History)
    card3 = Card.new("Name of spine muscle?", "Erector spinae", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    it 'can select card categories' do
      expect(deck.cards_in_category(:History)).to be_instance_of(Array)
    end

    it 'can count categorized cards' do
      math_cards = deck.cards_in_category(:Math)
      expect(math_cards.count).to eq(1)
    end
  end

end
