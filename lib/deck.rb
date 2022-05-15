class Deck
  attr_reader :cards, :stem_cards, :geography_cards, :turing_cards, :pop_cards
  def initialize(cards)
    @cards = cards
    @stem_cards = []
    @geography_cards = []
    @turing_cards = []
    @pop_cards = []
    cards.each do |card|

    if card.category == :STEM
      @stem_cards << card
    elsif card.category == :Geography
      @geography_cards << card
    elsif card.category == :Turing
      @turing_cards << card
    elsif card.category == :Pop
      @pop_cards << card
  end
end
end

  def count
    cards.count
  end

  def cards_in_category(category)
    if category == :STEM
      @stem_cards
    elsif category == :Geography
       @geography_cards
     else
       return []
    end
  end
  # ^^find cleaner way if time allows
end
