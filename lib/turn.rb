class Turn

  attr_reader :string, :card, :guess, :correct, :feedback

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    #this method returns the guess
  end

  def correct?
    
  end

  def feedback
    if @correct == true
      puts "Correct"
    else
      puts "Incorrect."
    end
  end

end
