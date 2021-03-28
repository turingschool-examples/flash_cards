require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'rspec'

describe Round do

  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end


  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.deck).to eq(deck)
  end


  it 'starts with no turns' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5°
        clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round.turns).to eq []
  end


  describe '#current card' do


    it 'can return current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
        reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
          clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.current_card).to eq(card_1)
    end


    it 'can move to the next card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
        reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
          clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.current_card).to eq(card_1)
      new_turn = round.take_turn("Mars")
      expect(round.current_card).to eq(card_2)
    end


  end

  describe 'can take a turn and' do

    it 'can create a new turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
        reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
          clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(new_turn).to be_instance_of(Turn)
    end


    it 'can add to the list of turns taken' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
        reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5°
          clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      expect(round.turns).to eq([new_turn])
    end


  end

    describe 'validity check;' do


      it 'can count the correct guesses' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
          reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5°
            clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        expect(round.number_correct).to eq(1)
      end


      it 'can check if guess is correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
          reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5°
            clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        expect(new_turn.correct?).to eq(true)
      end


      it 'can give feedback on the last turn taken' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
          reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5°
            clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        expect(new_turn.feedback).to eq("Correct!")
      end


      it 'can return number correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
          reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5°
            clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        expect(round.number_correct_by_category(:Geography)).to eq(1)
      end


        it 'can return percent correct' do
          card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
          card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
            reports about the surface of which planet?", "Mars", :STEM)
          card_3 = Card.new("Describe in words the exact direction that is 697.5°
              clockwise from due north?", "North north west", :STEM)
          cards = [card_1, card_2, card_3]
          deck = Deck.new(cards)
          round = Round.new(deck)
          new_turn = round.take_turn("Juneau")
          expect(round.percent_correct).to eq(100.0)
        end


        it 'can return percent correct by category' do
          card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
          card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
            reports about the surface of which planet?", "Mars", :STEM)
          card_3 = Card.new("Describe in words the exact direction that is 697.5°
              clockwise from due north?", "North north west", :STEM)
          cards = [card_1, card_2, card_3]
          deck = Deck.new(cards)
          round = Round.new(deck)
          new_turn = round.take_turn("Juneau")
          expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        end

    end

end
