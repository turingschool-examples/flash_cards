class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def count
    cards.length
  end

  def cards_in_category(filter_category)
    # cat_cards = []
    # cards.each do |card|
    #   if card.category == filter_category
    #     cat_cards << card
    #   end
    # end

    # cat_cards

    cat_cards = cards.map do |card|
      card.category == filter_category  
    end

    cat_cards
  end


end