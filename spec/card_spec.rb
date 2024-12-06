# Test file for the Card class
require './lib/card' # Require the Card class for testing

RSpec.describe Card do
  # Test: Ensure the Card object is created with correct attributes
  it 'exists and has attributes' do
    # Create a new Card instance
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Check that the card is an instance of the Card class
    expect(card).to be_a(Card)
    # Verify the question, answer, and category are set correctly
    expect(card.question).to eq("What is the capital of Alaska?")
    expect(card.answer).to eq("Juneau")
    expect(card.category).to eq(:Geography)
  end
end


