require './lib/deck'


RSpec.describe Deck do
    describe '#initialize' do
        it 'exists' do 
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck).to be_a Deck
        end

        it 'has an initial_size' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.initial_size).to eq 3
        end

        it 'stores category_data in a Hash' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.category_data).to be_a Hash

        end
    end

    describe '#count' do
        it 'can count the number of cards left in the deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.count).to eq 3
        end
    end

    describe '#current_card' do
        it 'can return the fist card in the deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.current_card).to eq card_1
        end
    end

    describe '#cards_in_category' do
        it 'can list the cards in a category' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.cards_in_category(:Geography)).to eq [card_1]
        end
    end

    describe '#change_card' do
        it 'can remove a card to prepare for the next turn' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)
            deck.change_card

            expect(deck.current_card).to eq card_2
        end
    end

    describe '#categories' do
        it 'generates a list of categories in the deck' do
            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
            cards = [card_1, card_2, card_3]
            deck = Deck.new(cards)

            expect(deck.categories).to eq [:Geography, :STEM]
        end
    end
end


