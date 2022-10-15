class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    card.answer.downcase.split(" ")[1] == guess.downcase || card.answer.downcase.split(" ")[0] == guess.downcase || card.answer.downcase == guess.downcase
  end

  def feedback
    if correct? == true
      return 'Correct!'
      puts 'Correct!'
    else
      return 'Incorrect.'
      puts 'Incorrect.'
    end
  end
end
