class Turn
  attr_reader :guess, :current_card

  def initialize(guess, current_card) #initializes the turn class with basic properties, a string and the current card being shown
      @guess = guess
      @current_card = current_card
  end

end
