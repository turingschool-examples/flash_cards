class Turn
  attr_reader :card
  def initialize(capital, card)
    @capital = capital
    @card = card
    @correct = true
  end

  def guess
    @capital
  end

  def correct?
    @correct
  end

  def feedback
    "Correct!"
  end
end
