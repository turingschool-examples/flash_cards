class Turn
  attr_reader :guess, :current_card, :answer, :wrong_or_right

  #don't remember if order of def matters, operating as if it does
  # def card_options #some type of operation to have a card bank, is there a ruby random operator?
  #
  # end


  def initialize(guess, current_card) #initializes the turn class with basic properties, a string and the current card being shown
      @guess = guess
      @current_card = current_card
      @answer = "This is the answer" #maybe eventually calling on an answer array?
      @wrong_or_right = FALSE #start false
      # so I need to have an array or if block of available questions and what their answers are

  end

  def card
    @current_card #implicit return of current_turn which is a string right now
  end

  def correct?(guess) #feel like it should be @guess but that gives errors
    @wrong_or_right = @answer.include?(guess) #works with guess here
    # return @wrong_or_right
  end

  def feedback(guess)
    if correct?(guess) #how to update this through correct?
    # if correct?(@guess) == TRUE
      puts "Correct!"
    else
      puts "Incorrect."
    end

  end

end
