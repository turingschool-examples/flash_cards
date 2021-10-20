class Deck
  attr_reader :cards

  def initialize (cards)
    @cards = cards

  end

  def count
    cards.length
  end

  def cards_in_category(type)
    categorize = cards.select do |card|
      card.category == type
      end
  end

  def categories
      cards.map(&:category).uniq
   end





end
