class Deck
    attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    array = []
    cards.select do |card|
      if card.category == category
        array << card
      end
  end
    

    
  #     ##I need to access the 3rd element
  #     # of eac h card block variable
  #     #I want to return an array
  #     #containing cards with the
  #     #same category
  #     #I think I need to use a shovel
  #     #Where does the empty array go?

  end




end
