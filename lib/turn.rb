#Turn class to compare player input to card object
#returns if correct or incorrect

class Turn
  attr_reader :player_guess,
              :card,
              :correct

  def initialize(guess, card)
    @player_guess = guess
    @card = card
    @correct = []
  end

  def correct?
    @player_guess = player_guess.downcase
    card_answer = @card.answer.downcase

    if @player_guess == card_answer
      @correct = true
    elsif @player_guess != card_answer
      @correct = false
    end

  end

  def feedback
    # correct?
    @correct == true ? 'You are correct!' : 'You are incorrect!'
  end

end
