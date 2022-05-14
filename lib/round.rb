class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    @turn_counter = 0
    @turns = []
  end

  def current_card
    deck.cards[@turn_counter]
  end



  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @turn_counter += 1
    return turn
  end

  def number_correct
    count_of_correct = 0
    if @answer == @guess
        count_of_correct += 1
    end
  end

end


#FIX round.turns so that the collection
# of array works. right now still
# printing [] after it should
# have a turn stored in it

#fixing that^ will fix the
#round.turns.count

#is feedback not a method yet?
#
