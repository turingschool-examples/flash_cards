require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# before(:each) do 
#     card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#     card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#     card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#     cards = [card_1, card_2, card_3]
#     deck = Deck.new(cards)
# end

RSpec.describe Deck do
    
    
    it 'exists' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck).to be_instance_of(Deck)
    end
    

    # test it has an array of cards
    it 'has an array of cards' do 
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards).to be_instance_of(Array)
    end


    it 'counts the cards' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.count).to eq(3)

        round = Round.new(deck)
        new_turn = round.take_turn("Juneau")
        expect(deck.count).to eq(2)



    end

    # test it identifies the cards in a certain category
    it 'identifies number of cards in a specific category' do
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
        expect(deck.cards_in_category(:Geography)).to eq([card_1])
        expect(deck.cards_in_category("Pop Culture")).to eq([])
    end

end