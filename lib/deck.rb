require './lib/card'
require 'pry'

class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        cards.count
    end

    def cards_in_category(category)
        card_storage = []

        cards.each do |card|
            
            if category == card.category then
            card_storage.push(card)
            end
        end

        card_storage
    end
end