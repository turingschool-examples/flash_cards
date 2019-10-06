
require_relative 'card'

class Deck
  attr_reader :cards, :unused_cards

  def initialize(cards)
    @cards = cards
    @unused_cards = cards.dup
  end

  def count
    cards.length
  end

  def draw
    cards.sample
  end

  def remove_from_deck(card)
    @unused_cards.delete(card)
  end

  def random_cards(num)
    cards.sample(num)
  end

  def list_categories
    cards.uniq {|card| card.category}.map {|card| card.category.to_s}
  end

  def cards_in_category(category)

    list = cards.select do |card|

      card.category.to_s == category

    end
    if list == nil
      "Invalid input"
    else
      list
    end
  end

end

