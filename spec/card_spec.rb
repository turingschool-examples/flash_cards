require './lib/card' # Loads the Card class

RSpec.describe Card do
  it 'exists' do
    # Create an instance of Card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Check if card is an instance of the Card class
    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    # Create an instance of Card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Check if the card's question is set correctly
    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    # Create an instance of Card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Check if the card's answer is set correctly
    expect(card.answer).to eq("Juneau")
  end

  it 'has a category' do
    # Create an instance of Card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    # Check if the card's category is set correctly
    expect(card.category).to eq(:Geography)
  end
end

