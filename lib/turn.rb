class Turn
  attr_reader :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def feedback
    if asset_equal @guess, @card == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

  def correct?
    if asset_equal @guess, @card == true
      return true
    else
      return false
    end
  end
