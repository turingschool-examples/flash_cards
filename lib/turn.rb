class Turn
attr_reader :card, :string

  def initialize(string, card)
    @string = string
    @card = card
  end

  def correct?
    @string == @card.answer
  end

  def feedback
    #require 'pry'; binding.pry
    correct? ? "Correct!" : "Incorrect."

  end
end
