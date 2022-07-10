require './lib/card'

class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards
    @count = @cards.length
  end
  #
  # def cards()
  #   @cards
  # end
  #
  # def count()
  #   @count
  # end

  def cards_in_category(category)
    cards_in_cat = []
    @cards.each do |card|
      if card.category == category
        cards_in_cat << card
      end
    end
    cards_in_cat
  end
end
