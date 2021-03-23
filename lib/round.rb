# ## ISSUES TO RESOLVE:
# Not iterating through card deck - stuck on first card
# Need to ID how to define number correct as separate method (started, not finished)
# Need to build all tests beyond initialization

class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end


  def take_turn(guess)
    # create a new turn object based on the guess, return it
    @turn = Turn.new(guess, current_card)
    # store this turn
    @turns << [@turn]
    # move on to the next card - NOT WORKING
    new_index = @turns.length
    puts "New index is #{new_index}"
    current_card = @deck.cards[new_index]
    # return the turn
    return @turn
  end

  def number_correct # NOT WORKING
    @turns.count do |turn| #Error here that .correct not recognized as method
      turn.correct? # ERROR: NoMethodError: undefined method `correct?' for #<Array:0x0000000157255208>
    end
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f) * 100
  end

  def number_correct_by_category(category)

  end

end
