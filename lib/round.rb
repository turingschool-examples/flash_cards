class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = [] 
  end

  def current_card
    @deck.cards.first  
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card) 
    @turns << turn
    @deck.cards.shift
    turn
  end

# take_turn - take an guess(string)
# create new TURN OBJECT with guess and current_card
# store this new TURN OBJECT (shovel into array)
# and new TURN OBJET from the take_turn method (final return)
# when take_turn method is called, round should move onto next card in deck (aka new current card)


# method that returns the number of correct guesses
# the method is called number_correct
# there are no parameters
# it returns an integer
# i have an array of turns
# in the turn object i can call correct? which will return a boolean
# count the number of trues
# hint: there is an enumerable that can count he number of trues

end