#class file for Deck classs

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category_in_question)
    cards_in_same_category = Array.new()
    @cards.each do |card|
      if card.category == category_in_question
        cards_in_same_category.push(card)
      end
    end
    cards_in_same_category
  end

end
