require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    cards = [card]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end

  describe '#current_card' do
    it 'returns current card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      cards = [card]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.current_card).to eq(card)
    end
  end

  describe '#take_turn' do
    it 'returns current card, guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      cards = [card]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.take_turn("Juneau")).to eq(round.turns[-1])
    end
  end

  describe '#number_correct' do
    it 'returns number of guesses correct' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      cards = [card]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.number_correct).to eq(1)
    end
  end
  describe '#number_correct_by_category' do
    it 'returns the number of correct sorted by category' do
      card_1= Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      turn = Turn.new("Juneau", card_1)
      cards = [card_1, card_2]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
      expect(round.number_correct_by_category("Pop Culture")).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'returns total correct/total turns' do
      card_1= Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      turn = Turn.new("Juneau", card_1)
      cards = [card_1, card_2]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct).to eq(50)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns percent correct per category' do
      card_1= Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      turn = Turn.new("Juneau", card_1)
      cards = [card_1, card_2]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct_by_category(:Geography)).to eq(100)
      expect(round.percent_correct_by_category(:STEM)).to eq(0)
      expect(round.percent_correct_by_category("Pop Culture")).to eq(0)
    end
  end
end
