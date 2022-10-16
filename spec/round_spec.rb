require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


describe Round do
  it 'exists and can deck of cards can be added to the round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_a Round
  end
  describe '#current_card' do
    it 'can provide the current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.current_card).to eq card_1
    end
  end

  describe '#take_turn' do
    it 'take a guess and store it with the card in a turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(new_turn).to be_a Turn
      expect(new_turn.guess == "Juneau").to eq true
    end

    it 'can confirm if a question is correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(new_turn.correct?).to eq (true)

    end

    it 'stores the previous turn in @turns array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.turns).to eq ([new_turn])
    end

    it 'can keep track of the number of correct answers' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to eq 1
    end

    it 'moves on to next card in deck after first card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.current_card).to eq card_2
    end

    it 'can keep track of how many turns are taken' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      expect(round.turns.count).to eq 1
      turn2 = round.take_turn("Venus")
      expect(round.turns.count).to eq 2
    end
  end

  describe 'number_correct_by_category' do
    it 'tracks number correct in a given category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      turn2 = round.take_turn("Venus")

      expect(round.number_correct_by_category(:Geography)).to eq 1
    end

    it 'tracks number correct in a diff given category category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      turn2 = round.take_turn("Venus")

      expect(round.number_correct_by_category(:STEM)).to eq 0

      turn3 = round.take_turn("North north west")

      expect(round.number_correct_by_category(:STEM)).to eq 1
    end
  end

  describe '#percent_correct' do
    it 'keeps track of the percent of correct answers' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      turn2 = round.take_turn("Venus")
      expect(round.percent_correct).to eq 50.0
    end
  end

  describe '#percent_correct_by_category' do
    it 'tracks percent of the correct answers in a given category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      turn2 = round.take_turn("Venus")

      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
    end

    it 'tracks percent of the correct answers in a diff category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      turn2 = round.take_turn("Venus")

      expect(round.percent_correct_by_category(:STEM)).to eq 0
    end

    it 'tracks percent of the correct answers in different categories in a row' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      turn2 = round.take_turn("Venus")

      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
      expect(round.percent_correct_by_category(:STEM)).to eq 0

    end
  end

  describe '#categories_list' do
    it 'creates an array of the categories'do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
    turn2 = round.take_turn("Venus")
    turn3 = round.take_turn("North north west")
    expect(round.categories_list).to eq [:Geography, :STEM]
    end
  end
end
