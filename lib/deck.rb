class Deck

  attr_reader :cards, :count#, :category

  def initialize (cards)
    @cards = cards
    @count = cards.count
    # @category = cards.category
  end

  def cards_in_category(cat)
    # @cards << []
    @cards.find_all do |card|
      card.category == cat
    end
  end

  #
  # def cards_in_category(cat)
  #
  #   cards.each do |x|
  #     if x.category == y
  #       cards2 << x
  #     end
  #   p cards2
  #   end
  # end
end
