require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do

  it 'exists with attribute deck' do
    cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
    expect(round.deck).to eq(deck)
  end

  it 'starts with an empty turns array' do
    cards = [Card.new("What is the capital of Alaska?", "Juneau", :Geography)]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  describe '#current_card ' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
    card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    it 'starts with the first card in the deck' do

      expect(round.current_card).to eq(card_1)
    end

    it 'progresses to the next card after a turn is taken' do
      turn = round.take_turn("Juneau")

      expect(round.current_card).to eq(card_2)
    end
  end

  describe '#take_turn ' do
    it 'creates a Turn object and adds it to turns array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
      card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("Juneau")

      expect(turn).to be_instance_of(Turn)
      expect(round.turns).to include(turn)
    end
  end

  describe '#number_correct ' do
    it 'calculates total number correct turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
      card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("Juneau")
      turn = round.take_turn("Medellin")
      turn = round.take_turn("Mercury")

      expect(round.number_correct).to eq(2)
    end
  end

  describe '#percent_correct ' do
    it'calculates total percent correct turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
      card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("Juneau")
      turn = round.take_turn("Medellin")
      turn = round.take_turn("Mercury")

      expect(round.percent_correct).to eq(66.6)
    end
  end

  describe '#number_correct_by_category ' do
    it'calculates number correct turns by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
      card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("Juneau")
      turn = round.take_turn("Bogota")
      turn = round.take_turn("Venus")

      expect(round.number_correct_by_category(:Geography)).to eq(2)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  describe '#percent_correct_by_category ' do
    it'calculates percent correct turns by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colombia?", "Bogota", :Geography)
      card_3 = Card.new("What planet is closest to the sun?", "Mercury", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("Juneau")
      turn = round.take_turn("Bogota")
      turn = round.take_turn("Venus")

      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.percent_correct_by_category(:STEM)).to eq(0.0)
    end
  end

end
