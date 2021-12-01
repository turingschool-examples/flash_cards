

class Turn
  attr_reader :string, :card
  def initialize(string, card)
    @string = string
    @card   = card
  end

  def guess
     @string
  end

  def card
    @card
  end
# binding.pry

  def correct?
    @string == card.answer
  end

  def feedback
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
#binding.pry
