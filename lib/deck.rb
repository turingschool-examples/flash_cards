# require_relative './card.rb' (may need to add to make method to add cards work)

class Deck
    attr_reader :card, :cards
    attr_writer :cards

    def initialize(cards)
        @cards = cards
    end
# require 'pry'; binding.pry
    def count
        @cards.length
    end

    def cards_in_category(category)
        @cards.select do |card|
        category == card.category
        end
    end

    def add_card(new_card)
        @cards << new_card
    end

end