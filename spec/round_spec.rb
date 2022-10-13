require 'RSpec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
      expect(round.current_card).to eq(card_1)
    end
  end

  describe '#take_turn' do
    it 'correctly instantiates and adds a new turn to @turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn = round.take_turn("jelly")

      expect(turn).to eq(round.turns[0])
      expect(round.turns.length).to eq(1)
      expect(round.current_card).to eq(card_2)

    end
  end

  describe '#number_correct' do
    it 'correctly counts number of correct guesses in @turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn("jelly")
      round.take_turn("Denver")
      round.take_turn("Hegel")

      expect(round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'counts number of correct guesses of specific category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn("jelly")
      round.take_turn("Denver")
      round.take_turn("Hegel")

      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end
  end

  describe '#percent_correct' do
    it 'returns percent of turns answered correctly' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn("jelly")
      round.take_turn("Denver")
      round.take_turn("Hegel")

      expect(round.percent_correct).to eq((2.0 / 3.0) * 100.0)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns percent of turns of specific category answered correctly' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
      card_3 = Card.new("Which German philosopher greatly influenced Karl Marx?", "Hegel", :Philosophy)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn("jelly")
      round.take_turn("Denver")
      round.take_turn("Hegel")

      expect(round.percent_correct_by_category(:Geography)).to eq(50.0)
    end
  end

end
