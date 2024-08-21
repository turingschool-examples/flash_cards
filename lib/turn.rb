class Turn
  attr_reader :player_guess,
              :card,
              :correct

  def initialize(guess, card)
    @player_guess = guess
    @card = card
  end

  def correct?
    @player_guess = player_guess.downcase
    card_answer = @card.answer.downcase

    if @player_guess == card_answer
      @correct = true
    elsif @player_guess != card_answer
      @correct = false
      #feature not yet added
    # else
    #   puts 'Invalid input try again'
    end

  end

end
