require 'card'

class Turn
    attr_reader :guess, :card
    def initialize(guess, card)
        @guess = guess
        @card = card
       #puts "Initialized Turn with card: #{@card.inspect}"
    end

  def correct?
    @guess.downcase == @card.answer.downcase
  end
  
  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

end