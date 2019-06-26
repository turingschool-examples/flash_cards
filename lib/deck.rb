class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.size
  end

  def cards_in_category(category)
    new_array = []
    # cards.each do |card|
    #   if category == card.?.category
    #     new_array << @cards[number]
    #   end
    # end
    if category == cards[0].category
      new_array << cards[0]
    end
    if category == cards[1].category
      new_array << cards[1]
    end
    if category == cards[2].category
      new_array << cards[2]
    end
    new_array
  end
end
