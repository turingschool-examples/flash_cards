require '../lib/card'
require '../lib/deck'
require '../lib/round'
require '../lib/turn'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end

  describe Deck do
    it 'exists' do
      card = Card.new("Q1", "A1", :C1)
      card_two = Card.new("Q2", "A2", :C2)
      card_three = Card.new("Q3", "A3", :C3)

      card_array = [card, card_two, card_three]

      deck = Deck.new(card_array)

      expect(deck).to be_instance_of(Deck)
    end
  end
end
