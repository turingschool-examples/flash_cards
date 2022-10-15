class Deck
  attr_reader :guess, :card
  def initialize (cards)
    @card = cards
  end

  def count
    card.length
  end


  def cards_category(category)


    category_collection = []
    @card.each do |card1|

      if card1.category == category
        category_collection << card1
      end
    end
    return category_collection
  end
end
