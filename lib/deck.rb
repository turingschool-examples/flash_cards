class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards
    @count = cards.length
  end




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
