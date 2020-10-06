require '../lib/card'  # => true

class Turn
  attr_reader :string, :card  # => nil

  def initialize(string, card)
    @string = string
    @card = card
  end                           # => :initialize

  def guess
    @string
  end        # => :guess

  def card
    @card
  end       # => :card

  def correct?
    if @string == card.answer
      true
    else
      false
    end
  end                          # => :correct?

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end                    # => :feedback
  
end  # => :feedback
