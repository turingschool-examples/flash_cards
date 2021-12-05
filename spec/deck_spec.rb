require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

  describe Card do
    it 'card_1 exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card_1).to be_instance_of(Card)
    end

    it 'card_2 exists' do
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      expect(card_2).to be_instance_of(Card)
    end

    it 'card_3 exists' do
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      expect(card_3).to be_instance_of(Card)
    end
  end

  describe Deck do
    it 'instance contains card array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards= [card_1, card_2, card_3]
      deck = Deck.new(cards)
    # binding.pry

      expect(deck.cards).to eq(cards)
    end

    it 'counts # of cards in deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end

    it 'idenitfy cards in Deck in Stem Category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
    end

    it 'idenitfy cards in Geography category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:Geography)).to eq([card_1])
    end


        it 'idenitfy cards within Pop Culture category' do
          card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
          card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
          card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
          cards = [card_1, card_2, card_3]
          deck = Deck.new(cards)

          expect(deck.cards_in_category("Pop Culture")).to eq([])
        end

  end
