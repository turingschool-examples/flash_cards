require './lib/card'
require './lib/turn'
require './lib/deck'


class Round

  attr_accessor :deck

  def initialize(deck)
    @deck = deck
end


  def current_card
    @cards
  end
  #
  def take_turn(guess)
    if @guess == @answer
      new_turn = Turn.new(guess, card)
    end
  end

  def turns
    round.count
  end
  #
  def class
    Turn
  end


  def correct?
    card.answer == @guess
  end

  def number_correct_by_category(cat)
    if correct?
      correct?.category
  end



  end
  #
  # # def number_correct
  # #   if correct
  # #      <<
  #
  # def percent_correct

end
