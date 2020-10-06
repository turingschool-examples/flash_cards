class Turn

attr_reader :guess
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def return_card
    @card    
  end
end
