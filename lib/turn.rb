class Turn

  attr_accessor :user_guess,
                :card_data

  def initialize(string, card)

    @user_guess = string
    @card_data = card
  end

  def card
    @card_data
  end

  def correct? # Wanted capitalization to not matter in user input.
    @user_guess.downcase == @card_data.answer.downcase
  end

  def feedback
    if correct? == true
      return "Correct!"
    elsif correct? == false
      return "Incorrect"
    end
  end

end
