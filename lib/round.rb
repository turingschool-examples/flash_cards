class Round
  attr_reader :deck_arg, :turns, :turns_counter

  def initialize(deck_arg)
    @deck_arg = deck_arg
    @turns = []
    @turns_counter =  0
    # @cards = cards
  end

  def current_card

    # require 'pry'; binding.pry
    # # make a method called current_card
    # method returns first card in array
    deck_arg.cards[@turns_counter]
    # require 'pry'; binding.pry

    # start turns counter at 0
    # when turns is called, + 1 to counter
    # shift current turns integer amount
    # turns_counter = 0
    # shift(turns_counter)
  end

  def take_turn(answer)
    # create a method called take_turn with 1 parameter
    # method creates a new instance of Turn class
    new_turn = Turn.new(answer, current_card)
    turns << new_turn
    # @turns << new_turn
    @turns_counter += 1
    new_turn
  end


    # number_correct pseudocode
    # if one "guess" is true, output 1
    # if two "guess" is true...... etc
    # call method correct?
    # call for each element in turns array
    # make another counter to add one
    # when method correct? returns true
    # return total amount of correct answers
    # in the counter

  def number_correct
    correct_counter = 0
    turns.each do |turn|
      if turn.correct?
       correct_counter += 1
      end
    end
     correct_counter
  end

  # round.turns[0].card.category

  # create an array with cards of same category
  # start counter for correct guesses
  # call correct? method
  # if correct is true && category matches arg, add to counter
  # if correct, add 1 to counter

# driver/ navigator unsuccessful attempt
  # categorical_correct_answers = 0
  # same_category = turns.filter do |turn|
  #    turn.card.category == named_category
  #  end
  #  #cards_in_category(named_category)
  # same_category.each do |card|
  #   if card.correct? == true
  #    categorical_correct_answers += 1
  #   end
  #   categorical_correct_answers


  def number_correct_by_category(named_category)
     @turns.count do |turn|
    named_category == turn.card.category && turn.correct?
      # correct_category_num += 1
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f)*100
  end

  # couldn't get this to run
  # def percent_correct_by_category(named_category)
  #   (number_correct_by_category(named_category).to_f / deck_arg.cards_in_category.to_f)*100
  # end
end
