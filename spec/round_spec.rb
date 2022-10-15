require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  describe '#initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      expect(round).to be_instance_of(Round)

    end

    it 'has a deck of cards' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.deck).to eq(deck)
    end


     it 'has turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        expect(round.turns).to eq([])
      end
  end

  describe '#current_card' do
    it 'is the first card in the deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.current_card).to eq(card_1)
    end
  end

  describe '#take_turn' do
     it 'takes a string and creates a new Turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       cards = [card_1, card_2, card_3]
       deck = Deck.new(cards)
       round = Round.new(deck)
       new_turn = round.take_turn("Juneau")
       new_turn2 = round.take_turn("Venus")
       expect(round.take_turn("Juneau")).to be_instance_of(Turn)
     end
    it 'checks if guess is correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
      new_turn2 = round.take_turn("Venus")
      expect(new_turn2.correct?).to eq(false)
    end

  end
  describe '#number_correct_by_category'do
    it 'checks which are correct per category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      #cards = [card_1, card_2, card_3]
      cards = [card_1, card_2]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)

      expect(round.number_correct_by_category(:Geography)).to eq(1)

      new_turn2 = round.take_turn("Venus")
      expect(new_turn2.correct?).to eq(false)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  describe '#percent_correct' do
    it ' calculates the percent of correct answers' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
      expect(round.number_correct).to eq(1)
      new_turn2 = round.take_turn("Venus")
      expect(new_turn2.correct?).to eq(false)
      #require 'pry' ;binding.pry
      expect(round.percent_correct).to eq(50.00)
    end
  end

  describe '#percent_correct_by_category' do
    it 'checks the percet correct by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn.correct?).to eq(true)
      expect(round.number_correct).to eq(1)
      #require 'pry' ;binding.pry
      expect(round.percent_correct_by_category(:Geography)).to eq(100.00)
    end
  end
end
