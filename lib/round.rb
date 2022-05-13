class Round

  attr_reader :deck, :card, :turn, :turns, :turn_index, :guesses_correct
#Initalizes a round object with a argument deck. This has a empty turns
#array,and a int turns_index.
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_index = 0
    @guesses_correct = 0

  end

# This function takes a argument guess, and sets it to a turn object.
#adds that turn object to our turn array and incrementally increases our turn.
#index by 1. This block also checks if the turn was correct, and adds 1 to the guesses_correct.
  def take_turn(guess)

    @turn = Turn.new(guess, current_card)
    @turns << @turn
    @turn_index += 1

    if @turn.correct? == true
      @guesses_correct += 1
    end
     return @turn
  end
#This function returns the element of our cards array in our deck object at the
#position indicated by turn_index
  def current_card

    @deck.cards[@turn_index]

  end
#This returns the number of correct guesses based on what's in our array of
#given guesses
  def number_correct
    @guesses_correct
  end
#This returns a percentage correct by taking the number of correct answers and
#dividing it by the turn index. integer math ruby rounds to zero, so had to cast
#to floats.
  def percent_correct
    (@guesses_correct.to_f/ @turns.count.to_f) * 100
  end
#This creates a local correct_by_category variable then runs an each loop for
#every turn in my turns array. If the turn has a correct guess AND it's a part
#of that category, it'll add it to the local variable correct_by_category.
  def number_correct_by_category(category)
    correct_by_category = 0
    turns.each do |turn|
    if turn.correct? && turn.card.category == category
      correct_by_category += 1
    end
  end
    return correct_by_category
  end
  #

  #
  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f/ deck.cards_in_category(category).length.to_f) * 100
  end
end
