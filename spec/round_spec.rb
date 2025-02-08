require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

Rspec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_a(Round)
    end

    it 'start with the first card in the deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end

    it 'can take a turn and move to the next card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_a(Turn)
        expect(new_turn.correct?).to be true
        expect(round.turns.count).to eq(1)
        expect(round.current_card).to eq(card_2)
    end

    it 'tracks the number of correct answers' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        round.take_turn("Juneau")
        round.take_turn("Mercury")

        expect(round.number_correct).to eq(1)
    end


end