require './lib/card'
class Turns
  attr_accessor :string
  def initialize(string, card)
    @string = string
  end
  def guess
    string
  end
  def card(card)
    card
  end
  def correct?

  end
  def feedback
  end
end
