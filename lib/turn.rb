class Turn ()
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?(guess)
    @guess == card.answer

  end
  def feedback(guess)
    if correct?(guess)
      return "Correct!"
    elsif !correct?(guess)
      return "Incorrect."
    else
      puts "Error"
    end

  end
end
