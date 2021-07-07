require "rspec"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"

describe Round do
  describe "#current_card" do
    cards = CardSetup.new
    deck = Deck.new(cards)
    round = Round.new(deck)
    it "can get back to current card" do
      expect(round.current_card),
deck.cards.first
    end     
  end
end
