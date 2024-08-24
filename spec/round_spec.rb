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
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(deck).to be_instance_of(Deck)
    end

    it 'returns_deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'starts_turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = @cards
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'pulls_current_card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
# require 'pry'; binding.pry
        expect(round.current_card).to eq(card_1)
    end

    it 'takes_turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn = Turn.new("Juneau", @card)

        expect(round.take_turn("Juneau")).to eq(@turn << turn)
    end

    xit 'says_if_correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn = Turn.new("Juneau", @card)
        new_turn = @turn 
        round.deck

        round.take_turn("Juneau") == @turn 
# require 'pry'; binding.pry
        expect(new_turn.correct?).to eq(true)
    end

    xit 'identifies_number_correct' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)
        turn = Turn.new("Juneau", @card)
        current_card = @deck.cards[0]

        expect(round.number_correct).to eq(1)

    end



# new_turn = round.take_turn

end