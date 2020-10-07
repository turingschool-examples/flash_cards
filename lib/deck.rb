class Deck
  attr_reader :cards, :keep

  def initialize(cards)
    @cards = cards
    @keep = []
  end



   def count
     cards.count
   end

   def add_cards(card)
     @cards << card
   end

  def category
    @category
  end


  def cards_in_category(name)
  cards.each do |x|
    if @category == name
      @keep << name
    end
  end
  end

end
