class Round

  attr_reader :deck, :card, :turn, :turns, :turn_index
# Initalizes a round object with a argument deck. This has a empty turns array, and a int turns_index.
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_index = 0
  end
#This function takes a argument guess, and sets it to a turn object.
#adds that turn object to our turn array and incrementally increases our turn index by 1
  def take_turn(guess)
    @turn = Turn.new(guess, card)
    @turns << @turn
    @turn_index += 1
    return @turn
  end
#This function returns the element of our cards array in our deck object at the position indicated by turn_index
  def current_card

    @deck.cards[@turn_index]

  end

  def number_correct
  end

  def number_correct_by_category(category)
  end

  def percent_correct
  end

  def percent_correct_by_category
  end

end
