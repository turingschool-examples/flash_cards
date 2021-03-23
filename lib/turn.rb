class Turn
  attr_reader :guess,
              :card,
              :correct?,
              :feedback

  def initialize(guess, card, correct?, feedback)
    @guess
