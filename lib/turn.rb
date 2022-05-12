class Turn
  attr_reader :guess, :card, :correct, :feedback, :user_guess, :guess_rsult

  def initialize(answer, card)
    @guess = guess
    @card = card
    @correct = correct
    @feedback = feedback
    @users_guess = []
    @guess_result = []
  end

end
