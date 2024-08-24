require './lib/card'
require './lib/turn'
require './lib/deck'

card1  = Card.new("What is Dr. Brown's specialty?", "Ultrasonography", "Personal")


card2 = Card.new("What does Dr. Reeve love?", "Poms", "Personal")


card3 = Card.new("What vein is best to place and IV catheter?", "Cephalic", "Medical")


cards = [card1, card2, card3]

deck = Deck.new(cards)

RSpec.describe Deck do
    it 'exists' do

      deck = Deck.new(cards)

    expect(deck).to be_a(Deck)
    end

    it "counts cards" do

        cards = [card1, card2, card3]

        deck = Deck.new(cards)

    expect(deck.cards.length).to eq(3)
    end

    it "can call a category" do

        cards = [card1, card2, card3]

        deck = Deck.new(cards)

    expect(deck.cards_in_category("Personal")).to include(card1, card2)
    end

end