require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do 
    describe '#initialize' do
        it 'exists' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round).to be_instance_of(Round)
        end

        it 'has a deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round.deck).to eq(deck)
        end

        it 'starts with an empty array of turns' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)

            expect(round.turns).to eq([])
        end
    end

    describe '#card' do 
        it "is looking at the first card" do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)


            expect(round.current_card).to be(card_1)
        end

    end

    describe "#turn" do
        it "asks the first question" do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

            deck = Deck.new([card_1, card_2, card_3])
            round = Round.new(deck)
            
            expect(new_turn = round.take_turn).to eq("Juneau")

        end
    end




end
