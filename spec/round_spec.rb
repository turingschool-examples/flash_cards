require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do 
    it 'holds a deck and stores turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.deck).to be(deck)
        expect(round.turns).to eq([]) #expect to equal an empty array
    end

    it 'keeps track of current card' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        expect(round.current_card).to eq(cards[0])
        new_turn = round.take_turn("Juneau")
        expect(round.current_card).to eq(cards[1])
    end

    it 'keeps track of turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        new_turn = round.take_turn("Juneau")

        expect(new_turn.class).to be(Turn)
        expect(new_turn.correct?).to be(true)
        expect(round.turns).to eq([new_turn])
    end
end



    # round.number_correct (1)
    # round.current_card
    # round.take_turn("Venus")
    # round.turns.count(2)
    # round.turns.last.feedback (incorrect)
    # round.number_correct (1)
    # round.number_correct_by_category(:Geography)(1)
    # round.number_correct_by_category(:STEM)(0)
    # round.percent_correct(50.0)
    # round.percent_correct_by_category(:Geography) (100.0)
    # round.current_card
