class Turn
  attr_reader :guess, :current_card, :answer

  #don't remember if order of def matters, operating as if it does
  # def card_options #some type of operation to have a card bank, is there a ruby random operator?
  #
  # end

  def initialize(guess, current_card) #initializes the turn class with basic properties, a string and the current card being shown
      @guess = guess
      @current_card = current_card
      @answer = "This is the answer" #maybe eventually calling on an answer array?
      # so I need to have an array or if block of available questions and what their answers are
  end

  def card
    @current_card #implicit return of current_turn which is a string right now
  end

  def correct?
    @answer.include?(@guess)
  end
end
