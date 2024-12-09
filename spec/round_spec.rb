require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  describe "initialize" do
    it "exists" do
  

      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round).to be_instance_of(Round)
    end
    it "has a deck of cards" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.deck).to eq(deck)


    end

    it "has an empty array of turns" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      expect(round.turns).to eq([])
    end
  end

  describe "#current_card" do
    it "returns a current card" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
  

      expect(round.current_card).to eq(card_1)
    end

    it "cycles through deck" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(round.current_card).to eq(card_2)
    end

  end
  describe "take_turn" do
    it "takes a turn" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")
      

      expect(new_turn).to be_instance_of(Turn)
      expect(round.take_turn("Venus")).to be_instance_of(Turn)
    end  
    it "adds turn to turns array" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(round.turns).to eq([new_turn])
      newer_turn = round.take_turn("Venus")
      expect(round.turns).to eq([new_turn, newer_turn])

    end
  end

  describe "#correct" do
    it "checks for a correct guess" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(new_turn.correct?).to be(true)
    end
  end

  describe "#number_correct" do
    it "checks the number of correct answers" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to eq(1)

    end
  end
 describe "turn_count" do
  it "checks the number of turns" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      
      expect(round.turns.count).to eq(0)

      new_turn = round.take_turn("Juneau")

      expect(round.turns.count).to eq(1)

      newer_turn = round.take_turn("Venus")

      expect(round.turns.count).to eq(2)
    end
  end

  describe "last_round_feedback" do
    it "gives appropriate feedback on previous round" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.turns.last.feedback).to eq("Correct")

      newer_turn = round.take_turn("Pickle")

      expect(round.turns.last.feedback).to eq("Incorrect")

    end
  end

  describe "number_correct" do
      it "gives the number of correct answers" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to eq(1)

      newer_turn = round.take_turn("Pickle")

      expect(round.number_correct).to eq(1)

    end
  end
 describe "number correct by category" do
  it "returns number correct by category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      newer_turn = round.take_turn("Pickle")

      expect(round.number_correct_by_category(:Geography)).to eq(1)
      expect(round.number_correct_by_category(:STEM)).to eq(0)
  end
 end
 describe " percent correct" do
  it "returns the percentage of correct answers" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      newer_turn = round.take_turn("Pickle")

      expect(round.percent_correct).to eq(50.0)
     

  end
 end

 describe "percent correct by category" do
  it "returns the percentage correct answers by category" do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")
      newer_turn = round.take_turn("Pickle")

      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)

  end
 end
end


#I COMPLETED A F@$%@ING ITERATION