#Turn class will have following methods
#initialize(string, card) string argument representing
# a guess to card's question. second argument is a card object
#representing current card shown

#guess() method returns the guess
#card() method returns the Card
#correct?() method returns boolean indicating if
#guess matches answer
#feedback() method returns either correct of incorrect

class Turn < Card
  attr_reader :guess, :card_obj

  def initialize(guess, card_obj)
    @guess = guess
    @card_obj = card_obj
  end

  def card
    return @card_obj
  end

end
