class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = @cards.count()
  end

  def cards_in_category(selected_category) #selected category = category you're searching extend for
     #setting iterate# to current count will (if i == @count, break)

    current_search = []

    i = 0
    @count.times do
      if @cards[i].category == selected_category
        current_search << @cards[i]
      i += 1
    end

      return current_search #will iterate through each card category @count times and if it finds a card in that category it adds it to current_search to return array after.
    end


  end
end
