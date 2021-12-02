#~/deck.rb

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(requested_category)
    catagorized_cards = []
    @cards.each do |card|
      if requested_category == card.category
        catagorized_cards << card
        #binding.pry
      end
    end
  end

  # def cards_in_category(requested_category)
  #   @flash_cards.select do |flash_card|
  #     category == card.category
  #   end
  #
  # end


end
