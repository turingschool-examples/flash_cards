class Deck
  attr_reader :cards, :category

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end
# call back to card file to use @category ???


  def cards_in_category(category)
    @category = category
    @cards_pile = []

    @cards.each do |card|
      # require "pry"; binding.pry
      if card.category == @category
        @cards_pile << card
        # require "pry"; binding.pry
        # puts "FUCKKK"
    # each do OR find_all ????
      end
    end

    @cards_pile # <--- STEM cards captured
  end

end
