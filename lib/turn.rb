class Turn

def initialize(guess, card_parameter)
  @guess = guess
  @card = card_parameter

end

def read_card(card_name)
  @card << card_name
end

end
