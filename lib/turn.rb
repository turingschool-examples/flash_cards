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

  #new_turn references take_turn in round class
  # def new_turn(string)
  #   @guess = string
  # end

end
