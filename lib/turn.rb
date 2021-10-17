class Turn
  attr_accessor :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

    # if card.answer == turn.string
    #   puts "correct!"
    # end

  def correct?
    guess == card.answer
    # require 'pry'binding
  end

  #  how in the world did this pass?! @guess isn't even
  # a defined variable

  # def correct?
  #     require 'pry'; binding.pry
  #   if @guess == @answer
  #     true
  #   else
  #     false
  #   end
  # end


  def feedback
    if correct? == true
      "correct!"
    elsif correct? != true
      "incorrect!"
    end
  end

end
