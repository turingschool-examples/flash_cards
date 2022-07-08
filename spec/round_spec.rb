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
        expect(round.turns).to eq([]) 
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

    it 'keeps track of turns and correct responses' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        turn = Turn.new("Juneau", card_1)

        new_turn = round.take_turn("Juneau")
        expect(round.number_correct).to eq(1)
        expect(round.current_card).to eq(card_2)

        new_turn = round.take_turn("Venus")
        expect(round.turns.count).to eq(2)

        expect(round.turns.last.feedback).to eq("Incorrect.")
        expect(round.number_correct).to eq(1)

        # expect(round.number_correct_by_category(:Geography)).to eq(1)

        expect(round.percent_correct_by_category(:Geography)).to eq(100.0)


        #round.turns = Array of turns
        #round.turns.last = last turn in the array
        #round.turns.last.feedback = turn.feedback correct or incorrect
        #feedback is asking, is the guess == answer? yes or no 
        #why does it recognize feedback from another file here but not in the round class?
    end
end



    # round.number_correct_by_category(:Geography)(1)
    # round.number_correct_by_category(:STEM)(0)
    # round.percent_correct(50.0)
    # round.percent_correct_by_category(:Geography) (100.0)
    # round.current_card
