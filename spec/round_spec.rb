require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_a(Round)
    end

    it 'has the ability to tell what deck is loaded' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'has the ability to tell what turn it is on' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'has the ability to tell what the current card is' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end

    it 'has method #new_turn which creates a new instance of the Turn class' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")

        expect(round.take_turn("Juneau")).to be_a(Turn)
    end

    # it 'creates a new round with the guess provided, and the appropriate card' do
    #     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #     deck = Deck.new([card_1, card_2, card_3])
    #     round = Round.new(deck)
    #     new_turn = round.take_turn("Juneau")

    #     expect(new_round).to eq(Turn.new("Juneau", card_1))
    # end

    it 'outputs the class of the instance created by # take_turn' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        round.take_turn("Juneau")
        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to eq(Turn)
    end

    it 'evaluates if the new turn is correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn.correct?).to be(true)
    end

    it 'stores the turns in an array' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.turns).to eq([new_turn])
    end

    it 'gives the number of correct answers' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.number_correct).to eq(1)
    end

    it '#take_turn advances to the next card in the deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(round.current_card).to eq(card_2)
    end

    it 'creates a new turn with the second card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        new_turn_2 = round.take_turn("Venus")

        expect(new_turn_2).to be_a(Turn)
    end

    it 'gives correct turn count after turn 2' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        new_turn_2 = round.take_turn("Venus")

        expect(round.turns.count).to eq(2)
    end



end
