class Turn
  attr_reader :card, :guess

def initialize(guess_parameter, card_parameter)
  @guess = guess_parameter
  @card = card_parameter
end

end
