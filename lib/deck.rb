class Deck
  attr_accessor :card_array

  def initialize(input) # Declare internal variable
    @card_array = input
  end


  def cards # Return  internal array
    self.card_array
  end

  def count # Return array size
    self.card_array.length()
  end

  def cards_in_category(x)

    self.card_array.select do |i| # Iterate through our internal array - only select and return objects who's category == user key input

      i.category == x

    end

  end

end
