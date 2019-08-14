class Turns
  attr_accessor :string, :Card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
   .getschomp
  end

  def card
    @card
  end

  def correct?
    @answer = true
  end

  def feedback
    if @answer = true
      then puts "Correct!"
    else puts "Incorrect."
  end
end
