require './lib/card'
require './lib/deck'

describe Deck do
  it "first card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card_1).to be_instance_of(Card)
  end

  it "second card" do
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    expect(card_2).to be_instance_of(Card)
  end

  it "third card" do
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    expect(card_3).to be_instance_of(Card)
  end

  it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    # deck = Deck.new(card_1, card_2, card_3)
    expect(deck).to be_instance_of(Deck)
  end

  it "list of cards" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq(cards)
  end

  it "how many cards" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.count).to eq(3)
  end

    it "cards in STEM category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      deck.cards_in_category(:STEM)
      expect(deck.found_cards).to eq([card_2, card_3])
    end

    it "cards in Geography category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      deck.cards_in_category(:Geography)
      expect(deck.found_cards).to eq([card_1])
    end

    it "cards in Pop Culture category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      deck.cards_in_category("Pop Culture")
      expect(deck.found_cards).to eq([])
    end

end
