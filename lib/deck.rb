class Deck
  attr_reader :cards, :count
  def initialize(cards)
    @cards = cards
    #avoid methods in initialize
    @count = cards.length
  end


#you need to get a category with deck.cards_in_category(:Category) and use that input to find the corresponding array

  def cards_in_category(card_category)

    card_category = []
    @cards.map.uniq do |card|
      if card.category == :STEM
        card_category << card
        require "pry"; binding.pry
      # elsif card.category == :Geography
      #   card_category << card
      end


      end


  end




end
