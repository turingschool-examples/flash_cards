require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

  let(:card_1) { Card.new("What is a blue?", "Color", :Basics)}
  let(:card_2) { Card.new("What is water?", "Liquid", :STEM)}
  let(:card_3) { Card.new("What is a bear?", "Animal", :Basics)}

  describe '#initialize' do
    it 'is a round class' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_a Round
    end

    it 'has an empty array of turns' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end
  end

  describe '#current_card' do
    it 'returns the first card in decks card array' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
    
      expect(round.current_card).to eq(card_1)
    end
  end  

  describe '#take_turn' do
    it 'creates a new instance of turn class' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
    
      new_turn = round.take_turn("Color")

      expect(new_turn).to be_a Turn
    end

    it 'adds the new instance of turn to round.turns' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Color")

      expect(round.turns.first).to eq(new_turn)
    end

    it 'counts each guess made' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turn_count).to eq(0)
      new_turn = round.take_turn("Color")
      expect(round.turn_count).to eq(1)
    end
  end

  describe '#number_correct' do
    it 'returns the number of correct guesses thus far' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      
      expect(round.number_correct).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct).to eq(1)
    end
   
    it 'can accurately count multiple correct answers' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      
      expect(round.number_correct).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct).to eq(1)

      another_turn = round.take_turn("Liquid") 
      expect(round.number_correct).to eq(2)
    end
    
    it 'does not count incorrect answers' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      
      expect(round.number_correct).to eq(0)

      new_turn = round.take_turn("Color")
      expect(round.number_correct).to eq(1)

      another_turn = round.take_turn("Liquid") 
      expect(round.number_correct).to eq(2)

      yet_another_turn = round.take_turn("Bad Answer")
      expect(round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the number of correct guesses by category' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.number_correct_by_category(:Basics)).to eq(0)
      new_turn = round.take_turn("Color")
      expect(round.number_correct_by_category(:Basics)).to eq(1)
    end
  end

  describe '#finished?' do
    it 'returns true when all cards have been played' do
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.finished?).to be false        

      new_turn = round.take_turn("Color")
      another_turn = round.take_turn("Liquid") 
      yet_another_turn = round.take_turn("Bad Answer")

      expect(round.finished?).to be true
    end
  end
end

