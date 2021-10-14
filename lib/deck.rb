class Deck
  attr_reader :obj_array

  def initialize(card_input) # Declare internal variable
    @obj_array = card_input
  end


  def cards # Return  internal array
    self.obj_array
  end

  def count # Return array size
    self.obj_array.length()
  end

  def cards_in_category(x)

    self.obj_array.select do |i| # Iterate through our internal array - only select and return objects who's category == user key input

      i.category == x

    end

  end

end
