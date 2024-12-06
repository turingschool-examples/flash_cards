# Test file for the Deck class
require './lib/card' # Require the Card class
require './lib/deck' # Require the Deck class

RSpec.describe Deck do
  # Test: Ensure the Deck object is created with correct attributes
  it 'exists and has attributes' do
    # Create some Card instances
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photos of which planet?", "Mars", :STEM)
    card_3 = Card.new("What is 5 + 5?", "10", :Math)

    # Create a Deck instance with the cards
    deck = Deck.new([card_1, card_2, card_3])

    # Check that the deck is an instance of the Deck class
    expect(deck).to be_a(Deck)
    # Verify the cards attribute contains the correct cards
    expect(deck.cards).to eq([card_1, card_2, card_3])
  end

  # Test: Count the number of cards in the deck
  it 'counts the cards in the deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photos of which planet?", "Mars", :STEM)
    card_3 = Card.new("What is 5 + 5?", "10", :Math)

    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.count).to eq(3)
  end

  # Test: Filter cards by category
  it 'filters cards by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photos of which planet?", "Mars", :STEM)
    card_3 = Card.new("What is 5 + 5?", "10", :Math)

    deck = Deck.new([card_1, card_2, card_3])

    expect(deck.cards_in_category(:STEM)).to eq([card_2])
    expect(deck.cards_in_category(:Geography)).to eq([card_1])
    expect(deck.cards_in_category(:History)).to eq([])
  end
end
