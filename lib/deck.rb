require './lib/card'

class Deck
  attr_reader :category_groups, :cards
  def initialize(cards)
    @cards = cards
    @category_groups = cards.group_by do |card|
      card.category
    end
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    if category_groups.include?(category)
      category_groups[category]
    else
      []
    end
  end


end
