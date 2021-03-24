class Turn
  attr_accessor :string,
                :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess()
    guess = @string
  end

  def card()
    card = @card
  end

  def correct?()
    if guess == @string
      puts true
    end
  end

  def feedback()
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end
