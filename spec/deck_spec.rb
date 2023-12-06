require 'rspec'
require '/.lib/.deck'

RSpec.describe Deck do
    let(:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
    let(:card2) {Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)}
    let(:card3) {Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)}
    let(:cards) {[card1, card2, card3]}
    let(:deck) {Deck.new(cards)}

describe 'initialze' do 
    it 'creates a new deck instance' do
        deck = Deck.new(cards)

        expect(deck).to be_an_instance_of(Deck)
        expect(deck.cards).to eq(cards)
    end
end

describe 'card_in_category' do
    it 'puts cards into category' do
        deck = Deck.new(cards)

        Geography_cards = deck.cards_in_category(:Geography)
        expect(cat_1_cards).to contain_exactly(card1)

        STEM_cards = deck.cards_in_category(:STEM)
        expect(cat_2_cards).to contain_exactly(card2, card3)
    end


    it 'returns an empty array when no cards dont match category' do
    deck = Deck.new(cards)

    category_not_found = deck.cards_in_category("category Not found")
    expect (category_not_found).to be_empty
    end
        end 

        describe 'count' do
            it ' returns full amount of cards inside deck' do
                deck = deck.new(cards)
                expect(deck.count).to eq(3)
            end
        end

end