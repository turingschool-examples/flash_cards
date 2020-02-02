class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
    #fix this dont put methods in here

  end

  def count
    @cards.length
  end
#could use .select here to condense this with just .select {|card| card.category == card_category}
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
