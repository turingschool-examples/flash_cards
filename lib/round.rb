class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    # current card points to the top element of the card's Array
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    # It should create a new Turn object with the appropriate guess and Card.
    # use a method that grabs the first item in the array of cards,
    # returns that card, and shoves it into a new array
    turn_with_guess = Turn.new(guess, @deck.cards.shift) #find another way to
    # create a turn array that does not decrease the original array of the cards
    # each turn also needs to add a turn to a turns array
    @turns << turn_with_guess
    return turn_with_guess
  end
# --------------------------
  # def take_turn2(guess)
  #   # put new turns into @turns array without destroying @deck
  #   @turn_count +=1
  #   @turns = Turn.new(guess,
  #     @deck.cards.select {|card| card == @current_card2})
  # end
  #
  # def current_card2
  #   #maybe use the turns array to determine where in the card deck you are?
  # end
# ---------------------------
  def number_correct
    @num_correct_array = @turns.select do |turn|
      turn.correct?
    end
    @num_correct_array.length
  end

  def turns_per_category(category)
    turns_per_category_num = 0
    @turns.each do |turn|
      if turn.card.category == category
        turns_per_category_num += 1
      end
    end
    turns_per_category_num
  end

  def number_correct_by_category(category)
    @num_correct_by_category_array =
      @num_correct_array.select do |turn|
        turn.card.category == category
      end
    @num_correct_by_category_array.length
  end

  def percent_correct
    (self.number_correct.fdiv(@turns.length)*100).round(1)
  end

  def percent_correct_by_category(category)
    (self.number_correct_by_category(category).fdiv(self.turns_per_category(category))*100).round(1)
  end

end
