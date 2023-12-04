require 'rspec'
require '/.lib/.deck'

RSpec.describe 'deck' do
    let(:card1) {Card.new("Ques_1","Ans_1", "Cat_1")}
    let(:card2) {Card.new("Ques_2","Ans_2", "Cat_2")}
    let(:card3) {Card.new("Ques_3","Ans_3", "Cat_3")}
    let(:cards) {[card1, card2, card3]}


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

        cat_1_cards = deck.cards_in_category("Cat_1")
        expect(cat_1_cards).to contain_exactly(card1, card3)

        cat_2_cards = deck.cards_in_category("cat_2")
        expect(cat_2_cards).to contain_exactly(card2)
    end


    it 'returns an empty array when no cards dont match catagory' do
    deck = Deck.new(cards)

    cat_not_found = deck.cards_in_category("catagory Not found")
    expect (cat_not_found).to be_empty
    end
        end 
end