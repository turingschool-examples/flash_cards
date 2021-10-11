class Turn
  attr_reader :card,
              :guess
  def initialize(string, card)
    @guess = string
    @card = card
  end

end
