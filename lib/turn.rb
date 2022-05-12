class Turn

  attr_reader :string, :card, :guess, :correct, :feedback

  def initialize(string, card)
    @string = string
    @card = card
  end

  def correct?
    string == card.answer
  end

  def feedback
    if correct? == true
      puts "Correct"
    else
      puts "Incorrect."
    end
  end

end
