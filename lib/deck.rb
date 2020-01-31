class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards
    #avoid methods in initialize
    @count = cards.length
  end


#you need to get a category with deck.cards_in_category(:Category) and use that input to find the corresponding array

  def cards_in_category(card_category)
    card_cate = []
    @cards.each do |card|
      if card.category == card_category
        card_cate << card
      end
    end
    card_cate
  end
end
