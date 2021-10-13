class Turn

  attr_accessor :user_guess,
                :card_data

  def initialize(string, card)

    @user_guess = string
    @card_data = card
  end

  def guess
    @user_guess
  end

  def card
    @card_data
  end

  def correct?
    @user_guess == @card_data.answer
  end

  def feedback
    if correct? == true
      return "Correct!"
    elsif correct? == false
      return "Incorrect"
    end
  end

end
