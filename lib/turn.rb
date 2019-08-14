class Turn
  attr_accessor :string, :Card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
   turn.guess
  end

  def card
    turn.card
  end

  def correct?
    turn.correct?
  end

  def feedback
    turn.feedback
    puts "Correct!"
  end
end

turn = Turn.new("Juneau", card)
