#~/deck.rb

class Deck
  attr_reader :flash_cards
  def initialize(flash_cards)
    @flash_cards = flash_cards
  end

  def cards_in_category(requested_category)
    catagorized_cards = []
    @flash_cards.each do |card|
      if requested_category == card.category
        catagorized_cards << card
      end
    end
  end

  # def cards_in_category(requested_category)
  #   @flash_cards.map do |flash_card|
  #     if requested_category == flash_card.category
  #       cards_in_category
  #     end
  #   end
  #
  # end


end
