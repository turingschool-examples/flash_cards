require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  describe 'initialize' do
    it 'exists' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round).to be_instance_of(Round)
    end
  end

  describe '#current_card' do
    it 'is on current card' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      expect(round.current_card).to eq(cards[0])
    end
  end

  describe '#take_turn' do
    it 'takes a new turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      #require 'pry'; binding.pry
      round = Round.new(deck)

      expect(round.take_turn("Juneau")).to eq(round.turns.last)
      expect(round.take_turn("Mars")).to eq(round.turns.last)
    end
  end

  describe '#number_correct' do
    it 'counts the amount that are correct' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      # Only two are correct ("Juneau" and "North north west")
      # so it will return 2
      turn = round.take_turn("Juneau")
      round.take_turn("Venus")
      round.take_turn("North north west")
      expect(round.number_correct).to eq(2)

      #####Alternative test 1######
      # Only one is correct ("North north west") while the rest are incorrect
      # turn = round.take_turn("Sacramento")
      # round.take_turn("Venus")
      # round.take_turn("North north west")
      # expect(round.number_correct).to eq(1)

      #####Alternative test 2######
      # None of the answers are correct so it will return 0
      # turn = round.take_turn("Sacramento")
      # round.take_turn("Venus")
      # round.take_turn("South")
      # expect(round.number_correct).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'returns correct by percent' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      # Of the two guesses shown, only "Juneau" is correct
      # So it will return 50.0
      turn = round.take_turn("Juneau")
      round.take_turn("Venus")
      expect(round.percent_correct).to eq(50.0)

      # Another card is drawn
      # "North north west" is correct so it will
      # return 66.66666666666666 (2 / 3)
      round.take_turn("North north west")
      expect(round.percent_correct).to eq(66.66666666666666)
    end

    describe "#number_correct_by_category" do
      it 'returns correct by category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        # "Juneau" is correct answer
        # so when we search by :Geography, it returns 1
        turn = round.take_turn("Juneau")
        expect(round.number_correct_by_category(:Geography)).to eq(1)

        # Guess is "Venus" which is incorrect
        # So when we search by :STEM category, it will return 0
        round.take_turn("Venus")
        expect(round.number_correct_by_category(:STEM)).to eq(0)

        # Guess is "North north west" which is correct
        # So when we search by :STEM category, it will return 1
        round.take_turn("North north west")
        expect(round.number_correct_by_category(:STEM)).to eq(1)
      end
    end
  end

  describe '#percent_correct_by_category' do
    it 'return percent correct by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      card_4 = Card.new("What is 2 + 2", "4", :STEM)
      cards = [card_1, card_2, card_3, card_4]
      deck = Deck.new(cards)
      round = Round.new(deck)

      round.take_turn("Juneau")

      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)

      round.take_turn("Venus")
      expect(round.number_correct_by_category(:STEM)).to eq(0)
      expect(round.percent_correct_by_category(:STEM)).to eq(0)

      round.take_turn("North north west")
      expect(round.number_correct_by_category(:STEM)).to eq(1)
      expect(round.percent_correct_by_category(:STEM)).to eq(50.0)

      round.take_turn("4")
      expect(round.number_correct_by_category(:STEM)).to eq(2)
      expect(round.percent_correct_by_category(:STEM)).to eq(67)
    end
  end
end
