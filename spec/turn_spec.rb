# Test file for the Turn class
require './lib/card' # Require the Card class
require './lib/turn' # Require the Turn class

RSpec.describe Turn do
  # Test: Ensure the Turn object is created with correct attributes
  it 'exists and has attributes' do
    # Create a Card instance and a Turn instance
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    # Check that the turn is an instance of the Turn class
    expect(turn).to be_a(Turn)
    # Verify the card and guess attributes are set correctly
    expect(turn.card).to eq(card)
    expect(turn.guess).to eq("Juneau")
  end

  # Test: Check if the guess is correct
  it 'checks if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    # Verify the guess is correct and feedback is "Correct!"
    expect(turn.correct?).to eq(true)
    expect(turn.feedback).to eq("Correct!")
  end

  # Test: Handle incorrect guesses
  it 'handles incorrect guesses' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    # Verify the guess is incorrect and feedback is "Incorrect."
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
