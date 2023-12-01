require './lib/card.rb'

class Deck

    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.count
    end
# for cards in category we will need to dig into the array of cards that we have
# then identify any cards that fall into the same category as the argument
# then will need to return all the cards that fit in that category in a new array

    def cards_in_category(category)
        matched_cards = []
        @cards.each do |card|
            if card.category == category
                matched_cards << card
            end
        end
        matched_cards
    end
end