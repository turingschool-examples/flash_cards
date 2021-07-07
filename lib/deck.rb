class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end



  def cards_in_category(category)

    @category_chapter = []


    @cards.each do |card_sort|
      if card_sort.category == category
        @category_chapter << card_sort
      end
    end

    @category_chapter
  end


end
