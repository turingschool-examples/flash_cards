require './lib/deck'

describe Deck do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end

  describe '#count' do
    it 'can count' do
      # setup
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      # execute and assess
      expect(deck.count).to eq(3)

      # try a second version
      cards = [card_2, card_1]
      deck = Deck.new(cards)
      expect(deck.count).to eq(2)
    end
  end


  describe '#cards_in_category' do
    it 'returns only cards of correct category' do
      # setup
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      answer_1 = [card_2, card_3]
      answer_2 = [card_1]
      deck = Deck.new(cards)
      # execute and assess
      #require "pry"; binding.pry
      expect(deck.cards_in_category(:STEM)).to eq(answer_1)
      #expect(deck.cards_in_category(:Geography)).to eq(answer_2)
      #expect(deck.cards_in_category(:test)).to eq(nil)
    end
  end


end
