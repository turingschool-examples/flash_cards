class Turn
  attr_reader :guess, :card


  def initialize(answer_guess, card)
    @guess = answer_guess
    @card = card
  end

end
