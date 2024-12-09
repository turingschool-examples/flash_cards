require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'is a round' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'round has a deck in it' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'can count how many turns have passed' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'can read current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1])

        round = Round.new(deck)

        turn_1 = Turn.new("Juneau", card_1)

        turns = [turn_1]

        expect(round.current_card).to eq(card_1)
    end

    it 'counts number of turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        expect(round.turns.count).to eq(0)

        new_turn = round.take_turn("Juneau")

        expect(round.turns.count).to eq(1)

        newer_turn = round.take_turn("Venus")

        expect(round.turns.count).to eq(2)
    end

    it 'counts number correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)

        next_turn = round.take_turn("Mars")

        expect(round.number_correct).to eq(2)
    
    end

    it 'percent correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        deck = Deck.new([card_1, card_2, card_3])

        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")
        newer_turn = round.take_turn("Pickle")

        expect(round.percent_correct).to eq(50.0)
    end
    
end