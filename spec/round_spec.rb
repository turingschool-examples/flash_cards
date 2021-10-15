require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

describe Round do
  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round).to be_instance_of(Round)
    end
  end

  describe '#deck' do
    it 'return the cards objects in the deck' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.deck).to eq(deck)
    end
  end

  describe '#turns' do
    it 'return the empty deck when no turns have been taken' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.turns).to eq([])
    end

    it 'return the turns taken so far' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Denver')
      expect(round.turns).to include(card_1) # the first element of the deck should contain card_1.
    end
  end

  describe '#current_card' do
    it 'return the current card in index 0 of the deck deck array' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.current_card).to eq(card_1)
    end
  end


  describe '#take_turn' do
    it 'return the card from the current turn' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Denver')
      expect(new_turn.card).to eq(card_1)
    end

    it 'properly removes the first card from the deck' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Denver')
      expect(round.current_card).to eq(card_2)
    end

    it 'causes the deck to go to the next card' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Denver')
      expect(round.deck.cards[0].question).to include(card_2.question)
    end
  end

  describe '#class' do # Tested
    it 'returns the class (Deck) of the method being used' do # should this description be more specific?
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(deck.class).to eq(Deck)
    end

    it 'returns the class (Turn) of the method being used' do
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Denver')
      expect(new_turn.class).to eq(Turn)
    end
  end

  describe '#number_correct' do
    it 'returns the number of correct guesses (1)' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn('Denver')
      expect(round.number_correct).to eq(1)

    end

    it 'returns the number of correct guesses (2)' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      new_turn_2 = round.take_turn('Valentina Tereshkova')
      expect(round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category(:category)' do
    it 'returns 1 for the amount of correct geography cards' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'returns 2 for the amount of correct history cards and ignores other categories' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      card_4 = Card.new('Who was the first African American president?', 'Obama', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      new_turn_2 = round.take_turn('Valentina Tereschkova')
      new_turn_3 = round.take_turn('1776')
      new_turn_4 = round.take_turn('Obama')
      expect(round.number_correct_by_category(:History)).to eq(2)
    end
  end

  describe '#percent_correct' do
    it 'returns 100 when all answers are correct' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
      card_4 = Card.new('Who was the first African American president?', 'Obama', :History)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      new_turn_2 = round.take_turn('Valentina Tereschkova')
      new_turn_3 = round.take_turn('1776')
      expect(round.percent_correct).to eq(100)
    end

    it 'returns 50 when only half of the answers are right' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      new_turn_2 = round.take_turn('Wrong Answer')
      expect(round.percent_correct).to eq(50)
    end
  end

  describe '#percent_correct_by_category(:Category)' do
    it 'returns the percentage of correct answers (100) within a category' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('What is the capital of Utah?', 'Salt Lake City', :Geography)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      new_turn_2 = round.take_turn('Valentina Tereshkova')
      new_turn_3 = round.take_turn('Salt Lake City')
      expect(round.percent_correct_by_category(:Geography)).to eq(100)
    end

    it 'returns the percentage of correct answer (50) within a category' do
      skip
      card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
      card_3 = Card.new('What is the capital of Utah?', 'Salt Lake City', :Geography)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn_1 = round.take_turn('Denver')
      new_turn_2 = round.take_turn('Valentina Tereshkova')
      new_turn_3 = round.take_turn('Wrong Answer')
      expect(round.percent_correct_by_category(:Geography)).to eq(50)
    end
  end
end
