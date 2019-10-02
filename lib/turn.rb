class Turn
  attr_reader :guess, :current_fc
  
  def initialize(string, card)
    @guess = string
    @current_fc = card
  end
end
