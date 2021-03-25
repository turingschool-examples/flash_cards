require './lib/round'
require './lib/card'
require './lib/deck'
require './lib/turn'

RSpec.describe Round do

  describe '#initialize' do
    it "has a deck" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.deck).to eq deck
    end

    it "has a turns array" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.turns).to eq []
    end
  end

  describe '#current_card' do
    it "knows what the current card is before starting" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.current_card).to eq card_1
    end
  end

  describe '#take_turn' do
    it "creates a new Turn object" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.take_turn("Juneau")).to be_a Turn
    end

    it "increments the current card up after a turn" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      round.take_turn("Juneau")
      expect(round.current_card).to eq card_2
    end

    it "counts the number of correct answers given" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      round.take_turn("Juneau")
      expect(round.number_correct).to eq 1
    end
  end

  describe '#number_correct_by_category' do
    it "counts the number correct by category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      round.take_turn("Juneau")
      expect(round.number_correct_by_category(:Geography)).to eq 1
      expect(round.number_correct_by_category(:STEM)).to eq 0

      round.take_turn("Mars")
      expect(round.number_correct_by_category(:Geography)).to eq 1
      expect(round.number_correct_by_category(:STEM)).to eq 1
    end
  end

  describe '#percent_correct' do
    it "calculates the percent correct overall" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.percent_correct).to eq "No turns have yet been taken."

      round.take_turn("Juneau")
      expect(round.percent_correct).to eq 100.0

      round.take_turn("Pluto")
      expect(round.percent_correct).to eq 50.0
    end
  end

  describe '#percent_correct_by_category' do
    it "calculates the percent correct by category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      round.take_turn("Juneau")
      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
      expect(round.percent_correct_by_category(:STEM)).to eq "No turns in this category have yet been taken."

      round.take_turn("Pluto")
      round.take_turn("North north west")
      expect(round.percent_correct_by_category(:Geography)).to eq 100.0
      expect(round.percent_correct_by_category(:STEM)).to eq 50.0
    end
  end
end
