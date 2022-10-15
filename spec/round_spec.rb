require './lib/round'
require 'rspec'

describe Round do
  describe '#initialize' do
    it 'is an instance of Round' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round).to be_a Round
    end

    it 'can have a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.deck).to eq deck
    end

    it 'has an array for turns that starts empty' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.turns).to eq []
    end

    it 'has an array for correct and incorrect turns that starts empty' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.correct).to eq []
      expect(round.incorrect).to eq []
    end

  end

  describe '#current_card' do
    it 'starts the current card as the first in the deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.current_card).to eq card_1
    end

  end

  describe '#take_turn' do
    it 'can make a new Turn instance' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(new_turn.class).to eq Turn
    end

    it 'has a Turn guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(new_turn.guess).to eq "Juneau"
    end

    it 'can have a correct and incorrect guess' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Austin")

      expect(new_turn_1.correct?).to be true
      expect(new_turn_2.correct?).to be false
    end

    it 'saves correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.correct).to include new_turn

    end

    it 'saves incorrect guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn("Austin")

      expect(round.correct).not_to include new_turn
      expect(round.incorrect).to include new_turn

    end

    it 'stores new turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.turns).to eq [new_turn]
    end

    it 'can save multiple turns' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")

      expect(round.turns).to eq [new_turn_1]
      expect(round.turns.count).to eq 1

      new_turn_2 = round.take_turn("Juneau")

      expect(round.turns).to eq [new_turn_1, new_turn_2]
      expect(round.turns.count).to eq 2
    end

    it 'switches current card to the next card in the deck ' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Austin")

      expect(round.current_card).to eq card_2

      new_turn_2 = round.take_turn("Saturn")

      expect(round.current_card).to eq card_3

    end

  end

  describe 'last_turn' do
    it 'returns the last turn just taken' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")

      expect(round.last_turn).to eq new_turn_1

      new_turn_2 = round.take_turn("Juneau")

      expect(round.last_turn).to eq new_turn_2

    end

  end

  describe '#turn_feedback' do
    it 'gives feedback for the turn just taken' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")

      expect(round.turn_feedback).to eq "Correct!"

      new_turn_2 = round.take_turn("Juneau")

      expect(round.turn_feedback).to eq "Incorrect."

    end

  end

  describe '#number_correct' do
    it 'returns the number of correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to eq 1

    end

  end

  describe '#correct_by_category' do
    it 'returns an array of all correct turns in a category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      card_4 = Card.new("Presto, largo, allegro relate to what property of music?" , "Tempo", :Music)
      deck = Deck.new([card_1, card_2, card_3, card_4])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Mars")
      new_turn_3 = round.take_turn("South")
      new_turn_4 = round.take_turn("Timbre")

      expect(round.correct_by_category(:Geography)).to eq [card_1]
      expect(round.correct_by_category(:STEM)).to eq [card_2]
      expect(round.correct_by_category(:Music)).to eq []
    end

  end

  describe '#number_correct_by_category' do
    it 'return the number of correct guesses of a particular category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      card_4 = Card.new("Presto, largo, allegro relate to what property of music?" , "Tempo", :Music)
      deck = Deck.new([card_1, card_2, card_3, card_4])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Mars")
      new_turn_3 = round.take_turn("South")
      new_turn_4 = round.take_turn("Timbre")

      expect(round.number_correct_by_category(:Geography)).to eq 1
      expect(round.number_correct_by_category(:STEM)).to eq 1
      expect(round.number_correct_by_category(:Music)).to eq 0

    end

  end

  describe '#percent_correct' do
    it "returns the percent correct out of total turns taken " do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      card_4 = Card.new("Presto, largo, allegro relate to what property of music?" , "Tempo", :Music)
      deck = Deck.new([card_1, card_2, card_3, card_4])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Mars")
      new_turn_3 = round.take_turn("South")
      new_turn_4 = round.take_turn("Timbre")

      expect(round.turns.length).to eq 4
      expect(round.number_correct).to eq 2

      expect(round.percent_correct).to eq 50
    end

    it "rounds the percent correct to the nearest integer" do
      card_1 = Card.new("What element does H on the periodic table represent?", "Hydrogen", :STEM)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Hydrogen")
      new_turn_2 = round.take_turn("Mars")
      new_turn_3 = round.take_turn("South")

      expect(round.turns.length).to eq 3
      expect(round.number_correct).to eq 2
      expect(round.percent_correct).to eq 67
    end

  end

  describe '#percent_correct_by_category' do
    it 'returns the percent correct in a category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      card_4 = Card.new("Presto, largo, allegro relate to what property of music?" , "Tempo", :Music)
      deck = Deck.new([card_1, card_2, card_3, card_4])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Juneau")
      new_turn_2 = round.take_turn("Mars")
      new_turn_3 = round.take_turn("South")
      new_turn_4 = round.take_turn("Timbre")

      expect(deck.cards_in_category(:Geography).length).to eq 1
      expect(round.number_correct_by_category(:Geography)).to eq 1
      expect(round.percent_correct_by_category(:Geography)).to eq 100

      expect(deck.cards_in_category(:STEM).length).to eq 2
      expect(round.number_correct_by_category(:STEM)).to eq 1
      expect(round.percent_correct_by_category(:STEM)).to eq 50

      expect(deck.cards_in_category(:Music).length).to eq 1
      expect(round.number_correct_by_category(:Music)).to eq 0
      expect(round.percent_correct_by_category(:Music)).to eq 0

    end

    it "rounds up floats to the nearest whole number" do
      card_1 = Card.new("What element does H on the periodic table represent?", "Hydrogen", :STEM)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      new_turn_1 = round.take_turn("Oxygen")
      new_turn_2 = round.take_turn("Mars")
      new_turn_3 = round.take_turn("South")

      expect(deck.cards_in_category(:STEM).length).to eq 3
      expect(round.number_correct_by_category(:STEM)).to eq 1
      expect(round.percent_correct_by_category(:STEM)).to eq 33
    end
  end

end
