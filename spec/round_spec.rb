require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'has turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'returns current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)


        expect(round.current_card).to eq(card_1)
    end

    it 'takes turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")

        expect(new_turn).to be_instance_of(Turn)
        expect(new_turn.correct?).to eq(true)
        expect(round.turns).to eq([new_turn])
    end

    it 'counts number correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        cards = [card_1]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        
        expect(round.number_correct).to eq(1)
    end

    it 'counts number correct by category' do
        card_1 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        cards = [card_1, card_2]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("North north west")
        new_turn_2 = round.take_turn("Mars")

        
        expect(round.number_correct_by_category(:STEM)).to eq(2)
    end

    it 'give percent correct' do
        card_1 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        cards = [card_1, card_2]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("North north west")
        new_turn_2 = round.take_turn("Mars")

        
        expect(round.percent_correct).to eq(100)
    end

    it 'give percent correct by category' do
        card_1 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        cards = [card_1, card_2]
        deck = Deck.new(cards)
        round = Round.new(deck)
        new_turn = round.take_turn("West")
        new_turn_2 = round.take_turn("Mars")

        
        expect(round.percent_correct_by_category(:STEM)).to eq(50)
    end
end