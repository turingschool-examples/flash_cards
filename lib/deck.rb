#~/deck.rb

class Deck
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


end
