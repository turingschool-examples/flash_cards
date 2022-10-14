require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

describe Round do
  describe '#initialize' do
    it 'is an instance of Round' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
    end

    it 'has Decks' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards_1 = [card_1, card_2, card_3]
      cards_2 = [card_3, card_1]
      deck_1 = Deck.new(cards_1)
      deck_2 = Deck.new(cards_2)
      round_1 = Round.new(deck_1)
      round_2 = Round.new(deck_2)

      expect(round_1.deck).to eq(deck_1)
      expect(round_2.deck).to eq(deck_2)
    end

    it 'can have turns' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end
  end

  describe '#current_card' do
    it 'returns the current card based on turns completed' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards_1 = [card_1, card_2, card_3]
      cards_2 = [card_2, card_3, card_1]
      deck_1 = Deck.new(cards_1)
      deck_2 = Deck.new(cards_2)
      round_1 = Round.new(deck_1)
      round_2 = Round.new(deck_2)

      expect(round_1.current_card).to eq(card_1)
      expect(round_2.current_card).to eq(card_2)
    end
  end

  describe '#take_turn' do
    it 'creates a turn class instance' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.take_turn('Juneau')).to be_instance_of(Turn)
    end

    it 'creates a new turn object' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Juneau')

      expect(new_turn.class).to eq Turn
    end

    it 'can call turn methods' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Juneau')

      expect(new_turn.correct?).to be true
    end

    it 'stores the new turn in the round' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Juneau')

      expect(round.turns).to eq([new_turn])
    end

    it 'advances the turn and adds the next card' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn_1 = round.take_turn('Juneau')
      turn_2 = round.take_turn('Venus')
      
      expect(round.turns.count).to eq(2)
      expect(round.current_card).to eq(card_3)
    end
  end

  describe '#number_correct' do
    it 'counts the number of correct answers in a round' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Juneau')
      new_turn_2 = round.take_turn('Venus')
      new_turn_3 = round.take_turn('North north west')

      expect(round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'counts the number of correct answers in a round based on category' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn_1 = round.take_turn('Juneau')
      turn_2 = round.take_turn('Mars')
      turn_3 = round.take_turn('North north west')

      expect(round.number_correct_by_category(:STEM)).to eq(2)
    end
  end

  describe '#percent_correct' do
    it 'returns a percentage of correct answers' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn_1 = round.take_turn('Juneau')
      turn_2 = round.take_turn('Venus')
      turn_3 = round.take_turn('North north west')

      expect(round.percent_correct).to eq(67.0)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns a percentage of correct answers by category' do
      card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      turn_1 = round.take_turn('Juneau')
      turn_2 = round.take_turn('Venus')
      turn_3 = round.take_turn('North north west')

      expect(round.percent_correct_by_category(:STEM)).to eq(50.0)
    end
  end
end
