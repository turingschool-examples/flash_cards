class Round

  attr_reader :obj_deck, :obj_turns, :total_correct

  def initialize(input_deck)
    @obj_deck = input_deck
    @obj_turns = []
    @total_correct = []
  end

  def deck # Return internal deck
    self.obj_deck
  end

  def turns # Return internal turns array
    self.obj_turns
  end

  def current_card # Read first element of our deck array using our .cards class method
    self.obj_deck.cards[0]
  end


  def take_turn(user_guess)

    temp = Turn.new(user_guess, current_card) # Create a temporary object holder with our new 'turn' instance containing the current card and user guess


    if temp.card.answer == user_guess # Compare our current turn's card's answer to our user guess
      self.total_correct << self.obj_deck.cards[0] # Push copy of card if answer is correct (utilized for number by category and percent correct later)
    end

    self.obj_turns << self.obj_deck.cards.shift # Remove the current card from our 'deck' object's internal array, push it to our current 'round' object's turn array
    return temp # Return our new 'turn' instance

  end

  def number_correct_by_category(user_category)

    temp = [] # Temporary array for counting total correct in a given category

    temp << self.total_correct.select do |i| # Select all elements in total_correct[] who's category matches our user input

      i.category == user_category

    end

    return temp.size # Return total size of our temp[] array for total number correct by respective category
  end

  def number_correct # Return total number of questions that are correct
    self.total_correct.size
  end

  def percent_correct

    

  end




end
