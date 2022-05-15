class Turn
  attr_reader :guess, :current_card, :wrong_or_right

  #don't remember if order of def matters, operating as if it does
  # def card_options #some type of operation to have a card bank, is there a ruby random operator?
  #
  # end


  def initialize(guess, current_card) #initializes the turn class with basic properties, a string and the current card being shown
      @guess = guess
      @current_card = current_card

      # @wrong_or_right = @current_card.answer.include?(@guess)
      # so I need to have an array or if block of available questions and what their answers are

  end

  def card
    @current_card #implicit return of current_turn which is a string right now
  end

  def correct?
    @wrong_or_right = @current_card.answer.include?(@guess)
    # = @answer.include?(@guess)
  end

  def feedback
    if @wrong_or_right == TRUE
      "Correct!" #implicit return?? (otherwise nill or doubled)
    elsif @wrong_or_right == FALSE
      "Incorrect." #implicit return
    end
  end

end
