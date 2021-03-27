class Deck
  attr_reader :cards,
              :count

  def initialize(cards, count)
    @cards = []
    @count = count
  end

  # def add_card(cards)
  #   @cards << card
  # end
  #
  # def count
  #   @count = cards.length
  # end

end
