require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  describe "#initialize" do 
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck   = Deck.new([card_1, card_2, card_3])
      round  = Round.new(deck)
      
      expect(round).is_a? Round 
    end

    it 'check that round has a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck   = Deck.new([card_1, card_2, card_3])
      round  = Round.new(deck)

      expect(round.deck).to eq deck
    end

    it 'checks that round is an empty array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck   = Deck.new([card_1, card_2, card_3])
      round  = Round.new(deck)

      expect(round.turns).to eq []
    end
  end

  describe "#take_turn" do 
    it 'returns the current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck   = Deck.new([card_1, card_2, card_3])
      round  = Round.new(deck)

      expect(round.current_card).to eq card_1
    end

    it 'creates a new turn with appropriate guess and card' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      
      expect(new_turn).is_a? Turn
      expect(round.current_card).to eq card_2
    end

    it 'takes new turn and rotates current card' do
      card_1     = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2     = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3     = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck       = Deck.new([card_1, card_2, card_3])
      round      = Round.new(deck)
      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Venus")

      expect(round.turns).to eq [new_turn_1, new_turn_2]
      expect(round.current_card).to eq card_3
    end 
      
    it 'returns numbers of turns in turns array' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
     
      expect(round.turns.count).to eq(2)
    end
  end

  describe '#category_scores(round)' do
    it '' do 
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      
      expect(round.category_scores).to eq 
    end
  end

  describe '#number_correct' do 
    it 'returns number of correct guesses'do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      
      expect(new_turn.correct?).to eq true
      expect(new_turn.feedback).to eq 'Correct.'
      expect(round.number_correct).to eq 1
    end

    it 'returns different feedback for incorrect guesses' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Denver")

      expect(new_turn.correct?).to eq false
      expect(new_turn.feedback).to eq 'Incorrect.'
    end
  end

  describe '#correct_by_category' do
    it 'returns number correct by category' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
      
      expect(round.number_correct_by_category(:Geography)).to eq 1
    end

    it 'returns 0 if there are no correct answers by category' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
      
      expect(round.number_correct_by_category(:STEM)).to eq 0
    end
  end

  describe '#percent_correct' do
    it 'returns the number of correct ' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
     
      expect(round.percent_correct).to eq 50.0
    end

    it 'returns 0 if none are correct' do
      card_1    = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2    = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3    = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck      = Deck.new([card_1, card_2, card_3])
      round     = Round.new(deck)
      new_turn  = round.take_turn("Denver")
      new_turn  = round.take_turn("Venus")

      expect(round.percent_correct).to eq 0
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns number of correct by certain category' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
      
      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
    end

    it 'returns 0 if none are correct in a certain category' do
      card_1   = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck     = Deck.new([card_1, card_2, card_3])
      round    = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      new_turn = round.take_turn("Venus")
      
      expect(round.percent_correct_by_category(:STEM)).to eq 0.0
    end
  end
end
