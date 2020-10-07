class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end



   def count
     cards.count
   end

   def add_cards(card)
     @cards << card
   end

   def cards_in_category(name)
    cards.select {|x| x.category == name}
   end


  # def cards_in_category(name)
  #   cards.each do |x|
  #     if @cards.category == name
  #       keep << name
  #     end
  #   end
  # end

end
