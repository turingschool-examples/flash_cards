#class file for Turn

class Turn
  attr_reader :user_guess, :card
  def initialize(user_guess, card)
    @user_guess = user_guess
    @card = card
  end

  def guess
    @user_guess
  end

  def card
    @card
  end

  def correct?
    @user_guess == @card.answer
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
