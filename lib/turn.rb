class Turn

  attr_reader :guess, :correct, :card, :response
  #initialize with *string for @guess* and card (variable created in test)
  def initialize(string, card)
    @guess = string
    @card = card
    @correct = nil
    @response = ""
  end
  #def correct?
  def correct?
    ######### DON'T NEED IF BECAUSE COMPARISON == GIVES BOOLEAN
    #@guess and card.answer are the two items being compare
    #if matching, guess is correct
    if @guess == card.answer
      #store matching status into @correct attribute, defaulted as nil
      @correct = true
    else @correct = false
    end
  end
  #def feedback which responds to correct? boolean
  def feedback
    if @correct == true
      @response = "That's correct!"
    else @response = "Sorry, but no..."
      return response
    end
  end

  #create method that takes turn instance and puts into round
  # def new_turn(string)
  #   @guess = string
  # end

end
