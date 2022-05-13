require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


describe Round do
  describe 'initialize' do
    it 'initializes with a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.deck).to eq(deck)
    end
  end

  describe 'turns method' do
    it 'returns the current card with question, answer, category and guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.turns).to eq([])
    end
  end

  describe 'current_card method' do
    it 'returns the current card with question, answer, category and guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.current_card).to eq(deck.cards[0])
    end
  end

  describe 'take_turn method' do
    it 'takes a string (the guess) and creates a new Turn object with guess and Card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.take_turn("Juneau")).to be_a (Turn)
    end
  end

  describe 'new_turn' do
    it 'new turn is a class' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.class).to eq(Turn)
    end
  end

  describe 'correct? method' do
    it 'checks guess against answer; returns true or false' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
    end
  end

end
