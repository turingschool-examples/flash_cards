class Turn
  attr_reader :string, :card, :guess, :correct, :feedback, :anwser
  def initialize(string, card)
    @card = card
    @guess = string
    @correct = true
    @feedback = "Correct!"
  end


  def correct?
    if @correct == true
      correct == true
    else correct == false
    end
  end

end
