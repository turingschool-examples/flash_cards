require './lib/card'
require './lib/deck'
require './lib/turn'
require 'rspec'

RSpec.describe Deck do

  it 'exists' do

    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3,card4])
    expect(deck).to be_instance_of(Deck)
  end

  it "returns a count of cards" do

    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    expect(deck.count).to eq 4
  end

  it "returns cards in category" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    expect(deck.cards_in_category(:Geography)).to eq [card1, card2]
  end
end
