class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards #array
  end

  def count
    cards.count
  end

  def current_card(card_num)
    cards[card_num]
  end

  def cards_in_category(category)
    cards.each do |this_card|
      if this_card.category == category
        puts this_card
      end
    end
  end

end
