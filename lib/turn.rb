class Turn
  attr_reader :guess,
              :card,
              :category
  def initialize(guess, card)
    @guess = guess
    @card = card
    @category = category
  end
end
