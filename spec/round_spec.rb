require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


describe Round do
    it "exits" do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        expect(card_1).to be_instance_of(Card)
        expect(card_2).to be_instance_of(Card)
        expect(card_3).to be_instance_of(Card)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_instance_of(Round)

    end
    it 'has a deck' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(deck).to be_instance_of(Deck)

    end
    it 'has turns' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.turns).to eq([])
    end

    it 'has a current card' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]

        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round.current_card).to eq()

    end

end