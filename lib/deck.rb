class Deck
  attr_reader :cards,
              :count

  def initialize(count)
    @cards = []
    @count = count
  end

  def add_cards(card)
    @cards << card
  end

  def count_cards
    @count = cards.length # not .count(iterates through each)
  end

  def cards_in_category(filter)
    @cards.find_all do |card|
     card.category == filter
    end
  end
end
