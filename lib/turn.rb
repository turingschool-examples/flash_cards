class Turn
    attr_reader :guess, :card
    def initalize(guess, card)
        @guess = guess
        @card = card
    end
  def correct?
    if guess = answer
        puts true
    else puts false
  end
end