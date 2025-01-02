require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }
  let(:cards) { [card1, card2, card3] }
  let(:deck) { Deck.new(cards) }
  let(:category1) { :STEM }
  let(:category2) { :Geography }
  let(:category3) { "Pop Culture" }

  context "when an instance is created" do
    it "exists" do
      expect(deck).to be_an_instance_of(Deck)
    end

    it "has cards" do
      expect(deck.cards).to eq(cards)
    end

    it "returns a card count" do
      expect(deck.count).to eq(3)
    end

    context "when searching the deck for cards by specific category" do
      context "if there are cards present which match the category" do
        it "returns an array of only those cards which match" do
          expect(deck.cards_in_category(:STEM)).to eq([card2, card3])
        end
      end

      context "if there are no cards present which match the category" do
        it "returns an empty array" do
          expect(deck.cards_in_category("Pop Culture")).to eq([])
        end
      end
    end
  end
end