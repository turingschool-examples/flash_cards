class Turn

  attr_reader :guess, :card, :turn

  def initialize(guess, card)
    #@turn = []
    @card = card
    #@turn_counter = []
    @guess = guess
  end

  def correct?
     @guess == card.answer
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect!"
    end
  end


  # def incorrect?
  #   @guess != card.answer
  #   puts "Incorrect!"
  #
  # end






end
