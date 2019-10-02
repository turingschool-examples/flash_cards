require './lib/card'


def initialize(string, card)
  @string = string
  @card = card
end

def guess
  #this method returns the guess
  @card.answer
end

def card
  @card
end

def correct?
end

def feedback
end
