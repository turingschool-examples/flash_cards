# Create a Deck class with an accompanying test file. A Deck is initialized with an array of Card objects. A Deck should also be able to return cards based on a given category.
class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = @cards.count() #not sure if should make individual method - .count() counts the # of objects in array
  end

  def cards_in_category(selected_category) #selected category = category you're searching extend for
     #setting iterate# to current count will (if i == @count, break)

    current_search = []
    # couldn't figure out how to use  do
    # @cards.each do |card|
    #   if @cards.category == selected_category
    #     current_search << card
    #   end

    i = 0
    @count.times do #will iterate through each card category and add to current search to print
      if @cards[i].category == selected_category
        current_search << @cards[i]
      i += 1
    end

      return current_search
    end


  end
end
