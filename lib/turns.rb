class Turn
  attr_accessor :turn_guess, :card_actual
  def initialize (turn_guess, card_actual)
    @turn_guess = turn_guess
    @card_actual = card_actual
  end

  def guess
      turn_guess
    end
