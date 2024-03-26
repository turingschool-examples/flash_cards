require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

RSpec.describe Round do

    it "has a deck" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)

expect(round.deck).to eq(deck)
    end

    it "has turns" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it " current card" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)

    end

    it "takes turn" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)
        turn = Turn.new("Juneau", card_1)

        expect(round.take_turn("Juneau")).to be_instance_of(Turn)

    end

    it "goes to next turn" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)

        round.take_turn("Juneau")

        expect(round.current_card).to eq(card_2)
        
    end

    it "is correct?" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to eq(true)
        
    end

    it "counts?" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3] 
        deck = Deck.new(cards)
        round = Round.new(deck)
        
        round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)

    end

it "catalogs corrects by category" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3] 
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn("Juneau")

    expect(round.number_correct_by_category(:STEM)).to eq(0)

end

it "gives a correct percentage" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3] 
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")
    round.percent_correct

    expect(round.percent_correct).to eq(50.00)

end

it "gives correct percentage by category" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3] 
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    round.take_turn("Venus")
    round.percent_correct

    expect(round.percent_correct_by_category(:Geography)).to eq(100.00)
end
end