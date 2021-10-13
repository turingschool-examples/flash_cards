# create Deck class
class Deck
  # create reader for cards
  attr_reader :cards

  # initialize class
  def initialize(cards)
    @cards = cards
  end

  # create count method
  def count
    self.cards.count
  end

  # create cards_in_category method
  def cards_in_category(category)
    # create aggregator array
    cards_in_category = []
    # loop though all cards and check their category.
    self.cards.each do |card|
      # if correct category, add to temp cards_in_category array
      if card.category == category
        cards_in_category << card
      end
    # return array that only has those cards that meet the category requirement
    cards_in_category
    end

  end

end
