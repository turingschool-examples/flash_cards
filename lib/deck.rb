class Deck

  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = @cards.length

  end

  def cards_in_category(category)
    loop_count = 0
    category_array = []
    loop do

      if loop_count == @count
        break
      end

      if @cards[loop_count].category == category
        category_array << @cards[loop_count]
      end

      loop_count +=1


    end

    return category_array

  end
    
end