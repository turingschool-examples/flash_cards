class Round
  attr_reader :deck, :turns, :current_card, :current_turn, :number_correct, :correct_qs

  def initialize(deck)
    @deck = deck #deck of cards for this round
    @turns = [] #initialized with empty array
    @current_turn = 0 #to iterate through deck depending on turn
    @number_correct = 0 #inititalized with 0
    @correct_qs = [] #placeholder array for correct answers

  end


  def current_card #moved to individual method to make sure it updated the iteration
    @current_card = @deck.cards[@current_turn]#initializes current card with first card of deck
    return @current_card
  end

  def take_turn(guess_string)

    if @current_turn > @deck.count #checks to make sure you stay within array bounds
       return  "you have reached the limit of questions"

    else
      new_turn = Turn.new(guess_string, @current_card)
      @turns << new_turn #shovel guesses into turns array
      @current_turn += 1 #incrementing current # of turns

      if new_turn.correct?
        @number_correct += 1 #increments correct if correct
        @correct_qs << @current_card #will send in current card
      end

      return new_turn
    end
  end

  def number_correct_by_category(category_choice) #will send in a searchable category
    num_right = 0 #initialized with 0, will increment for correct # for given category
    @number_correct.times do #however # correct times, iterate through correct_qs array and check category of choice
        if @correct_qs[num_right].category == category_choice
          num_right += 1
        end
    end

    return num_right
  end

  def percent_correct #not sure if percent correct total or currently?
    total_correct = @number_correct.to_f / @current_turn.to_f * 100.00 #divides total number of questions by number of correct and returns as float
    return total_correct
  end

  def percent_correct_by_category(category_choice)
    cat_choice_qs = 0 #number of questions for given category choice
    i = 0
    @deck.count.times do #however number of # in deck, .times do
      if @deck.cards[i].category == category_choice
        cat_choice_qs += 1
      end
      i += 1 #incrementing through card decks
    end

    total = (number_correct_by_category(category_choice) /cat_choice_qs).to_f * 100

  end

end
