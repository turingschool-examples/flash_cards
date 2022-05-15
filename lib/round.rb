class Round
  attr_reader :deck, :turns, :turn_counter, :correct, :num
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
    @num = 0
  end


  def rotate_cards
    @deck.cards.rotate
  end
  def current_card #can i use a rotate method here instead
    # @deck.cards.rotate
    # @deck.cards[0]
    rotate_cards
    p rotate_cards[0]
  end

## i want to rotate the array of cards (deck)
##so that the current card is the new first card
  def add_1_to_turn
    @turn_counter += 1
  end

  def take_turn(guess)
    new_turn = Turns.new(guess, current_card)
      if new_turn.guess == new_turn.card.answer
        add_1_to_correct
      end
      @turns << new_turn

      add_1_to_correct

      new_turn

  end

  def correct?
    take_turn.guess == take_turn.answer
    true
  end

  def add_1_to_correct
    @correct += 1
    return @correct
  end


  def number_correct
    add_1_to_turn
  end


  def number_correct_by_category(cat)
    #this method should take a category as arg
    number_correct
  end
    #and then return the integer value of how
    #many guesses were correct based on that category

  def percent_correct(x, y)
    x/y * 100
  end

  def percent_correct_by_category(cat)
    number_correct * 100
  end


end
