require 'rspec'
require './lib/card'
require './lib/deck'


describe Deck do
  describe "#initialize" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards, 3)
    it 'is a deck' do
      expect(deck).to be_instance_of(Deck)
    end
    it 'can add cards' do
      expect(deck.cards).to eq ([card_1, card_2, card_3])
    end
    it 'it can read the count' do
      expect(deck.count).to eq 3
    end
  end

  # describe '#add_card' do
  #   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  #   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  #   cards = [card_1, card_2, card_3]
  #   deck = Deck.new(cards, 3)
  #
  #   expect(deck.count).to eq 3
  # end

end
