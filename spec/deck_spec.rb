require './lib/deck.rb'
require './lib/card.rb'

RSpec.describe Deck do

    it 'exists' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        expect(deck).to be_instance_of(Deck)
    end

    it 'has cards' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.deck.count()).to eq 3
    end

    it 'is able to read categories of cards' do
        card_1 = Card.new('question_1?', 'answer_1', :Geography)
        card_2 = Card.new('question_2', 'snawer_1', :STEM)
        card_3 = Card.new('question_3', 'answer_1', :STEM)
        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        expect(deck.cards_in_category(:Geography).count()).to eq(1)
        expect(deck.cards_in_category(:STEM).count()).to eq(2)
        expect(deck.cards_in_category('pop culture').count()).to eq(0)
    end
end