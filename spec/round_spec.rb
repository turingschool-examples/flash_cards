# frozen_string_literal: true

require_relative '../lib/round'
require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/turn'
require 'rspec'

RSpec.describe Round do
  describe 'Initialize' do
    it 'is an instance of Round' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.deck).to eq(deck)
    end
  end

  describe 'Turns' do
    it 'has turns' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end

    describe 'Store and track turns' do
      it 'can store turns' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn('Juneau')

        expect(round.turns).to eq([new_turn])
      end

      it 'can track amount of turns' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.turns.count).to eq(2)
      end
    end

    describe 'Move to next turn' do
      it 'starts on the first card' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card1)
      end

      it 'can take a turn' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn('Juneau')

        expect(new_turn).to be_instance_of(Turn)
      end

      it 'can move to the next card' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')

        expect(round.current_card).to eq(card2)
      end

      it 'can move to last card' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.current_card).to eq(card3)
      end
    end
  end

  describe 'Track statistics' do
    it 'can be correct' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn('Juneau')

      expect(new_turn.correct?).to be true
    end

    it 'can give feedback' do
      card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
      card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
      card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn('Juneau')
      round.take_turn('Venus')

      expect(round.turns.last.feedback).to eq('Incorrect.')
    end

    describe 'Number correct' do
      it 'can track amount of correct answers' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')

        expect(round.number_correct).to eq(1)
      end

      it 'does not include incorrect answers' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.number_correct).to eq(1)
      end

      it 'can track number correct by category-1' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.number_correct_by_category(:Geography)).to eq(1)
      end

      it 'can track number correct by category-2' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.number_correct_by_category(:STEM)).to eq(0)
      end
    end

    describe 'Percent correct' do
      it 'can track percent correct' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.percent_correct).to eq(50.0)
      end

      it 'can track percent correct by category' do
        card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
        card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      end
    end
  end
end
