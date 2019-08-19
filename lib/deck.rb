require 'pry'

  class Deck
    attr_reader :cards, :count, :category

    def initialize (cards)
      @cards = cards

    end

      def cards_in_category(category)
        @cards.find_all do |card|
        card.category == category
      end
      end

      def card_count
        @cards.count
      end

  end
