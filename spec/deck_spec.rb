require 'rspec'
require './lib/card'
require './lib/deck'



describe Deck do
  describe "#initialize" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards =  [card_1, card_2, card_3]
    deck = Deck.new(cards)
    #require "pry"; binding.pry
    it 'is a deck' do
      expect(deck).to be_instance_of(Deck)
    end
    it 'has cards' do
      expect(deck.cards).to eq ([card_1, card_2, card_3])
    end
    # it 'has a count(starts empty)' do
    #   expect(deck.count).to eq 0
    # end
    # it 'reads the card category' do
    #   expect(deck.cards_in_category).to eq
    # end
  end

  # describe "#add_card" do
  #   it 'can add a card' do
  #    deck = Deck.new(cards)
  #    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  #    cards =  [card_1, card_2, card_3]
  #    # deck.add_card(card_1)
  #    # deck.add_card(card_2)
  #    # deck.add_card(card_3)
  #    expect(deck.cards).to eq ([card_1, card_2, card_3])
  #   end
  # end

  describe "#count_cards" do
    it 'it can count the amount of cards' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards =  [card_1, card_2, card_3]
     deck = Deck.new(cards)
     # deck.add_card(card_1)
     # deck.add_card(card_2)
     # deck.add_card(card_3)
     expect(deck.count_cards).to eq 3
    end
  end

  describe "#cards_in_category" do
     it 'returns the cards in a a category' do
     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     cards =  [card_1, card_2, card_3]
     deck = Deck.new(cards)
     # deck.add_card(card_1)
     # deck.add_card(card_2)
     # deck.add_card(card_3)
     expect(deck.cards_in_category(:STEM)).to eq ([card_2, card_3])
   end
 end
end
