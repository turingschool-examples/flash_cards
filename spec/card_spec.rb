require '../lib/card'
require '../lib/deck'
require '../lib/round'
require '../lib/turn'


# card.rb tests
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

  # deck.rb tests

  describe Deck do
    it 'exists' do
      card = Card.new("Q1", "A1", :C1)
      card_two = Card.new("Q2", "A2", :C2)
      card_three = Card.new("Q3", "A3", :C3)

      card_array = [card, card_two, card_three]

      deck = Deck.new(card_array)

      expect(deck).to be_instance_of(Deck)
    end

    it 'can read internal array' do

      card = Card.new("Q1", "A1", :C1)
      card_two = Card.new("Q2", "A2", :C2)
      card_three = Card.new("Q3", "A3", :C3)

      card_array = [card, card_two, card_three]

      deck = Deck.new(card_array)

      expect(deck.cards).to eq(card_array)
    end

    it 'can return internal array size' do

      card = Card.new("Q1", "A1", :C1)
      card_two = Card.new("Q2", "A2", :C2)
      card_three = Card.new("Q3", "A3", :C3)

      card_array = [card, card_two, card_three]

      deck = Deck.new(card_array)

      expect(deck.count).to eq(card_array.size)

    end

    it 'can return elements as array based on symbol input' do

      card = Card.new("Q1", "A1", :C1)
      card_two = Card.new("Q2", "A2", :C2)
      card_three = Card.new("Q3", "A3", :C3)

      card_array = [card, card_two, card_three]

      deck = Deck.new(card_array)

      expect(deck.cards_in_category(:C1)).to match_array(deck.cards[0])

    end

  end

    # turn.rb tests

  describe 'Turn' do
    it 'is an instance of Turn' do

      card = Card.new("Q1", "A1", :C1)
      turn = Turn.new("A1", card)
      expect(turn).to be_instance_of(Turn)

    end

    it 'can return internal card' do

      card = Card.new("Q1", "A1", :C1)
      turn = Turn.new("A1", card)
      expect(turn.card).to eq(card)

    end

    it 'can return guess string' do

      card = Card.new("Q1", "A1", :C1)
      turn = Turn.new("A1", card)
      expect(turn.guess).to eq("A1")

    end
  end



end
