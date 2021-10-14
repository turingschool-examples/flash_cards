class Round
  # provide read/write methods for the current_card and turns objects
  attr_accessor :current_card,
                :turns
  # create read methods for the deck object
  attr_reader :deck


  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end



  def take_turn(guess)
    # create Turn object with guess and current card
    turn = Turn.new(guess, self.current_card)
    # store turn / guess
    self.turns << turn
    # move deck to next card
    # make current card the next card in deck and put the previous current card to end of deck
    # get cards array from current deck and add current card to end
    cards = deck.cards.concat([self.current_card])
    # remove first card
    cards.shift
    # set current card to the first card and return
    self.current_card = cards[0]
    # create new deck with reorganized cards
    @deck = Deck.new(cards)
    # return current turn
    turn
  end


  # collect total number of correct turns
  def number_correct
    # create aggregator - initalize at 0
    total_correct = 0
    # iterate through all turns
    self.turns.each do |turn|
      # if turn has a correct guess, add one to the correct guess sum aggregator
      if turn.correct?
        total_correct += 1
      end
    end
    # return the total number of correct guesses
    total_correct
  end


  # collect total number of correct turns by category
  def number_correct_by_category(category)
    # isolate only turns where cards are in category
    cat_turns = []
    self.turns.each do |turn|
      if turn.card.category == category
        cat_turns << turn
      end
    end
    #check total number correct in this category specific turns array
    # create aggregator - initalize at 0
    total_correct = 0
    # iterate through all turns in category specific turns array
    cat_turns.each do |turn|
      # if turn has a correct guess, add one to the correct guess sum aggregator
      if turn.correct?
        total_correct += 1
      end
    end
    # return the total number of correct guesses
    total_correct
  end


  # method to return the % of correct guesses
  def percent_correct
    # divide the current # of correct guesses by the total # of turns
    # multiply by 100 to change from fraction to percent
    if turns.length > 0
      perc = (self.number_correct.to_f / self.turns.length)* 100
    else
      perc = 0
    end
    return perc
  end


  # method to return the % of correct guesses based on category
  def percent_correct_by_category(category)
    # get # of turns in category
    cat_turns = []
    self.turns.each do |turn|
      if turn.card.category == category
        cat_turns << turn
      end
    end
    # divide the current # of correct guesses by the total # of turns
    # multiply by 100 to change from fraction to percent
    if cat_turns.length > 0
      perc = (self.number_correct_by_category(category).to_f / cat_turns.length)* 100
    else
      perc = 0
    end
    return perc
  end
end
